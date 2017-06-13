module SubjectsClient
  module Adapters
    class Cloudhub
      def initialize(id:, secret:)
        @id = id
        @secret = secret
      end

      def subjects_for(term:, department:)
        response = RestClient.get(endpoint_for(term, department), headers)
        JSON.parse(response.body)["items"]
      end

      private

      attr_reader :id, :secret

      def headers
        { "client_id" => id, "client_secret" => secret }
      end

      def endpoint_for(term, department)
        "https://mit-public.cloudhub.io/coursecatalog/v2/terms/#{term}/subjects?dept=#{department}"
      end
    end
  end
end
