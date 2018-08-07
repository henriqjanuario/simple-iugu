module SimpleIugu
  class PaymentMethod < Base

    def self.index(customer_id, access_token = nil)
      url = "customers/#{customer_id}/payment_methods"

      response = get(url, nil, access_token)

      symbolize(response.parsed_response)
    end

    def self.show(customer_id, id, access_token = nil)
      url = "customers/#{customer_id}/payment_methods/#{id}"

      response = get(url, nil, access_token)

      symbolize(response.parsed_response)
    end

    def self.create(customer_id, body = {}, access_token = nil)
      url = "customers/#{customer_id}/payment_methods"

      response = post(url, body, access_token)

      symbolize(response.parsed_response)
    end

    def self.update(customer_id, id, body = {}, access_token = nil)
      url = "customers/#{customer_id}/payment_methods/#{id}"

      response = put(url, body, access_token)

      symbolize(response.parsed_response)
    end

    def self.destroy(customer_id, id, access_token = nil)
      url = "customers/#{customer_id}/payment_methods/#{id}"

      response = delete(url, nil, access_token)

      symbolize(response.parsed_response)
    end

  end
end