class AssessmentsController < ApplicationController
  def new
  	@assessment = Assessment.new({:assess_type => "Direct"})
  end

  def edit
  end

  def show
  end

  def index
  end
end
