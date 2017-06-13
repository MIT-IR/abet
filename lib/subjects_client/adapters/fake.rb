module SubjectsClient
  module Adapters
    class Fake
      FIXTURE_ROOT = Rails.root.join("spec", "fixtures")

      def subjects_for(term:, department:)
        fixture = File.read(FIXTURE_ROOT.join("subjects.json"))
        JSON.parse(fixture)["items"]
      end
    end
  end
end
