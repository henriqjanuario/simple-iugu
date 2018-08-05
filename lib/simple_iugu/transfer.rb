module SimpleIugu
  class Transfer < Base

    def self.create(params = {})
      response = rest_request.post do |req|
        endpoint = "transfers"
        body = params
        prepare_request(req, endpoint, nil, body)
      end
    end

    format_response(reponse)
  end

end