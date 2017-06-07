FactoryGirl.define do
  sequence(:label) { |n| ("A".."ZZZ").to_a[n - 1] }
  sequence(:name) { |n| "The #{n.ordinalize} Name" }
  sequence(:nickname) { |n| "Nickname #{n}" }
  sequence(:description) { |n| "The #{n.ordinalize} Description" }
  sequence(:number) { |n| n.to_s }

  factory :alignment do
    level "Moderate alignment"
    outcome
    standard_outcome
  end

  factory :assignment do
    sequence(:name) { |n| "Problem Set #{n}" }
    sequence(:problem) { |n| "Question #{n}" }

    after(:build) do |assignment|
      if assignment.outcome_coverage.nil?
        coverage = create(:coverage)
        assignment.outcome_coverage = coverage.outcome_coverages.first
      end
    end
  end

  factory :attachment do
    file File.open("spec/fixtures/attachments/example.pdf")

    after(:build) do |attachment|
      if attachment.attachable.nil?
        assignment = create(:assignment)
        attachment.attachable = assignment
      end
    end
  end

  factory :course do
    name
    number
    department

    trait :with_unaligned_outcome do
      has_custom_outcomes true

      after(:create) do |course|
        create(:standard_outcome)
        create(:outcome, course: course)
      end
    end

    trait :fully_aligned do
      after(:create) do |course|
        outcome = create(:outcome, course: course)
        standard_outcomes = StandardOutcome.all.presence || [create(:standard_outcome)]

        standard_outcomes.each do |standard_outcome|
          create(:alignment, outcome: outcome, standard_outcome: standard_outcome)
        end
      end
    end
  end

  factory :department do
    sequence :slug do |n|
      "D_#{n}XX"
    end

    name
    number
  end

  factory :assessment do
    description
    minimum_requirement "7 points out of 10"
    name
    problem_description "Question 3, Integration by parts"
    target_percentage 80

    transient do
      course { create(:course) }
    end

    after(:build) do |assessment, evaluator|
      if assessment.outcomes.empty?
        assessment.outcomes << create(:outcome, course: evaluator.course)
      end

      if assessment.subject.nil?
        assessment.subject = build(
          :subject,
          department_number: assessment.department.number
        )
      end
    end
  end

  factory :outcome do
    nickname
    label
    description { "description for custom #{label}" }
    course
  end

  factory :result do
    assignment
    percentage 80
    year 2015
  end

  factory :standard_outcome do
    nickname
    label
    description { "description for standard #{label}" }
  end

  factory :subject do
    department
    number
    title { generate(:name) }
  end

  factory :user do
    sequence :email do |n|
      "user-#{n}@example.com"
    end
  end

  factory :coverage do
    transient do
      outcomes []
    end

    course
    subject

    after(:build) do |coverage, evaluator|
      if evaluator.outcomes.present?
        coverage.outcomes = Array(evaluator.outcomes)
      else
        coverage.outcomes = [
          build(:outcome, course: coverage.course)
        ]
      end
    end
  end
end
