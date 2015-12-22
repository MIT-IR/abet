class PagesController < ApplicationController
  include HighVoltage::StaticPage

  skip_after_action :verify_authorized
  layout :layout_for_page

  private

  def layout_for_page
    case params[:id]
    when 'help'
      'application'
    else
      'documentation'
    end
  end
end
