FactoryGirl.define do
  sequence(:label) { |n| ("a".."zzz").to_a[n - 1] }
  sequence(:name) { |n| "The #{n.ordinalize} Name" }
  sequence(:number) { |n| n.to_s }

  factory :alignment do
    level "Moderate alignment"
    outcome
    standard_outcome
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

  factory :direct_assessment do
    description "Integration"
    minimum_requirement "7 points out of 10"
    name "Problem Set 1"
    problem_description "Question 3, Integration by parts"
    target_percentage 80

    after(:build) do |assessment|
      course = create(:course)
      assessment.outcomes << create(:outcome, course: course)
      unless assessment.subject.present?
        assessment.subject = build(
          :subject,
          department_number: course.department.number
        )
      end
    end
  end

  factory :other_assessment do
    description "Senior Thesis Completion"
    minimum_requirement "Somewhat satisfied"
    name "Percent of students who complete a senior thesis"
    target_percentage 80
    type "OtherAssessment"

    after(:build) do |assessment|
      assessment.outcomes << build(:outcome)
    end
  end

  factory :outcome do
    name { generate(:label) }
    description { "description for custom #{name}" }
    course
  end

  factory :participation do
    description "Undergraduation Research Project"
    minimum_requirement "Somewhat satisfied"
    name "UROP"
    target_percentage 80
    type "Participation"

    after(:build) do |assessment|
      assessment.outcomes << build(:outcome)
    end
  end

  factory :result do
    association :assessment, factory: :direct_assessment
    assessment_name "Problem Set 2"
    assessment_description "Multiplication"
    percentage 80
    year 2015
  end

  factory :standard_outcome do
    name { generate(:label) }
    description { "description for standard #{name}" }
  end

  factory :subject do
    department_number { generate(:number) }
    number
    title { generate(:name) }
  end

  factory :survey do
    description "Biennial survey administered to graduating seniors"
    minimum_requirement "Somewhat satisfied"
    name "Senior Survey"
    survey_question "How satisfied are you with advising in your major?"
    target_percentage 80
    type "Survey"

    after(:build) do |assessment|
      assessment.outcomes << build(:outcome)
    end
  end

  factory :user do
    sequence :email do |n|
      "user-#{n}@example.com"
    end
  end
end
