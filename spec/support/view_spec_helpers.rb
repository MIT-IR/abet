module ViewSpecHelpers
  def page
    Capybara.string(rendered)
  end

  def stub_policy(methods)
    allow(view).to receive(:policy).and_return(double("Policy", methods))
  end

  def initialize_controller_helper_methods(view)
    view.extend ControllerHelperMethods
  end

  module ControllerHelperMethods
    def policy(object)
      raise "stub policy behavior to test this view"
    end
  end
end

RSpec.configure do |config|
  config.include ViewSpecHelpers, type: :view

  config.before(:each, type: :view) do
    initialize_controller_helper_methods(view)
  end
end
