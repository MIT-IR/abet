module TabHelper
  OUTCOMES = :outcomes
  ASSIGNMENTS = :assignments
  DATA_ENTRY = :data_entry
  ACTIVITY_FEED = :activity_feed
  REPORTS = :reports

  def tab(value)
    @current_tab = value.to_sym
  end

  def tab_class(value)
    if @current_tab == value.to_sym
      "is-active"
    else
      ""
    end
  end
end
