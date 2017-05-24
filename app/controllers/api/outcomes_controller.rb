module Api
  class OutcomesController < BaseController
    def index
      outcomes = subject.outcomes.to_a.uniq
      render json: outcomes
    end

    private

    def subject
      Subject.find_by!(number: params[:subject_id])
    end
  end
end
