module SimpleIugu
  module Api

    class Invoice < Base

      BASE_ENDPOINT = 'invoices'

      def self.index(query = nil, access_token = nil)
        response = get(BASE_ENDPOINT, query, access_token)

        symbolize(response.parsed_response)[:items]
      end

      def self.create(body = {}, access_token = nil)
        response = post(BASE_ENDPOINT, body, access_token)

        symbolize(response.parsed_response)
      end

      def self.show(id, access_token = nil)
        url = "#{BASE_ENDPOINT}/#{id}"

        response = get(url, nil, access_token)

        symbolize(response.parsed_response)
      end

      def self.duplicate(id, body = {}, access_token = nil)
        url = "#{BASE_ENDPOINT}/#{id}/duplicate"

        response = post(url, body, access_token)

        symbolize(response.parsed_response)
      end

      def self.capture(id, access_token = nil)
        url = "#{BASE_ENDPOINT}/#{id}/capture"

        response = post(url, nil, access_token)

        symbolize(response.parsed_response)
      end

      def self.cancel(id, access_token = nil)
        url = "#{BASE_ENDPOINT}/#{id}/cancel"

        response = put(url, nil, access_token)

        symbolize(response.parsed_response)
      end

      def self.refund(id, access_token = nil)
        url = "#{BASE_ENDPOINT}/#{id}/refund"

        response = post(url, nil, access_token)

        symbolize(response.parsed_response)
      end

      def self.send_email(id, access_token = nil)
        url = "#{BASE_ENDPOINT}/#{id}/send_email"

        response = post(url, nil, access_token)

        symbolize(response.parsed_response)
      end
    end
  end
end