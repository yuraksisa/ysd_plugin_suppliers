#
# Middleware functionality
#
module Sinatra
 module YSD 
   module SuppliersRestApi
    
     def self.registered(app)
      
       # Create a new supplier
       #
       app.post '/api/suppliers/suppliers', allowed_usergroups: ['staff'] do 

         request.body.rewind
         request_data = JSON.parse(URI.unescape(request.body.read)) 

         # Create the new supplier with empty addresses
         supplier = Yito::Model::Suppliers::Supplier.new
         supplier.company_name = request_data['company_name']
         supplier.document_id = request_data['document_id']
         supplier.email = request_data['email']
         supplier.phone_number = request_data['phone_number']
         supplier.mobile_phone = request_data['mobile_phone']
         supplier.address = LocationDataSystem::Address.new
         supplier.invoice_address = LocationDataSystem::Address.new
         supplier.save

         status 200
         content_type :json
         supplier.to_json

       end

     end
    end #SuppliersRestApi 
 end #YSD
end #Sinatra
