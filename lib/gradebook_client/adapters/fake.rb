module GradebookClient
  module Adapters
    class Fake
      FIXTURE_ROOT = Rails.root.join("spec", "fixtures")

      def assignments_for(gradebook_id)
        fixture = File.read(FIXTURE_ROOT.join("assignments.json"))
        JSON.parse(fixture)["data"]
      end

      def gradebook_for(uuid)
        fixture = File.read(FIXTURE_ROOT.join("gradebook.json"))
        JSON.parse(fixture)["data"]
      end

      def histogram_for(assignment_id, number_of_bins: 10)
        fixture = File.read(FIXTURE_ROOT.join("histogram.json"))
        JSON.parse(fixture)["data"]
      end
    end
  end
end
