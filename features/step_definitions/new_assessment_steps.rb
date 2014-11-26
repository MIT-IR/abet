Given(/^a user is on the default outcomes page for a course$/) do
  step "I view the department's landing page"
  step "a user is on the interstitial page"
  step "a user chooses to adopt the default outcomes"
end

When(/^a user chooses to add an assessment for an outcome$/) do
	id = Outcome.first.id
	within("tr#outcome-#{id}") do
  		click_link "Add new assessment"
	end
end

Then(/^a user is given types of assessment to choose from$/) do
  expect(page).to have_content "Grade from an assignment, quiz, or exam"
  expect(page).to have_content "Survey results"
  expect(page).to have_content "Participation in program"
end

When(/^a user chooses a direct\-type assessment$/) do
  click_link "Grade from an assignment, quiz, or exam"
end

Then(/^a user sees the form for direct\-type assessments$/) do
  expect(page).to have_content "Subject number"
  expect(page).to have_content "Subject description"
  expect(page).to have_content "Semester"
  expect(page).to have_content "Assignment name"
  expect(page).to have_content "Assignment description"
  expect(page).to have_content "Minimum satisfactory grade"
  expect(page).to have_content "Target percentage"
  expect(page).to have_content "Actual percentage"
end

When(/^a user chooses a survey assessment$/) do
  click_link "Survey results"
end

Then(/^a user sees the form for survey assessments$/) do
  expect(page).to have_content "Survey name"
  expect(page).to have_content "Survey description"
  expect(page).to have_content "Year"
  expect(page).to have_content "Minimum category"
  expect(page).to have_content "Target percentage"
  expect(page).to have_content "Actual percentage"
end

When(/^a user chooses a participation assessment$/) do
  click_link "Participation in program"
end

Then(/^a user sees the form for participation assessments$/) do
  expect(page).to have_content "Program name"
  expect(page).to have_content "Program description"
  expect(page).to have_content "Year"
  expect(page).to have_content "Target participation percentage"
  expect(page).to have_content "Actual participation percentage"
end

When(/^a user chooses an other assessment$/) do
  click_link "Other"
end

Then(/^a user sees the form for other assessments$/) do
  expect(page).to have_content "Assessment name"
  expect(page).to have_content "Assessment description"
  expect(page).to have_content "Year"
  expect(page).to have_content "Target percentage"
  expect(page).to have_content "Actual percentage"
end

When(/^fills out the form with the following items:$/) do |table|
  table.rows_hash.each do |field, value|
    fill_in field, :with => value
  end
  select "2015FA", :from => :direct_assessment_semester
end

When(/^user clicks the submit button$/) do
  click_button "Submit"
end

Then(/^user sees the list of assessments$/) do
  expect(page).to have_content "18.02"
  expect(page).to have_content "Multivariable Calculus"
end
