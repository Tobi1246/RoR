module SessionsHelper

  def login(user)
    session[:user_id] = user.id
  end

  def quit
   session.delete(:user_id)
  end

end
