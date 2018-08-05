require 'faraday'
require 'base64'
require 'json'

module SimpleIugu
  class Base

    def self.prepare_request(req = nil, endpoint = nil, params = nil, body = nil, account_access_token = nil)
      account_access_token == nil ? SimpleIugu.is_test.present? ? SimpleIugu.api_key_test : SimpleIugu.api_key : account_access_token

      req.url "#{SimpleIugu.api_version}#{endpoint}" if endpoint != nil

      req.headers['Content-Type'] = 'application/json'
      req.headers['Accept'] = 'application/json'

      req.headers['Authorization'] = "Basic #{Base64.encode64(account_access_token)}"

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
