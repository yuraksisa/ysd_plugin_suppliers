require 'data_mapper' unless defined?DataMapper::Resource

module Yito
  module Model
    module Suppliers
      class Supplier
        include DataMapper::Resource

        storage_names[:default] = 'supplierds_suppliers'

        property :id, Serial
        property :company_name, String, length: 100
        property :name, String, length: 40
        property :surname, String, length: 40
        property :document_id, String, length: 50
        property :email, String, length: 40
        property :phone_number, String, length: 15
        property :mobile_phone, String, length: 15
        property :language, String, length: 3

        belongs_to :address, 'LocationDataSystem::Address', required: false # Address 
        belongs_to :invoice_address, 'LocationDataSystem::Address', required: false # Invoice address

      end
    end
  end
end