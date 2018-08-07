module SimpleIugu
  module Services
    class Withdrawal < Base

      def self.create(id, body = {}, access_token = nil)
        response = post("accounts/#{id}/request_withdraw", body, access_token)

        symbolize(response.parsed_response)
      end

    end
  end
end