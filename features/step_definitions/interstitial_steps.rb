Given(/^a course has no outcomes associated with it$/) do

end

When(/^a user goes to view the outcomes$/) do
  within ("table#courses") do
    click_link "Mechanical Engineering"
  end
end

Then(/^user is taken to an interstitial page$/) do
  expect(page).to have_content "To set up outcomes"
end

Given(/^a user is on the interstitial page$/) do
  within ("table#courses") do
      click_link "Mechanical Engineering"
    end
end

When(/^a user chooses to adopt the default outcomes$/) do
  click_link "Adopt Default Outcomes"
end

Then(/^user sees the list of default outcomes$/) do
  expect(page).to have_content "an ability to apply knowledge of mathematics, science, and engineering"
end
