module SimpleIugu
  module Services
    class Bank < Base

      BASE_ENDPOINT = 'bank_verification'

      def self.create(params = {}, access_token = nil)
        response = post(BASE_ENDPOINT, body, access_token)

        symbolize(response.parsed_response)
      end

      def self.index(access_token = nil)
        response = get(BASE_ENDPOINT, nil, access_token)

        symbolize(response.parsed_response)
      end

    end
  end
end