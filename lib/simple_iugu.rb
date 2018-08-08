require_relative "simple_iugu/version"
require_relative 'simple_iugu/engine'
require_relative "simple_iugu/api/base"
require_relative "simple_iugu/api/bank"
require_relative "simple_iugu/api/charge"
require_relative "simple_iugu/api/customer"
require_relative "simple_iugu/api/invoice"
require_relative "simple_iugu/api/payment_method"
require_relative "simple_iugu/api/payment_token"
require_relative "simple_iugu/api/sub_account"
require_relative "simple_iugu/api/transfer"
require_relative "simple_iugu/api/withdrawal"


module SimpleIugu
  autoload :Customer, 'simple_iugu/models/customer.rb'

  class << self
    attr_accessor :api_key
    attr_accessor :api_key_test
    attr_accessor :iugu_account_id
    attr_accessor :is_test
  end

  def self.setup
    yield self
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
