class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def logged_in?
    !!session[:user_id]
  end

  def require_login
    unless logged_in?
      redirect_to login_path
    end
  end

  def is_owner?(id)
    session[:user_id] == id
  end

  def owner_auth(id)
    unless is_owner?(id)
     redirect_to posts_path
    end
  end

end
