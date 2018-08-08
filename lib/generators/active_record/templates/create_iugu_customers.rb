class CreateIuguCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :iugu_customers do |t|

      t.string :email
      t.string :name
      t.string :notes
      t.integer :phone
      t.integer :phone_prefix
      t.string :cpf_cpnj
      t.string :cc_emails
      t.string :zipcode
      t.string :number
      t.string :street
      t.string :city
      t.string :state
      t.string :district
      t.string :complement
      t.string :default_payment_method_id
      t.string :iugu_id
      t.references :customerable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
