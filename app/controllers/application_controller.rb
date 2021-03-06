class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

  include Pundit
  	protect_from_forgery

  rescue_from Pundit::NotAuthorizedError do
  	redirect_to root_url, alert: "you don't have access"
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :user_type])
  end
end
