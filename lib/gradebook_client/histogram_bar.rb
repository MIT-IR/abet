module GradebookClient
  class HistogramBar < OpenStruct
    def label
      "#{lowerBoundString} - #{upperBoundString}"
    end
  end
end
