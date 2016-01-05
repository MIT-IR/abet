module Gradebooks
  class BaseController < ApplicationController
    rescue_from GradebookClient::Error, with: :render_gradebook_error

    private

    def render_gradebook_error(exception)
      render template: "application/gradebook_error", status: 500, locals: { exception: exception }
    end
  end
end
