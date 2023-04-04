class SessionsController < ApplicationController

  skip_before_action :authenticate_user!

  def new

  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to path_after_login, success: 'Welcom back!'
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Emald and Password pleas'
      render :new
    end
  end

  def destroy
   quit 
   redirect_to root_url, notice: "Your quit in account"
  end

  def path_after_login
    cookies[:return_to] || root_path
    cookies.delete :return_to
  end
end
