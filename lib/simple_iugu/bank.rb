module SimpleIugu
  class Bank < Base

    def self.create(params = {}, iugu_user_token = nil)
      response = rest_request.post do |req|
        endpoint = "bank_verification"
        body = params
        prepare_request(req, endpoint, nil, body, iugu_user_token)
      end

      format_response(response)
    end

    def self.index(iugu_user_token = nil)
      response = rest_request.get do |req|
        endpoint = "bank_verification"

        prepare_request(req, endpoint, nil, nil, iugu_user_token)
      end

      format_response(response)
    end

  end
end