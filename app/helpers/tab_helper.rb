module TabHelper
  OUTCOMES = :outcomes
  ASSESSMENTS = :assessments
  DATA_ENTRY = :data_entry

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
