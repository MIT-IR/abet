FactoryGirl.define do
  factory :outcome do
    sequence :name do |i|
      ("a".."z").to_a[i - 1]
    end
    description { "description for #{name}" }
    course
  end

  factory :course do
    sequence(:course_number) { |i| i.to_s }
    course_name "ChemE Flexible"
    department
  end

  factory :department do
    name "Chemical Engineering"
  end
end
