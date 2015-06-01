require 'spec_helper'
require 'rails_helper'

describe CoursesController do

  let!(:dept) { Department.find_or_create_by(name: 'Mechanical Engineering') }
  let(:course) { Course.find_or_create_by(course_number: '2A', course_name: 'MechE', department: dept) }

  context "setting up default outcomes" do

    before do
      @default_list = []

      @default_list.push(StandardOutcome.new.tap { |s| s.name = "a"; s.description = "an ability to apply knowledge of mathematics, science, and engineering"})
      @default_list.push(StandardOutcome.new.tap { |s| s.name = "b"; s.description = "an ability to design and conduct experiments, as well as to analyze and interpret data"})

      allow(StandardOutcome).to receive(:retrieve_defaults) { @default_list }
    end

    it "retrieves the list of standard outcomes" do
      expect(StandardOutcome).to receive(:retrieve_defaults)

      get :adopt_default, :id => course.id
    end
    it "clones the standard outcome list into the outcomes table for the course" do
      get :adopt_default, :id => course.id

      expect(course.outcomes.count).to eq(2)
    end
    it "redirects the user back to the course's show page" do
      get :adopt_default, :id => course.id

      expect(response).to redirect_to(course_path(course))
    end
  end
end
