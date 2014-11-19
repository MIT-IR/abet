Given /^a user with no access$/ do
  TestOnlyAccess.access = TestOnlyAccess::NO_ACCESS
end

When /^they visit the application$/ do
  visit '/'
end

Then /^they are sent to the no access page$/ do
  expect(page).to have_content "We're sorry, but you do not have access to this application"
end

Given /^a user with access to multiple departments$/ do
  TestOnlyAccess.access = TestOnlyAccess::MULTIPLE_DEPARTMENTS
end

Then /^they see the department chooser page$/ do
  expect(page).to have_content "Mechanical Engineering"
  expect(page).to have_content "Nuclear Engineering"
end

Given(/^a user with access to a single department$/) do
  TestOnlyAccess.access = TestOnlyAccess::SINGLE_DEPARTMENT
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