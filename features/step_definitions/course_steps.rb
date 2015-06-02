Given(/^a department has the following courses:$/) do |table|
  meche = Department.find_by_name("Mechanical Engineering")
  @rows = table.hashes
  table.hashes.each do |row|
    Course.create(department: meche,
      course_number: row["Course Number"],
      course_name: row["Course Name"])
  end
end

When(/^I view the department's landing page$/) do
  meche = Department.find_by_name("Mechanical Engineering")
  visit department_path(meche)
end
