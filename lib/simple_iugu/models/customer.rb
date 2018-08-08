class SimpleIugu::Customer < ActiveRecord::Base
  self.table_name = "iugu_customers"

  belongs_to :customerable, polymorphic: true

  has_many :payment_methods, table_name: 'iugu_payment_methods'
  has_many :invoices, table_name: 'iugu_invoices'

  before_create :create_customer_on_iugu
  before_update :update_customer_on_iugu
  before_destroy :destroy_customer_on_iugu

  def create_customer_on_iugu
    response = SimpleIugu::Api::Customer.create(self.attributes)

    if response[:errors].present?
      response[:errors].map{ |error| self.errors.messages.merge(error) }
      return false
    end

    self.iugu_id = response[:id]
  end

  def create_customer_on_iugu
    response = SimpleIugu::Api::Customer.update(self.iugu_id, self.attributes)

    if response[:errors].present?
      response[:errors].map{ |error| self.errors.messages.merge(error) }
      return false
    end
  end

  def destroy_customer_on_iugu
    response = SimpleIugu::Api::Customer.destroy(self.iugu_id)

    if response[:errors].present?
      response[:errors].map{ |error| self.errors.messages.merge(error) }
      return false
    end

    self.destroy
  end

end