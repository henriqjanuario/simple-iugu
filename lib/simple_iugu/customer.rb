module SimpleIugu
  class Customer < Base

    def self.update(params = {}, id)
      reponse = self.rest_request.put do |req|
        endpoint = "customers/#{id}"
        body = params
        self.prepare_request(req, endpoint, nil, body)
      end
      
      self.format_response(reponse)
    end

  end
end