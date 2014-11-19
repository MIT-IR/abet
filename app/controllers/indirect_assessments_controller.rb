class IndirectAssessmentsController < ApplicationController
	def new
		@assessment = IndirectAssessment.new
		@available_years = ['2014', '2015', '2016']
		@indirect_type = params[:indirect_type]
		if @indirect_type == 'survey'
		@labels = {
			:assessment_name_name => "Survey Name",
			:assessment_description_name => "Survey Description",
			:year_name => "Year",
			:minimum_category_name => "Minimum Category",
			:target_percentage_name => "Target Percentage",
			:actual_percentage_name => "Actual Percentage"
		}
		elsif  @indirect_type == 'participation'
			@labels = {
			:assessment_name_name => "Program Name",
			:assessment_description_name => "Program Description",
			:year_name => "Year",
			:minimum_category_name => "Minimum Category",
			:target_percentage_name => "Target Participation Percentage",
			:actual_percentage_name => "Actual Participation Percentage"
		}
		elsif @indirect_type == 'other'
			@labels = {
			:assessment_name_name => "Assessment Name",
			:assessment_description_name => "Assessment Description",
			:year_name => "Year",
			:minimum_category_name => "Minimum Category",
			:target_percentage_name => "Target Percentage",
			:actual_percentage_name => "Actual Percentage"
		}
		end
	end
end