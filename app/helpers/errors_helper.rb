module ErrorsHelper
  def render_errors(form)
    errors = form.object.errors

    if errors.any?
      render "errors", errors: errors.full_messages
    end
  end
end
