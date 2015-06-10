FactoryGirl.define do
  sequence(:label) { |n| ("a".."z").to_a[n - 1] }
  sequence(:name) { |n| "The #{n.ordinalize} Name" }
  sequence(:number) { |n| n.to_s }

  factory :course do
    name
    number
    department
  end

  factory :department do
    sequence :slug do |n|
      "D_#{n}XX"
    end

    name
  end

  factory :direct_assessment do
    description "Integration"
    minimum_grade "7 points out of 10"
    name "Problem Set 1"
    outcome
    problem_description "Question 3, Integration by parts"
    subject
    target_percentage 80
  end

  factory :other_assessment do
    description "Senior Thesis Completion"
    name "Percent of students who complete a senior thesis"
    outcome
    target_percentage 80
    type "OtherAssessment"
  end

  factory :outcome do
    name { generate(:label) }
    description { "description for custom #{name}" }
    course
  end

  factory :outcome_alignment do
    alignment_level "Moderate alignment"
    outcome
    standard_outcome
  end

  factory :participation do
    description "Undergraduation Research Project"
    name "UROP"
    outcome
    target_percentage 80
    type "Participation"
  end

  factory :standard_outcome do
    name { generate(:label) }
    description { "description for default #{name}" }
  end

  factory :subject do
    number
    title { generate(:name) }
  end

  factory :survey do
    description "Biennial survey administered to graduating seniors"
    minimum_category "Somewhat satisfied"
    name "Senior Survey"
    outcome
    survey_question "How satisfied are you with advising in your major?"
    target_percentage 80
    type "Survey"
  end

  factory :user do
    sequence :email do |n|
      "user-#{n}@example.com"
    end
  end
end
