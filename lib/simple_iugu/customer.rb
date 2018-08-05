module SimpleIugu
  class Customer < Base

    def self.index
      reponse = rest_request.get do |req|
        endpoint = "customers"
        prepare_request(req, endpoint, nil, nil)
      end

      format_response(reponse)
    end

    def self.show(id)
      reponse = rest_request.get do |req|
        endpoint = "customers/#{id}"
        prepare_request(req, endpoint, nil, nil)
      end

      format_response(reponse)
    end

    def self.create(params = {})
      reponse = rest_request.post do |req|
        endpoint = "customers"
        body = params
        prepare_request(req, endpoint, nil, body)
      end

      format_response(reponse)
    end

    def self.update(params = {}, id)
      reponse = rest_request.put do |req|
        endpoint = "customers/#{id}"
        body = params
        prepare_request(req, endpoint, nil, body)
      end

      format_response(reponse)
    end

    def self.destroy(id)
      reponse = rest_request.delete do |req|
        endpoint = "customers/#{id}"
        prepare_request(req, endpoint, nil, nil)
      end

      format_response(reponse)
    end

  end
end