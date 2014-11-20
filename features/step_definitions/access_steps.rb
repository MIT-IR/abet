#Test access is defined in config/test-roles.yaml
Given /^a user with no access$/ do
  ENV['eppn'] = "noone@mit.edu"
end

Given /^a user with access to a single department$/ do
  ENV['eppn'] = "jexample@mit.edu"
end

Given /^a user with access to multiple departments$/ do
  ENV['eppn'] = "daries@mit.edu"
end

When /^they visit the application$/ do
  visit '/'
end

Then /^they are sent to the no access page$/ do
  expect(page).to have_content "We're sorry, but you do not have access to this application"
end

Then /^they see the department chooser page$/ do
  expect(page).to have_content "Mechanical Engineering"
  expect(page).to have_content "Nuclear Engineering"
end

Then(/^they see that department's landing page$/) do
  expect(page).to have_content "Course Number"
end

Given(/^then are given rights to a single department$/) do
  step "a user with access to a single department"
end

When(/^they refresh the page$/) do
  visit current_path
end

When(/^they choose a department$/) do
  click_link "Mechanical Engineering"
end
