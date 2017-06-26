module ApplicationHelper
  def documentation_side_nav_link(link_text, path)
    path = page_path(path)

    link_to link_text, path, class: "documentation-side-nav-link #{'is-active' if current_page?(path)}"
  end

  def google_fonts_stylesheet_link_tag(family)
    stylesheet_link_tag "https://fonts.googleapis.com/css?family=#{family}"
  end

  def javascript_void
    "javascript:void(0)"
  end

  def jon_daries
    t("helpers.jon_daries_html", email: mail_to("daries@mit.edu"))
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

  def madlib_form_for(path, options = {}, &block)
    options = options.deep_merge(
      html: { class: :madlib, novalidate: true },
      wrapper: :madlib,
    )
    simple_form_for(path, options, &block)
  end
end
