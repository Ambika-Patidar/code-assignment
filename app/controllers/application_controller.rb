class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name dob mobile_number])
  end

   def after_sign_up_path_for(resource)
    redirect_to teams_path
  end

  def after_sign_in_path_for(resource)
    teams_path
  end
end
