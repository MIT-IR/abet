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