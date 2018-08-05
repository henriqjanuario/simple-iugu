module SimpleIugu
  class Invoice < Base

    def self.create(params = {}, iugu_user_token = nil)
      response = rest_request.post do |req|
        endpoint = "invoices"
        body = params
        prepare_request(req, endpoint, nil, body, iugu_user_token)
      end

      format_response(reponse)
    end

    def self.duplicate(id, params = {}, iugu_user_token = nil)
      response = rest_request.post do |req|
        endpoint = "invoices/#{id}/duplicate"
        body = params
        prepare_request(req, endpoint, nil, body, iugu_user_token)
      end

      format_response(reponse)
    end

    def self.capture(id, iugu_user_token = nil)
      response = rest_request.post do |req|
        endpoint = "invoices/#{id}/capture"
        prepare_request(req, endpoint, nil, nil, iugu_user_token)
      end

      format_response(response)
    end

    def self.show(id, iugu_user_token = nil)
      response = rest_request.get do |req|
        endpoint = "invoices/#{id}"
        prepare_request(req, endpoint, nil, nil, iugu_user_token)
      end

      format_response(response)
    end

    def self.index(iugu_user_token = nil, iugu_user_token = nil)
      response = rest_request.get do |req|
        endpoint = "invoices"
        prepare_request(req, endpoint, nil, nil, iugu_user_token)
      end

      format_response(response)
    end

    def self.cancel(id, iugu_user_token = nil)
      response = rest_request.put do |req|
        endpoint = "invoices/#{id}/cancel"
        prepare_request(req, endpoint, nil, nil, iugu_user_token)
      end

      format_response(response)
    end

    def self.refund(id, iugu_user_token = nil)
      response = rest_request.post do |req|
        endpoint = "invoices/#{id}/refund"

        prepare_request(req, endpoint, nil, nil, iugu_user_token)
      end
    end

    def self.send_email(id, iugu_user_token = nil)
      response = rest_request.post do |req|
        endpoint = "invoices/#{id}/send_email"

        prepare_request(req, endpoint, nil, nil, iugu_user_token)
      end
    end

  end
end