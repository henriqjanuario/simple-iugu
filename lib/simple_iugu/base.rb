require 'byebug'
require 'faraday'
require 'base64'
require 'json'

module SimpleIugu
  class Base

    API_KEY = SimpleIugu.is_test ? SimpleIugu.api_key_test : SimpleIugu.api_key

    def self.prepare_request(req, endpoint, params, body, account_access_token = API_KEY)
      account_access_token == nil ? API_KEY : account_access_token

      req.url "#{SimpleIugu.api_version}#{endpoint}" if endpoint != nil

      req.headers['Content-Type'] = 'application/json'
      req.headers['Accept'] = 'application/json'

      # req.headers['Authorization'] = "Basic #{Base64.encode64(account_access_token)}"
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
        body: symbolize(JSON.parse(response.body))
      }
    end

    def self.symbolize(obj)
      return obj.reduce({}) do |memo, (k, v)|
        memo.tap { |m| m[k.to_sym] = symbolize(v) }
      end if obj.is_a? Hash

      return obj.reduce([]) do |memo, v|
        memo << symbolize(v); memo
      end if obj.is_a? Array

      obj
    end

  end
end
