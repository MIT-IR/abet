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
    actual_percentage 82
    assignment_description "Integration"
    assignment_name "Problem Set 1"
    minimum_grade "7 points out of 10"
    outcome
    problem_description "Question 3, Integration by parts"
    semester "2015FA"
    subject
    target_percentage 80
  end

  factory :other_assessment do
    actual_percentage 78
    assessment_description "Senior Thesis Completion"
    assessment_name "Percent of students who complete a senior thesis"
    outcome
    target_percentage 80
    type "OtherAssessment"
    year 2014
  end

  factory :outcome do
    name { generate(:label) }
    description { "description for custom #{name}" }
    course
  end

  factory :participation do
    actual_percentage 78
    assessment_description "Undergraduation Research Project"
    assessment_name "UROP"
    outcome
    target_percentage 80
    type "Participation"
    year 2014
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
    actual_percentage 78
    assessment_description "Biennial survey administered to graduating seniors"
    assessment_name "Senior Survey"
    minimum_category "Somewhat satisfied"
    outcome
    survey_question "How satisfied are you with advising in your major?"
    target_percentage 80
    type "Survey"
    year 2014
  end

  factory :user do
    sequence :email do |n|
      "user-#{n}@example.com"
    end
  end
end
