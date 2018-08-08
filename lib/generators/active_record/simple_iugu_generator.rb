require 'rails/generators/active_record'

module ActiveRecord
  module Generators
    class SimpleIuguGenerator < ActiveRecord::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      def create_customers_table
        migration_template "create_iugu_customers.rb", "db/migrate/create_iugu_customers.rb"
      end

      def create_payment_tokens_table
        migration_template "create_iugu_payment_tokens.rb", "db/migrate/create_iugu_payment_tokens.rb"
      end

      def create_payment_methods_table
        migration_template "create_iugu_payment_methods.rb", "db/migrate/create_iugu_payment_methods.rb"
      end

      def create_invoices_table
        migration_template "create_iugu_invoices.rb", "db/migrate/create_iugu_invoices.rb"
      end

    end
  end
end
