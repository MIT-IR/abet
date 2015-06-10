class PagesController < ApplicationController
  include HighVoltage::StaticPage

  before_action :skip_tabs
  skip_after_action :verify_authorized

  private

  def skip_tabs
    @skip_tabs = true
  end
end
