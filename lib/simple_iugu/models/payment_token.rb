class SimpleIugu::PaymentToken < ActiveRecord::Base
  self.table_name = 'iugu_payment_tokens'

  before_create :create_payment_token_on_iugu

  def create_payment_token_on_iugu
    response = SimpleIugu::Api::PaymentToken.create(self.attributes)

    if response[:errors].present?
      response[:errors].map{ |error| self.errors.messages.merge(error) }
      return false
    end

    self.holder_name        = response[:extra_info][:holder_name]
    self.bin                = response[:extra_info][:bin]
    self.brand              = response[:extra_info][:brand]
    self.display_number     = response[:extra_info][:display_number]
    self.month              = response[:extra_info][:month]
    self.year               = response[:extra_info][:year]
    self.iugu_id            = response[:id]
    self.verification_value = 'XXX'
    self.data               = nil
  end

  def payment_method
    PaymentMethod.find_by(token: self.iugu_id)
  end
end
