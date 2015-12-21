module Gradebook
  class HistogramsController < ApplicationController
    def show
      authorize(:generic, :manage_results?)
      @histogram = GradebookClient.new.histogram_for(
        assignment_id: params[:assignment_id],
      )
    end
  end
end
