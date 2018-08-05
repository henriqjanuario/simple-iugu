require_relative "simple_iugu/version"
require_relative "simple_iugu/base"
require_relative "simple_iugu/customer"

module SimpleIugu
  class << self
    attr_accessor :api_key
    attr_accessor :api_key_test
    attr_accessor :iugu_account_id
    attr_accessor :is_test
  end

  @api_version = 'v1/'
  @endpoint = 'https://api.iugu.com'

  def self.api_version
    @api_version
  end

  def self.base_uri
    @endpoint
  end
end
