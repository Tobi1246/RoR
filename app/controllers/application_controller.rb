class ApplicationController < ActionController::Base

  add_flash_types :success

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_user,
                :login_in?

  private

  def admin?(current_user)
    current_user.type == 'Admin'
  end


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname])
  end

  def record_not_found
    render plain: '404 Not Found', status: 404
  end
end
