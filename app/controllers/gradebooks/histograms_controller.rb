module Gradebooks
  class HistogramsController < ApplicationController
    def show
      authorize(:generic, :manage_results?)
      @histogram = GradebookClient::Histogram.find_by_assignment_id(
        params[:assignment_id],
      )
    end
  end
end
