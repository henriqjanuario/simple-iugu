require_relative "simple_iugu/version"
require_relative "simple_iugu/base"
require_relative "simple_iugu/bank"
require_relative "simple_iugu/charge"
require_relative "simple_iugu/customer"
require_relative "simple_iugu/invoice"
require_relative "simple_iugu/payment_method"
require_relative "simple_iugu/payment_token"
require_relative "simple_iugu/sub_account"
require_relative "simple_iugu/transfer"
require_relative "simple_iugu/withdrawal"
require_relative 'simple_iugu/engine'


module SimpleIugu
  autoload :Customer, 'simple_iugu/models/customer.rb'

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
