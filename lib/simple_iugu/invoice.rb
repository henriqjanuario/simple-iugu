module SimpleIugu
  class Invoice < Base

    def self.create(params = {}, access_token = nil)
      response = rest_request.post do |req|
        endpoint = "invoices"
        body = params
        prepare_request(req, endpoint, nil, body, access_token)
      end

      format_response(response)
    end

    def self.duplicate(id, params = {}, access_token = nil)
      response = rest_request.post do |req|
        endpoint = "invoices/#{id}/duplicate"
        body = params
        prepare_request(req, endpoint, nil, body, access_token)
      end

      format_response(response)
    end

    def self.capture(id, access_token = nil)
      response = rest_request.post do |req|
        endpoint = "invoices/#{id}/capture"
        prepare_request(req, endpoint, nil, nil, access_token)
      end

      format_response(response)
    end

    def self.show(id, access_token = nil)
      response = rest_request.get do |req|
        endpoint = "invoices/#{id}"
        prepare_request(req, endpoint, nil, nil, access_token)
      end

      format_response(response)
    end

    def self.index(params = {}, access_token = nil)
      response = rest_request.get do |req|
        endpoint = "invoices"
        params = params
        prepare_request(req, endpoint, params, nil, access_token)
      end

      format_response(response)
    end

    def self.cancel(id, access_token = nil)
      response = rest_request.put do |req|
        endpoint = "invoices/#{id}/cancel"
        prepare_request(req, endpoint, nil, nil, access_token)
      end

      format_response(response)
    end

    def self.refund(id, access_token = nil)
      response = rest_request.post do |req|
        endpoint = "invoices/#{id}/refund"

        prepare_request(req, endpoint, nil, nil, access_token)
      end
    end

    def self.send_email(id, access_token = nil)
      response = rest_request.post do |req|
        endpoint = "invoices/#{id}/send_email"

        prepare_request(req, endpoint, nil, nil, access_token)
      end
    end

  end
end