class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def after_sign_in_path_for(resource)
    house_path(current_house)
  end
  
  
  def after_sign_up_path_for(resource)
      new_mate_registration_path
  end
end
