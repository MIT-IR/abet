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

When /^the user selects the following outcome associations:$/ do |table|
  table.hashes.each do |hash|
    select hash["level"], :from => hash["outcome"]
  end
end

Then /^the user should see the custom outcome listed$/ do
  id = Outcome.last.id
  within("tr#outcome-#{id}") do
    expect(page).to have_content("A.1.a")
    expect(page).to have_content("Ability to solve complex problems")
  end
end

Then /^the user should not see the associated outcomes in the warning list$/ do
  within("div#unassociated-outcomes") do
    expect(page).to_not have_content("an ability to apply knowledge of mathematics")
  end
end

Then /^the user should see the non\-associated outcomes in the warning list$/ do
  within("div#unassociated-outcomes") do
    expect(page).to have_content("ability to design and conduct experiments")
  end
end
