When(/^user chooses to set up custom outcomes$/) do
  click_link("Create Custom Outcomes")
end

Then(/^user sees the custom outcomes interface$/) do
  expect(page).to have_content("Outcome id")
  expect(page).to have_content("Outcome description")
end