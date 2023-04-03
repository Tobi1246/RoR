module SessionsHelper

  def login(user)
    session[:user_id] = user.id
  end

  def quit
   session.delete(:user_id)
  end

  def login?
    !current_user.nil?
  end

end
