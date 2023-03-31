class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  helper_method :corrent_user

  private

  def authenticate_user!
    unless corrent_user
      redirect_to login_path
    end
  end

  def login_in?
    corrent_user.present?
  end

  def corrent_user
    @corrent_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def record_not_found
    render plain: '404 Not Found', status: 404
  end
end
