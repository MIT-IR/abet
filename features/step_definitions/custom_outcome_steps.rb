When(/^user chooses to set up custom outcomes$/) do
  click_link("Create Custom Outcomes")
end

Then(/^user sees the custom outcomes interface$/) do
  expect(page).to have_content("Outcome")
  expect(page).to have_content("Outcome description")
end

When(/^user fills out custom outcome form with the following items:$/) do |table|
  table.rows_hash.each do |field, value|
    fill_in field, :with => value
  end
end

Then(/^user is directed to enter correspondence between new outcome and standard outcomes$/) do
  expect(page).to have_content("an ability to apply knowledge of mathematics, science, and engineering")
  expect(page).to have_content("Match outcome to ABET default outcomes")
end