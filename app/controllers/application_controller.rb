class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :ensure_current_user
  # def logged_in?
  #   !!session[:user_id]
  # end

  # def require_login
  #   unless logged_in?
  #     redirect_to login_path
  #   end
  # end

  def current_user
    User.find_by(id: session[:user_id])
  end

  helper_method :current_user

  def ensure_current_user
    redirect_to login_path unless current_user
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
