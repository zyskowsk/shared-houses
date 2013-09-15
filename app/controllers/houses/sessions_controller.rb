class Houses::SessionsController < Devise::SessionsController

  # DELETE /resource/sign_out
  def destroy
    signed_out = sign_out
    set_flash_message :notice, :signed_out if signed_out && is_navigational_format?
    super
  end 
end