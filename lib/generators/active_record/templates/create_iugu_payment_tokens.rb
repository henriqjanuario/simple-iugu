class CreateIuguPaymentTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :iugu_payment_tokens do |t|

      t.string  :iugu_id
      t.string  :iugu_account_id
      t.string  :method
      t.string  :brand
      t.string  :holder_name
      t.string  :display_number
      t.string  :bin
      t.string  :verification_value
      t.integer :month
      t.integer :year
      t.boolean :test
      t.json    :data


      t.timestamps null: false
    end
  end
end
