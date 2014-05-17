class SubjectsController < ApplicationController
  def new
  	@subject = Subject.new({:assessment_id => params[:assessment_id]})
  end
  #def new
  #  @assessment = Assessment.new({:assess_type => "Direct", :outcome_id => params[:out_id]})
  #end

  #def create
  #  @assessment = Assessment.new(assessment_params)
  #  @assessment.outcome = Outcome.find(@assessment.outcome_id)
  #  if @assessment.save
  #    redirect_to(:controller => 'subjects', :action => 'new', :assessment_id => @assessment.id)
  #  else
  #    render('new')
  #  end
  #end
  def create
  	@subject = Subject.new(subject_params)
    @subject.assessment = Assessment.find(@subject.assessment_id)
  	if @subject.save
  		redirect_to(:controller => 'outcomes', :action => 'show', :id => Assessment.find(@subject.assessment_id).outcome_id, :course_id => Outcome.find(Assessment.find(@subject.assessment_id).outcome_id).course_id)
  	else
  		render('new')
  	end
  end

  def edit
  end

  def show
    @subject = Subject.find(params[:id])
    @measures = @subject.measures
  end

  def index
  	@subjects = Subject.sorted
  end

  private 

  def subject_params
  		params.require(:subject).permit(:number,:name,:assessment_id)
  	end
end
