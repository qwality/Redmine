class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    load_and_authorize_resource unless: :devise_controller?

    rescue_from CanCan::AccessDenied do |exception|
      redirect_to new_user_session_path, alert: exception.message unless user_signed_in?
    end
  
    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :address])
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :address, :avatar])
    end
  end
  