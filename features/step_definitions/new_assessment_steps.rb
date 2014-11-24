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
  expect(page).to have_content "Subject Number"
  expect(page).to have_content "Subject Description"
  expect(page).to have_content "Semester"
  expect(page).to have_content "Assignment Name"
  expect(page).to have_content "Assignment Description"
  expect(page).to have_content "Minimum Satisfactory Grade"
  expect(page).to have_content "Target Percentage"
  expect(page).to have_content "Actual Percentage"
end

When(/^a user chooses a survey assessment$/) do
  click_link "Survey results"
end

Then(/^a user sees the form for survey assessments$/) do
  expect(page).to have_content "Survey Name"
  expect(page).to have_content "Survey Description"
  expect(page).to have_content "Year"
  expect(page).to have_content "Minimum Category"
  expect(page).to have_content "Target Percentage"
  expect(page).to have_content "Actual Percentage"
end

When(/^a user chooses a participation assessment$/) do
  click_link "Participation in program"
end

Then(/^a user sees the form for participation assessments$/) do
  expect(page).to have_content "Program Name"
  expect(page).to have_content "Program Description"
  expect(page).to have_content "Year"
  expect(page).to have_content "Target Participation Percentage"
  expect(page).to have_content "Actual Participation Percentage"
end

When(/^a user chooses an other assessment$/) do
  click_link "Other"
end

Then(/^a user sees the form for other assessments$/) do
  expect(page).to have_content "Assessment Name"
  expect(page).to have_content "Assessment Description"
  expect(page).to have_content "Year"
  expect(page).to have_content "Target Percentage"
  expect(page).to have_content "Actual Percentage"
end