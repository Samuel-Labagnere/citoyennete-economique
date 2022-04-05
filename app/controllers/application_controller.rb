class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

  def indicateur_clean(symbol)
    I18n.t("activerecord.attributes.indicateurs_list." + symbol.to_s)
  end
end
