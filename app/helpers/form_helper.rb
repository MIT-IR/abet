module FormHelper
  def cancel_button
    link_to t("helpers.cancel_button"),
      "javascript:history.back()",
      class: "button button-cancel",
      style: "display: none",
      data: { role: "cancel-button" }
  end
end
