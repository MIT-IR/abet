module Reports
  class CoursesController < ApplicationController
    def index
      @courses = policy_scope(Course)

      if @courses.size == 1
        redirect_to course_assessment_report_path(course_id: @courses.first)
      end
    end
  end
end
