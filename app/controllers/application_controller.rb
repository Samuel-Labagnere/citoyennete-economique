class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  add_breadcrumb 'Accueil', :root_path

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

  def check_super_admin
    if !current_user || !current_user.is_super_admin
      redirect_to admin_path
    end
  end

  def after_sign_in_path_for(resource)
    admin_path
  end
end
