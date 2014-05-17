class MeasuresController < ApplicationController
  def new
  	@measure = Measure.new(:subject_id => params[:sub_id])
    @subject = Subject.find(params[:sub_id])
  end

  def create
  	@measure = Measure.new(measure_params)
    @measure.subject = Subject.find(@measure.subject_id)
  	if @measure.save
  		redirect_to(:controller => 'subjects', :action => 'show', :id => @measure.subject_id)
  	else
  		render('new')
  	end
  end

  def edit
  end

  def show
  	@measures = Subject.find(params[:id]).measures
  end

  def index
  	@measures = Measure.all
  end

  private
  def measure_params
  	params.require(:measure).permit(:name, :description, :lower_bound, :year, :semester, :maximum, :goal, :actual, :subject_id)
  end
end
