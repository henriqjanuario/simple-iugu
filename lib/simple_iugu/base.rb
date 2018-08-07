require 'base64'
require 'json'
require 'byebug'
require 'httparty'

module SimpleIugu
  class Base

    def self.get(endpoint, query, account_access_token)
      HTTParty.get("#{SimpleIugu.base_uri}/#{SimpleIugu.api_version}#{endpoint}", headers: set_headers(account_access_token), query: query)
    end

    def self.post(endpoint, body, account_access_token)
      HTTParty.post("#{SimpleIugu.base_uri}/#{SimpleIugu.api_version}#{endpoint}", headers: set_headers(account_access_token), body: body)
    end

    def self.put(endpoint, body, account_access_token)
      HTTParty.put("#{SimpleIugu.base_uri}/#{SimpleIugu.api_version}#{endpoint}", headers: set_headers(account_access_token), body: body)
    end

    def self.delete(endpoint, account_access_token)
      HTTParty.delete("#{SimpleIugu.base_uri}/#{SimpleIugu.api_version}#{endpoint}", headers: set_headers(account_access_token))
    end

    def self.set_headers(account_access_token)
      return { 'Content-Type': 'application/json', 'Authorization': "Basic #{Base64.encode64(ensure_account_access_token(account_access_token))}" }
    end

    def self.ensure_account_access_token(account_access_token)
      if account_access_token.nil?
        account_access_token = SimpleIugu.is_test ? SimpleIugu.api_key_test : SimpleIugu.api_key
      else
        account_access_token
      end
      # 'bebccae8ba2ed6e24c661929f845144f'
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
