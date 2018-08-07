module SimpleIugu
  module Services
    class Customer < Base

      BASE_ENDPOINT = 'customers'

      def self.index(query, access_token = nil)
        response = get(BASE_ENDPOINT, query, access_token)

        symbolize(response.parsed_response)[:items]
      end

      def self.show(id, access_token = nil)
        url = "#{BASE_ENDPOINT}/#{id}"

        response = get(url, nil, access_token)

        symbolize(response.parsed_response)
      end

      def self.create(body = {}, access_token = nil)
        response = post(BASE_ENDPOINT, body, access_token)

        symbolize(response.parsed_response)
      end

      def self.update(id, body = {}, access_token = nil)
        url = "#{BASE_ENDPOINT}/#{id}"

        response = put(url, body, access_token)

        symbolize(response.parsed_response)
      end

      def self.destroy(id, access_token = nil)
        url = "#{BASE_ENDPOINT}/#{id}"

        response = get(url, nil, access_token)

        symbolize(response.parsed_response)
      end

    end
  end
end