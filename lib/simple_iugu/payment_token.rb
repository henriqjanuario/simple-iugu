module SimpleIugu
  class PaymentToken < Base

    def self.create(params = {}, access_token = nil)
      reponse = rest_request.post do |req|
        endpoint = "payment_token"
        body = params
        prepare_request(req, endpoint, nil, body, access_token)
      end

      format_response(reponse)
    end
  end
end