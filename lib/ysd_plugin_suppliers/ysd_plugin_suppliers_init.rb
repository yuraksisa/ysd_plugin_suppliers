require 'ysd-plugins' unless defined?Plugins::Plugin

Plugins::SinatraAppPlugin.register :suppliers do

   name=        'suppliers'
   author=      'yurak sisa'
   description= 'Integrate suppliers'
   version=     '0.1'
   sinatra_extension Sinatra::YSD::Suppliers  
   sinatra_extension Sinatra::YSD::SuppliersRestApi                 
   hooker            Huasi::SuppliersExtension
  
end