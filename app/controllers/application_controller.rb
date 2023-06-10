class ApplicationController < ActionController::Base
  add_flash_types :success

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  before_action :set_locale
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_user,
                :login_in?

  private

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:locale]) ? params[:locale] : I18n.default_locale
  end

  def after_sign_in_path_for(_resource)
    current_user.is_a?(Admin) ? admin_tests_path : tests_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[firstname lastname])
  end

  def record_not_found
    render plain: '404 Not Found', status: 404
  end
end
