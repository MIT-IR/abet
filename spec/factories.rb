FactoryGirl.define do
  factory :course do
    sequence(:course_number) { |i| i.to_s }
    course_name "ChemE Flexible"
    department
  end

  factory :department do
    sequence :name do |n|
      "Department #{n} Name"
    end

    sequence :role_department do |n|
      "D_#{n}XX"
    end
  end

  factory :direct_assessment do
    actual_percentage 82
    assignment_description "Integration"
    assignment_name "Problem Set 1"
    minimum_grade "7 points out of 10"
    outcome
    problem_description "Question 3, Integration by parts"
    semester "2015FA"
    subject_description "Calculus"
    subject_number "18.01"
    target_percentage 80
  end

  factory :indirect_assessment do
    actual_percentage 78
    assessment_description "Biennial survey administered to graduating seniors"
    assessment_name "Senior Survey"
    minimum_category "Somewhat satisfied"
    outcome
    survey_question "How satisfied are you with advising in your major?"
    target_percentage 80
    year 2014
  end

  factory :outcome do
    sequence :name do |i|
      ("a".."z").to_a[i - 1]
    end

    description { "description for custom #{name}" }
    course
  end

  factory :standard_outcome do
    sequence :name do |i|
      ("a".."z").to_a[i - 1]
    end

    description { "description for default #{name}" }
  end

  factory :user do
    sequence :email do |n|
      "user-#{n}@example.com"
    end
  end
end
