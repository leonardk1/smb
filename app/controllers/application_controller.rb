class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  # Overwriting the sign_out redirect path method
  def after_sign_out_path
    new_contact_session_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :firstname, :lastname, :role_id, :password, :password_confirmation) }
  end
end
