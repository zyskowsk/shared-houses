class Mates::RegistrationsController < Devise::RegistrationsController 
  
  
  protected

      def after_update_path_for(resource)
        mate_path(current_mate)
      end
      
      def after_sign_up_path_for(resource)
        house_path(current_house)
      end
      
end