module DateHelper
  def relative_date(date)
    if date >= Time.current.to_date
      t("helpers.today")
    elsif date == Time.current.to_date - 1.day
      t("helpers.yesterday")
    else
      date.strftime("%m-%d-%Y")
    end
  end
end
