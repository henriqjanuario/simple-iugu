module SimpleIugu
  class SubAccount < Base

    def self.create(params = {}, iugu_user_token = nil)
      response = rest_request.post do |req|
        endpoint = "marketplace/create_account"
        body = params
        prepare_request(req, endpoint, nil, body, iugu_user_token)
      end

      format_response(reponse)
    end

    def self.update(params = {})
      response = rest_request.post do |req|
        endpoint = "accounts/configuration"
        body = params
        prepare_request(req, endpoint, nil, body, iugu_user_token)
      end

      format_response(reponse)
    end

    def self.show(iugu_account_id = nil, iugu_user_token = nil)
      response = rest_request.get do |req|
        endpoint = "accounts/#{iugu_account_id}"

        prepare_request(req, endpoint, nil, nil, iugu_user_token)
      end

      format_response(reponse)
    end

    def self.index(iugu_user_token = nil, params = {})
      response = rest_request.get do |req|
        endpoint = "marketplace"
        params = params
        prepare_request(req, endpoint, params, nil, iugu_user_token)
      end

      format_response(reponse)
    end

    def self.verify(iugu_account_id = nil, iugu_user_token = nil, params = {})
      response = rest_request.post do |req|
        endpoint = "accounts/#{iugu_account_id}/request_verification"
        body = params
        prepare_request(req, endpoint, nil, body, iugu_user_token)
      end

      format_response(reponse)
    end

  end
end