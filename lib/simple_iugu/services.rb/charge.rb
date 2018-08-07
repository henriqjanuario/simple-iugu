module SimpleIugu
  module Services
    class Charge < Base

      BASE_ENDPOINT = 'charge'

      def self.create(body = {}, access_token = nil)
        response = post(BASE_ENDPOINT, body, access_token)

        symbolize(response.parsed_response)
      end

    end
  end
end