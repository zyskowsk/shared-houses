class Houses::RegistrationsController < Devise::RegistrationsController 

  protected
    def after_update_path_for(resource)
      house_path(current_house)
    end
      
    def after_sign_up_path_for(resource)
      new_mate_registration_path
    end  
end
  