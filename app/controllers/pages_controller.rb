class PagesController < ApplicationController
  include HighVoltage::StaticPage

  skip_after_action :verify_authorized
end
