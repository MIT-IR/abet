Given(/^a user is on the interstitial page$/) do
  within ("table#courses") do
      click_link "Mechanical Engineering"
    end
end

When(/^a user chooses to adopt the default outcomes$/) do
  click_link "Adopt Default Outcomes"
end
