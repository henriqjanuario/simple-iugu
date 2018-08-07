class CreateSimpleIuguCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :simple_iugu_customers do |t|
  
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
      t.belongs_to :customerable

      t.timestamps null: false
    end
  end
end
