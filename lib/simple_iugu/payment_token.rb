module SimpleIugu
  class PaymentToken < Base

    BASE_ENDPOINT = 'payment_token'

    def self.create(body = {}, access_token = nil)
      response = post(BASE_ENDPOINT, body, access_token)

      symbolize(response.parsed_response)
    end
  end
end