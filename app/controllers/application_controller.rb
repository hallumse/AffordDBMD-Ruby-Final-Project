class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

protected

  #adapated from https://gist.github.com/withoutwax/46a05861aa4750384df971b641170407
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:zipcode, :email, :password)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:zipcode, :email, :password, :current_password)}
  end
end
