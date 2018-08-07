require 'rails/generators/active_record'

module ActiveRecord
  module Generators
    class SimpleIuguGenerator < ActiveRecord::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      def create_customers_table
        migration_template "create_simple_iugu_customers.rb", "db/migrate/create_simple_iugu_customers.rb"
      end
      
    end
  end
end
