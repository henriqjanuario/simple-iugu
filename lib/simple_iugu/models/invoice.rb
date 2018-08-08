require 'enumerize'

class SimpleIugu::Invoice < ActiveRecord::Base
  extend Enumerize

  enumerize :status, in: [pending: 0, paid: 1, canceled: 2, refunded: 3, expired: 4, authorized: 5, partially_paid: 6, in_protest: 7, chargeback: 8], predicates: true, default: :pending, scope: true

  self.table_name = 'iugu_invoices'

  belongs_to :customer, table_name: 'iugu_customers'

  before_create :create_invoice_on_iugu

  def create_invoice_on_iugu
    response = SimpleIugu::Api::Invoice.create(self.attributes)

    if response[:errors].present?
      response[:errors].map{ |error| self.errors.messages.merge(error) }
      return false
    end

    self.iugu_id = response[:id]
  end

  def duplicate
    response = SimpleIugu::Api::Invoice.duplicate(self.iugu_id, self.attributes)

    if response[:errors].present?
      response[:errors].map{ |error| self.errors.messages.merge(error) }
      return false
    end

    Invoice.create(self.attributes)
  end
end