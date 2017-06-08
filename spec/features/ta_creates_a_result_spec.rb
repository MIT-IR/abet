require "rails_helper"

feature "TA creates a result" do
  scenario "for an assignment" do
    assignment = create(:assignment)
    department = assignment.subject_department
    user = user_with_results_access_to(department)

    visit manage_results_subjects_path(as: user)
    click_add_result_for(assignment)
    select "2015", from: "result_year"
    select "JA", from: "result_semester"
    fill_in "result_percentage", with: "72"
    click_on "Create Result"

    expect(page).to have_content "2015"
    expect(page).to have_content "JA"
    expect(page).to have_content "72"
  end

  def click_add_result_for(assignment)
    within "#assignment-#{assignment.id}" do
      click_link t("manage_results.subjects.show.add_results")
    end
  end
end
