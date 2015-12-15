module ApplicationHelper
  def javascript_void
    "javascript:void(0)"
  end

  def progress_bar_percentage_width(amount, total)
    if amount > 0
      amount = amount.to_f
      total = total.to_f
      width = (amount / total) * 100

      number_to_percentage(width, precision: 0)
    else
      amount
    end
  end
end
