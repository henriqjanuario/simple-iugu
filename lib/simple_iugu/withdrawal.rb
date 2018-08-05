module SimpleIugu
  class Withdrawal < Base

    def self.create(id, params = {},iugu_user_token = nil)
      response = rest_request.post do |req|
        endpoint = "accounts/#{id}/request_withdraw"
        body = params
        prepare_request(req, endpoint, nil, body, iugu_user_token)
      end

      format_response(reponse)
    end

  end
end