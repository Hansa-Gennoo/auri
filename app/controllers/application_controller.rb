class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(resource)
    landing_page = resource.landing_page || resource.create_landing_page!(title: "My Landing Page")
    dashboard_landing_page_path(landing_page)
  end


 def after_sign_up_path_for(resource)
    after_sign_in_path_for(resource)
  end


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :display_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
end
