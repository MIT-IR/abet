module SelectizeHelper
  def selectize(item, from:)
    container = find_field(from, visible: false).first(:xpath, ".//..")
    container.find(".selectize-control").click
    container.find("div.option", text: item).click
  end
end

RSpec.configure do |config|
  config.include SelectizeHelper, type: :feature
end
