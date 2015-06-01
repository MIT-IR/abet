module ViewSpecHelpers
  def page
    Capybara.string(rendered)
  end
end

RSpec.configure do |config|
  config.include ViewSpecHelpers, type: :view
end
