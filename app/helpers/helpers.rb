module UsersHelpers
  def current_user
    @current_user = User.find_by(id: session[:user_id]) if logged_in?
  end

  def logged_in?
    !!session[:user_id]
  end

  def set_user(user)
    session[:user_id] = user.id
  end

  def authorized?(user_id)
    session[:user_id] == user_id
  end

end

helpers UsersHelpers
