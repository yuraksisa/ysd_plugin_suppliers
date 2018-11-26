#
# Middleware functionality
#
module Sinatra
 module YSD 
   module Suppliers
    
     def self.registered(app)
      
        # Add the local folders to the views and translations     
        app.settings.views = Array(app.settings.views).push(File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'views')))
        app.settings.translations = Array(app.settings.translations).push(File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'i18n')))
   
        # New supplier
        #
        app.get '/admin/suppliers/new-simple', allowed_usergroups: ['staff'] do 
        
          if params[:layout] and params[:layout] == 'no'
            load_page :new_simple_supplier, layout: false
          else 
            load_page :new_simple_supplier
          end  

        end

     end
    end #Suppliers 
 end #YSD
end #Sinatra
