module SimpleIugu
  class Transfer < Base

    def self.create(params = {}, iugu_user_token = nil)
      response = rest_request.post do |req|
        endpoint = "transfers"
        body = params
        prepare_request(req, endpoint, nil, body, iugu_user_token)
      end
    end

    format_response(reponse)
  end

end