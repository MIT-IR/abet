class GradebookClient
  def assignments_for(gradebook_id)
    fixture = File.read(Rails.root.join("spec", "fixtures", "assignments.json"))

    JSON.parse(fixture)["data"].map do |assignment|
      Assignment.new(assignment)
    end
  end

  def gradebook_id_for(uuid)
    fixture = File.read(Rails.root.join("spec", "fixtures", "gradebook.json"))
    Gradebook.new(JSON.parse(fixture)["data"]).gradebookId
  end

  def histogram_for(assignment_id)
    fixture = File.read(Rails.root.join("spec", "fixtures", "histogram.json"))
    Histogram.new(JSON.parse(fixture)["data"])
  end

  class Assignment < OpenStruct
  end

  class Gradebook < OpenStruct
  end

  class Histogram < OpenStruct
    def bars
      histogram.map do |bar|
        HistogramBar.new(bar)
      end
    end
  end

  class HistogramBar < OpenStruct
    def label
      "#{lowerBoundString} - #{upperBoundString}"
    end
  end
end
