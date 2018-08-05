module SimpleIugu
  class Customer < Base

    def self.index(access_token = nil)
      reponse = rest_request.get do |req|
        endpoint = "customers"
        prepare_request(req, endpoint, nil, nil, access_token)
      end

      format_response(reponse)
    end

    def self.show(id, access_token = nil)
      reponse = rest_request.get do |req|
        endpoint = "customers/#{id}"
        prepare_request(req, endpoint, nil, nil, access_token)
      end

      format_response(reponse)
    end

    def self.create(params = {}, access_token = nil)
      reponse = rest_request.post do |req|
        endpoint = "customers"
        body = params
        prepare_request(req, endpoint, nil, body, access_token)
      end

      format_response(reponse)
    end

    def self.update(id, params = {}, access_token = nil)
      reponse = rest_request.put do |req|
        endpoint = "customers/#{id}"
        body = params
        prepare_request(req, endpoint, nil, body, access_token)
      end

      format_response(reponse)
    end

    def self.destroy(id, access_token = nil)
      reponse = rest_request.delete do |req|
        endpoint = "customers/#{id}"
        prepare_request(req, endpoint, nil, nil, access_token)
      end

      format_response(reponse)
    end

  end
end