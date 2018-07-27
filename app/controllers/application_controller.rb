class ApplicationController < ActionController::Base
  
  before_action :authenticate_user!, except: [:index, :show]
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:First_name, :Last_name, :Mobile_no, :avatar, address_attributes: [:address]])
    devise_parameter_sanitizer.permit(:account_update, keys: [:First_name, :Last_name, :Mobile_no, :avatar, address_attributes: [:address]])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:user_id])

  end

end
