class ManageResults::ResultsController < ApplicationController
  def new
    @result = assignment.results.build
    authorize(@result)
  end

  def create
    @result = assignment.results.build(result_params)
    authorize(@result)

    if @result.save
      redirect_to [:manage_results, @result.assignment], success: t(".success")
    else
      render :new
    end
  end

  def edit
    @result = Result.find(params[:id])
    authorize(@result)
  end

  def update
    @result = Result.find(params[:id])
    authorize(@result)

    if @result.update(result_params)
      redirect_to [:manage_results, @result.assignment], success: t(".success")
    else
      render :edit
    end
  end

  def destroy
    result = Result.find(params[:id])
    authorize(result)

    result.destroy!
    redirect_to [:manage_results, result.assessment], success: t(".success")
  end

  private

  def result_params
    params.require(:result).permit(
      :percentage,
      :semester,
      :year
    )
  end

  def assignment
    @_assignment ||= Assignment.find(params[:assignment_id])
  end
end
