module SimpleIugu
  class PaymentToken < Base
    
    def self.create(params = {})
      reponse = rest_request.post do |req|
        endpoint = "payment_token"
        body = params
        prepare_request(req, endpoint, nil, body)
      end

      format_response(reponse)
    end
  end
end