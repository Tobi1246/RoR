class Admin < User
  
  def admin?
    current_user.is_a?(Admin)
  end

end
