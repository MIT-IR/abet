module GradebookClient
  class Histogram < OpenStruct
    def self.find_by_gradebook_assignment_id(gradebook_assignment_id, number_of_bins: 10)
      gradebook_response = GradebookClient.adapter.histogram_for(
        gradebook_assignment_id,
        number_of_bins: number_of_bins
      )

      new(gradebook_response.reverse_merge(gradebook_assignment_id: gradebook_assignment_id))
    end

    def available_number_of_bins
      availableNumbersOfBins
    end

    def bars
      @_bars ||= histogram.map do |bar|
        HistogramBar.new(bar)
      end
    end
  end
end
