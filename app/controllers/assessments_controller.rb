class AssessmentsController < ApplicationController
  def new
  	@assessment = Assessment.new({:assess_type => "Direct", :outcome_id => params[:out_id]})
  end

  def create
  	@assessment = Assessment.new(assessment_params)
    @assessment.outcome = Outcome.find(@assessment.outcome_id)
  	if @assessment.save
  		redirect_to(:controller => 'subjects', :action => 'new', :assessment_id => @assessment.id)
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
  		params.require(:assessment).permit(:assess_type, :outcome_id)
  	end
end
