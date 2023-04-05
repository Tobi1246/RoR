class ApplicationController < ActionController::Base

  add_flash_types :success

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  include SessionsHelper

  before_action :authenticate_user!

  helper_method :current_user,
                :login_in?

  private

  def authenticate_user!
    unless current_user
      retorn_to_cookies
      redirect_to login_path
    end
  end

  def retorn_to_cookies
    cookies[:return_to] = request.url
  end

  def login_in?
    current_user.present?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def record_not_found
    render plain: '404 Not Found', status: 404
  end
end
