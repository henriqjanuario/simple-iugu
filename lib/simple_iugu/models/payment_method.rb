class SimpleIugu::PaymentMethod < ActiveRecord::Base
  self.table_name = 'iugu_payment_methods'

  belongs_to :customer, table_name: 'iugu_customers'

  before_create :create_payment_method_on_iugu
  before_update :update_payment_method_on_iugu
  before_destroy :destroy_payment_method_on_iugu

  def create_payment_method_on_iugu
    response = SimpleIugu::Api::PaymentMethod.create(self.customer.iugu_id, self.attributes)

    if response[:errors].present?
      response[:errors].map{ |error| self.errors.messages.merge(error) }
      return false
    end

    self.iugu_id = response[:id]
    self.customer.default_payment_method_id = self.iugu_id if self.set_as_default
  end


  def update_payment_method_on_iugu
    response = SimpleIugu::Api::PaymentMethod.create(self.customer.iugu_id, self.iugu_id, self.attributes)

    if response[:errors].present?
      response[:errors].map{ |error| self.errors.messages.merge(error) }
      return false
    end

  end

  def destroy_payment_method_on_iugu
    response = SimpleIugu::Api::PaymentMethod.destroy(self.customer.iugu_id, self.iugu_id)

    if response[:errors].present?
      response[:errors].map{ |error| self.errors.messages.merge(error) }
      return false
    end

    self.destroy
  end

  def payment_token
    PaymentToken.find_by(iugu_id: self.token)
  end
end
