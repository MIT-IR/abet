module GradebookClient
  class Histogram < OpenStruct
    def self.find_by_assignment_id(assignment_id)
      new(GradebookClient.adapter.histogram_for(assignment_id))
    end

    def bars
      @_bars ||= histogram.map do |bar|
        HistogramBar.new(bar)
      end
    end
  end
end
