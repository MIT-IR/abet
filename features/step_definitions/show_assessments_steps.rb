Given(/^An outcome has the following assessments associated with it$/) do
	@course = Course.find_by_course_number("2")
	@outcomes = @course.outcomes
	@outcome = @outcomes.first
  	@dassessment = @outcome.direct_assessments.build(subject_number: "18.03", subject_description: "Diff Eq",
  		semester: "2015FA", assignment_name: "Exam 1", assignment_description: "Covers steady-state equations",
      	problem_description: "First-order differential equation solving", minimum_grade: "6 out of 7",
  		target_percentage: "80", actual_percentage: "90")
  	@dassessment.outcome = @outcome
  	if @dassessment.save 
  		puts "saved"
  	end
  	@outcome.indirect_assessments.create!(assessment_name: "Enrolled Student Survey", 
  		assessment_description: "Survey for all students", survey_question: "Ability to work in teams",
  		year: "2015", minimum_category: "Quite a bit or a Great deal", target_percentage: "80",
  		actual_percentage: "75")
end

Then(/^The user sees the link to existing assessments$/) do
  expect(page).to have_content("Show assessments")
end

When(/^The user clicks the link to existing assessments$/) do
  click_link("Show assessments")
end

Then(/^The user sees the existing assessments$/) do
  expect(page).to have_content("18.03")
  expect(page).to have_content("Enrolled Student Survey")
end