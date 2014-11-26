class IndirectAssessmentsController < ApplicationController
	def new
		@outcome = Outcome.find(params[:outcome_id])
		@assessment = IndirectAssessment.new
		@available_years = ['2014', '2015', '2016', '2017', '2018', '2019']
		@indirect_type = params[:indirect_type]
		if @indirect_type == 'survey'
			@title = "survey results"
			@labels = {
				:assessment_name_name => "Survey Name",
				:assessment_description_name => "Survey Description",
				:year_name => "Year",
				:minimum_category_name => "Minimum Category",
				:target_percentage_name => "Target Percentage",
				:actual_percentage_name => "Actual Percentage"
			}
			@placeholders = {
				:assessment_name_ph => "e.g.'Senior Survey'",
				:assessment_description_ph => "e.g. 'Biennial survey administered to graduating seniors'",
				:minimum_category_ph => "e.g. 'Somewhat or Very Satisfied'"
			}
		elsif  @indirect_type == 'participation'
			@title = "program participation results"
			@labels = {
			:assessment_name_name => "Program Name",
			:assessment_description_name => "Program Description",
			:year_name => "Year",
			:minimum_category_name => "Minimum Category",
			:target_percentage_name => "Target Participation Percentage",
			:actual_percentage_name => "Actual Participation Percentage"
		}
		@placeholders = {
			:assessment_name_ph => "e.g.'UROP'",
			:assessment_description_ph => "e.g. 'Undergraduate Research Projects'"
		}
		elsif @indirect_type == 'other'
			@title = "a new indirect assessment"
			@labels = {
			:assessment_name_name => "Assessment Name",
			:assessment_description_name => "Assessment Description",
			:year_name => "Year",
			:minimum_category_name => "Minimum Category",
			:target_percentage_name => "Target Percentage",
			:actual_percentage_name => "Actual Percentage"
		}
		@placeholders = {
			:assessment_name_ph => "e.g.'Senior Thesis Completion'",
			:assessment_description_ph => "e.g. 'Percent of students who complete a senior thesis.'"
		}
		end
	end
end