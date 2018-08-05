module SimpleIugu
  class PaymentMethod < Base

    def self.index(customer_id, access_token = nil)
      reponse = rest_request.get do |req|
        endpoint = "customers/#{customer_id}/payment_methods"
        prepare_request(req, endpoint, nil, nil, access_token)
      end

      format_response(reponse)
    end

    def self.show(customer_id, id, access_token = nil)
      reponse = rest_request.get do |req|
        endpoint = "customers/#{customer_id}/payment_methods/#{id}"
        prepare_request(req, endpoint, nil, nil, access_token)
      end

      format_response(reponse)
    end

    def self.create(customer_id, params = {}, access_token = nil)
      reponse = rest_request.post do |req|
        endpoint = "customers/#{customer_id}/payment_methods"
        body = params
        prepare_request(req, endpoint, nil, body, access_token)
      end

      format_response(reponse)
    end

    def self.update(customer_id, id, params = {}, access_token = nil)
      reponse = rest_request.put do |req|
        endpoint = "customers/#{customer_id}/payment_methods/#{id}"
        body = params
        prepare_request(req, endpoint, nil, body, access_token)
      end

      format_response(reponse)
    end

    def self.destroy(customer_id, id, access_token = nil)
      reponse = rest_request.delete do |req|
        endpoint = "customers/#{customer_id}/payment_methods/#{id}"
        prepare_request(req, endpoint, nil, nil, access_token)
      end

      format_response(reponse)
    end

  end
end