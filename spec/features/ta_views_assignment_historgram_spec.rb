require "rails_helper"

feature "TA views assignment histogram" do
  scenario "successfully" do
    _subject = create(:subject)
    user = user_with_results_access_to(_subject.department)

    visit gradebooks_assignments_path(
      subject_id: _subject,
      semester: "FA",
      year: "2016",
      as:  user,
    )
    first(:link, "Histogram").click

    expect(page).to have_css("#datatable")
  end
end
