class ApplicationController < ActionController::Base

  skip_before_action :verify_authenticity_token, if: :json_request?
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :type, :password_confirmation)}
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name :password, :password_confirmation, :current_password, profile_attributes: [:dob, :address, :id, :dp])}
    end

  protected
    def json_request?
      request.format.json?
    end

end

