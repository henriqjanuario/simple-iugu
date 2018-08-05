module SimpleIugu
  class Withdrawal < Base

    def self.create(id, params = {})
      response = rest_request.post do |req|
        endpoint = "accounts/#{id}/request_withdraw"
        body = params
        prepare_request(req, endpoint, nil, body)
      end

      format_response(reponse)
    end

  end
end