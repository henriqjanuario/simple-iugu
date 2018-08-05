module SimpleIugu
  class Charge < Base

    def self.create(params = {})
      response = rest_request.post do |req|
        endpoint = "charge"
        body = params
        prepare_request(req, endpoint, nil, body)
      end

      format_response(reponse)
    end

  end
end