class Contacts::SessionsController < Devise::SessionsController
  #before_filter :configure_sign_in_params, only: [:create]
  layout "login_registration"

  #GET /resource/sign_in
  def new
    super
  end

  #POST /resource/sign_in
  def create
    super
  end

  #DELETE /resource/sign_out
  def destroy
    super
    after_sign_out_path
  end

  # protected
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
