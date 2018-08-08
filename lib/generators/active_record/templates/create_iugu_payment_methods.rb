class CreateIuguPaymentMethods < ActiveRecord::Migration[5.2]
  def change
    create_table :iugu_payment_methods do |t|

      t.string :iugu_id
      t.string :token
      t.string :description
      t.boolean :set_as_default

      t.reference :customer

      t.timestamps null: false
    end
  end
end
