module Gradebooks
  class HistogramsController < BaseController
    def show
      authorize(:generic, :manage_results?)
      @histogram = GradebookClient::Histogram.find_by_assignment_id(
        params[:assignment_id],
        number_of_bins: params[:number_of_bins],
      )
    end
  end
end
