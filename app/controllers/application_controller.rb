class ApplicationController < ActionController::Base
  include Frontendable
  # setupa langs locale by parameter
  include SetLocale

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
 
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone, :email, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone, :email, :password])
  end
end
