module DateHelper
  def relative_date(date)
    if date >= Date.today
      t("helpers.today")
    elsif date == Date.yesterday
      t("helpers.yesterday")
    else
      date.strftime("%m-%d-%Y")
    end
  end
end
