require 'simple_form/components/headlines_component'
SimpleForm::Inputs::Base.send(:include, SimpleForm::Components::Headlines)

SimpleForm.setup do |config|
  config.wrappers :default, class: :input,
    hint_class: :field_with_hint, error_class: :field_with_errors do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly

    b.use :label_input
    b.use :hint,  wrap_with: { tag: :span, class: :hint }
  end

  config.wrappers :madlib, class: "madlib-statement", error_class: :field_with_errors do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly

    b.use :headline, wrap_with: { tag: :p, class: "headline-poster" }
    b.wrapper tag: :div, class: "madlib-statement-input" do |input|
      input.use :placeholder
      input.use :input

      input.wrapper tag: :div, class: :underline do |underline|
        underline.use :label
        underline.use :error, wrap_with: { tag: :span, class: "error" }
      end
    end
  end

  config.default_wrapper = :default
  config.boolean_style = :inline
  config.button_class = 'btn'
  config.error_notification_tag = :div
  config.error_notification_class = 'error_notification'
  config.item_wrapper_tag = :div
  config.browser_validations = true
  config.boolean_label_class = 'checkbox'
end
