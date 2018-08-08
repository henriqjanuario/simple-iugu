require_relative "simple_iugu/version"
require_relative 'simple_iugu/engine'
require_relative "simple_iugu/services/base"
require_relative "simple_iugu/services/bank"
require_relative "simple_iugu/services/charge"
require_relative "simple_iugu/services/customer"
require_relative "simple_iugu/services/invoice"
require_relative "simple_iugu/services/payment_method"
require_relative "simple_iugu/services/payment_token"
require_relative "simple_iugu/services/sub_account"
require_relative "simple_iugu/services/transfer"
require_relative "simple_iugu/services/withdrawal"


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
