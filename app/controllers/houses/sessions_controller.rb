class Houses::SessionsController < Devise::SessionsController

  def destroy
    signed_out = sign_out
    if signed_out && is_navigational_format?
      set_flash_message :notice, :signed_out 
    end

    super
  end 
end