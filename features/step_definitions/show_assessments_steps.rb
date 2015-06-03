Given(/^An outcome has the following direct assessment associated with it:$/) do |table|
  meche2 = Course.find_by_number("2")
  outcome_a = meche2.outcomes.first
  @rows = table.hashes
    table.hashes.each do |row|
      DirectAssessment.create(outcome: outcome_a,
        subject_number: row["Subject Number"],
        subject_description: row["Subject Name"],
        semester: row["Semester"],
        assignment_name: row["Assignment Name"],
        assignment_description: row["Assignment Description"],
          problem_description: row["Problem Description"],
        minimum_grade: row["Minimum Grade"],
        target_percentage: row["Target Pct"],
        actual_percentage: row["Actual Pct"]
        )
    end
end

Given(/^a user refreshes the default outcomes page$/) do
  visit current_path
end

Then(/^The user sees the link to existing assessments$/) do
  expect(page).to have_content("Show assessments")
end

When(/^The user clicks the link to existing assessments$/) do
  click_link("Show assessments")
end

Then(/^The user sees the existing assessments$/) do
  expect(page).to have_content("18.03")
end
