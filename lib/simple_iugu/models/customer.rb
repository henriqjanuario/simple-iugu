class SimpleIugu::Customer < ActiveRecord::Base
  self.table_name = "iugu_customers"

  belongs_to :customerable, polymorphic: true

  before_create :create_customer_on_iugu

  def create_customer_on_iugu
    service = SimpleIugu::Services::Customer.create(self.attributes)

    if service[:errors].present?
      service[:errors].map{ |error| self.errors.messages.merge(error) }
      return false
    end
  end

end