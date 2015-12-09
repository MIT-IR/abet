module ApplicationHelper
  def progress_bar_percentage_width(amount, total)
    amount = amount.to_f
    total = total.to_f
    width = (amount / total) * 100

    number_to_percentage(width, precision: 0)
  end
end
