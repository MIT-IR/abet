module SimpleForm
  module Components
    module Headlines
      def headline(wrapper_options = nil)
        @headline ||= begin
          if options[:headline].present?
            options[:headline].to_s.html_safe
          else
            headline_translation
          end
        end
      end

      def has_headline?
        headline.present?
      end

      private

      def headline_translation
        translate_from_namespace(:headlines)
      end
    end
  end
end
