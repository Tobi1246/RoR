class UsersController < ApplicationController

  skip_before_action :authenticate_user!

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to tests_path, success: "Your create account!"
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :firstname, :age, :lastname, :password, :password_confirmation)
  end

end