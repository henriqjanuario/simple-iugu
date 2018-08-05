module SimpleIugu
  class Invoice < Base

    def self.create(iugu_user_token = nil, params = {})
      response = rest_request.post do |req|
        endpoint = "invoices"
        body = params
        prepare_request(req, endpoint, nil, body, iugu_user_token)
      end

      format_response(reponse)
    end

    def self.duplicate(iugu_user_token = nil, id, params = {})
      response = rest_request.post do |req|
        endpoint = "invoices/#{id}/duplicate"
        body = params
        prepare_request(req, endpoint, nil, body, iugu_user_token)
      end

      format_response(reponse)
    end

    def self.capture(iugu_user_token = nil, id)
      response = rest_request.post do |req|
        endpoint = "invoices/#{id}/capture"
        prepare_request(req, endpoint, nil, nil, iugu_user_token)
      end

      format_response(response)
    end

    def self.show(iugu_user_token = nil, id)
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

    def self.cancel(iugu_user_token = nil, id)
      response = rest_request.put do |req|
        endpoint = "invoices/#{id}/cancel"
        prepare_request(req, endpoint, nil, nil, iugu_user_token)
      end

      format_response(response)
    end

    def self.refund(iugu_user_token = nil, id)
      response = rest_request.post do |req|
        endpoint = "invoices/#{id}/refund"

        prepare_request(req, endpoint, nil, nil, iugu_user_token)
      end
    end

    def self.send_email(iugu_user_token = nil, id)
      response = rest_request.post do |req|
        endpoint = "invoices/#{id}/send_email"

        prepare_request(req, endpoint, nil, nil, iugu_user_token)
      end
    end

  end
end