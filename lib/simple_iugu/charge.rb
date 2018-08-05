module SimpleIugu
  class Charge < Base

    def self.create(params = {}, access_token = nil)
      response = rest_request.post do |req|
        endpoint = "charge"
        body = params
        prepare_request(req, endpoint, nil, body, access_token)
      end

      format_response(response)
    end

  end
end