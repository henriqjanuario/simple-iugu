class SimpleIugu::Customer < ActiveRecord::Base
  self.table_name = "simple_iugu_customers"

  belongs_to :customerable, polymorphic: true
end