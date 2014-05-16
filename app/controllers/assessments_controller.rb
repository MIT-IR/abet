class AssessmentsController < ApplicationController
  def new
  	@assessment = Assessment.new({:assess_type => "Direct"})
  end

  def create
  	@assessment = Assessment.new(assessment_params)
  	if @assessment.save
  		redirect_to(:controller => 'subjects', :action => 'new')
  	else
  		render('new')
  	end
  end

  def edit
  end

  def show
  end

  def index
  end

  private

  	def assessment_params
  		params.require(:assessment).permit(:assess_type)
  	end
end
