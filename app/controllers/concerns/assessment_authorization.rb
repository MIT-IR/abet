module AssessmentAuthorization
  extend ActiveSupport::Concern

  included do
    after_filter :verify_authorized
  end

  def authorize(assessment)
    query = action_name + "?"
    @_pundit_policy_authorized = true
    AssessmentPolicy.new(current_user, assessment).public_send(query)
  end
end
