module SimpleIugu
  module Api
    class Transfer < Base

      BASE_ENDPOINT = 'transfers'

      def self.create(body = {}, access_token = nil)
        response = post(BASE_ENDPOINT, body, access_token)

        symbolize(response.parsed_response)
      end

    end
  end
end