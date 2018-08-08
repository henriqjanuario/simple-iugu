module SimpleIugu
  module Api
    class SubAccount < Base

      def self.create(body = {}, access_token = nil)
        response = post("marketplace/create_account", body, access_token)

        symbolize(response.parsed_response)
      end

      def self.update(body = {}, access_token = nil)
        response = put("accounts/configuration", body, access_token)

        symbolize(response.parsed_response)
      end

      def self.show(iugu_account_id = nil, access_token = nil)
        response = get("accounts/#{iugu_account_id}", nil, access_token)

        symbolize(response.parsed_response)
      end

      def self.index(query = nil, access_token = nil)
        response = get("marketplace", query, access_token)

        symbolize(response.parsed_response)
      end

      def self.verify(iugu_account_id = nil, body = {}, access_token = nil)
        response = post("accounts/#{iugu_account_id}/request_verification", body, access_token)

        symbolize(response.parsed_response)
      end

    end
  end
end