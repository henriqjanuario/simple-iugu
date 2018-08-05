module SimpleIugu
  class Transfer < Base

    def self.create(params = {}, iugu_user_token = nil)
      response = rest_request.post do |req|
        endpoint = "transfers"
        body = params
        prepare_request(req, endpoint, nil, body, iugu_user_token)
      end
      format_response(response)

    end
    
  end
end