class Mates::SessionsController < Devise::SessionsController
  before_filter :signed_in_house

  # DELETE /resource/sign_out
  def destroy
    redirect_path = house_path(current_house)
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    set_flash_message :notice, :signed_out if signed_out && is_navigational_format?

    # We actually need to hardcode this as Rails default responder doesn't
    # support returning empty response on GET request
    respond_to do |format|
      format.all { head :no_content }
      format.any(*navigational_formats) { redirect_to redirect_path }
    end
  end
  
  def after_sign_in_path_for(resource)
    house_path(current_house)
  end
    
  private

    def signed_in_house
      redirect_to root_path, notice: "Please sign in." unless house_signed_in?
    end
  
end