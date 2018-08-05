require 'byebug'
require 'faraday'
require 'base64'
require 'json'

module SimpleIugu
  class Base

    def self.prepare_request(req, endpoint, params, body)
      if endpoint != nil
        req.url "#{SimpleIugu.api_version}#{endpoint}"
      end
      req.headers['Content-Type'] = 'application/json'
      req.headers['Accept'] = 'application/json'

      # req.headers['Authorization'] = SimpleIugu.is_test ? "Basic #{Base64.encode64(SimpleIugu.api_key_test)}" : "Basic #{Base64.encode64(SimpleIugu.api_key)}"
      req.headers['Authorization'] = "Basic #{Base64.encode64('bebccae8ba2ed6e24c661929f845144f')}"

      if params != nil
        params.each do |key, value|
          req.params[key] = value
        end
      end

      if body != nil
        req.body = body.to_json
      end

    end

    def self.rest_request
      Faraday.new(url: SimpleIugu.base_uri)
    end

    def self.format_response(response)
      {
        status: response.status,
        body: Hash[JSON.parse(response.body).to_hash.map{ |k, v| [k.to_sym, v] }]
      }
    end

  end
end
