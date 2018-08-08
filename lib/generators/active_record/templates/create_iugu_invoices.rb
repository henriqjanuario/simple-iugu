class CreateIuguInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :iugu_invoices do |t|

      t.string    :email
      t.string    :cc_emails
      t.string    :due_date
      t.boolean   :ensure_workday_due_date
      t.json      :items
      t.integer   :discount_cents
      t.string    :customer_id
      t.string    :payable_with
      t.json      :payer
      t.integer   :status
      t.references :customer

      t.timestamps null: false
    end
  end
end
