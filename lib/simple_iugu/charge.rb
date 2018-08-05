module SimpleIugu
  class Charge < Base

    def self.create(iugu_user_token, params = {})
      response = rest_request.post do |req|
        endpoint = "charge"
        body = params
        prepare_request(req, endpoint, nil, body, iugu_user_token)
      end

      format_response(reponse)
    end

  end
end