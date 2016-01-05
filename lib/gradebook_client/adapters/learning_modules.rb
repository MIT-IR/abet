module GradebookClient
  module Adapters
    class LearningModules
      def initialize(endpoint:, client_cert:, client_key:)
        @endpoint = endpoint.chomp("/")
        @client_cert = OpenSSL::X509::Certificate.new(client_cert)
        @client_key = OpenSSL::PKey::RSA.new(client_key)
      end

      def assignments_for(gradebook_id)
        get(
          "assignments/#{gradebook_id}",
          includeMaxPoints: false,
          includeAvgStats: false,
          includeGradingStats: true,
        )
      end

      def gradebook_for(uuid)
        get("gradebook", uuid: uuid)
      end

      def histogram_for(assignment_id, number_of_bins: 10)
        get(
          "histogram/assignment/#{assignment_id}",
          numBins: number_of_bins,
          tightAroundData: true,
        )
      end

      private

      attr_reader :endpoint, :client_cert, :client_key

      def get(path, params = nil)
        resource = RestClient::Resource.new(
          "#{endpoint}/#{path}",
          ssl_client_cert: client_cert,
          ssl_client_key: client_key,
        )

        if params.nil?
          parse(resource.get)
        else
          parse(resource.get(params: params))
        end
      end

      def parse(response)
        response_body = JSON.parse(response.body)

        if response_body["status"] == -1
          raise Error, response_body.fetch("message", "No message available")
        end

        response_body["data"]
      end

      class Error < RuntimeError
        def message
          "Error communitcating with gradebook service. #{super}"
        end
      end
    end
  end
end
