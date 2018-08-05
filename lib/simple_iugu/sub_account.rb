module SimpleIugu
  class SubAccount < Base

    def self.create(params = {}, access_token = nil)
      response = rest_request.post do |req|
        endpoint = "marketplace/create_account"
        body = params
        prepare_request(req, endpoint, nil, body, access_token)
      end

      format_response(reponse)
    end

    def self.update(params = {}, access_token = nil)
      response = rest_request.post do |req|
        endpoint = "accounts/configuration"
        body = params
        prepare_request(req, endpoint, nil, body, access_token)
      end

      format_response(reponse)
    end

    def self.show(iugu_account_id = nil, access_token = nil)
      response = rest_request.get do |req|
        endpoint = "accounts/#{iugu_account_id}"

        prepare_request(req, endpoint, nil, nil, access_token)
      end

      format_response(reponse)
    end

    def self.index(params = {}, access_token = nil)
      response = rest_request.get do |req|
        endpoint = "marketplace"
        params = params
        prepare_request(req, endpoint, params, nil, access_token)
      end

      format_response(reponse)
    end

    def self.verify(iugu_account_id = nil, params = {}, access_token = nil)
      response = rest_request.post do |req|
        endpoint = "accounts/#{iugu_account_id}/request_verification"
        body = params
        prepare_request(req, endpoint, nil, body, access_token)
      end

      format_response(reponse)
    end

  end
end