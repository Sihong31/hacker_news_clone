class SessionsController < ApplicationController
skip_before_action :ensure_current_user, only: [:new, :create]
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user
      if user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to posts_path
      else
        flash[:errors] = "Invalid username and password combination."
        redirect_to posts_path
      end
    else
      flash[:errors] = "Username does not exist."
      redirect_to posts_path
    end
  end

  def destroy
    session.clear
    redirect_to posts_path
  end

end
