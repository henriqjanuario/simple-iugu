class Iugu::Customer < ActiveRecord::Base
  self.table_name = "iugu_customers"

  belongs_to :customerable, polymorphic: true
end