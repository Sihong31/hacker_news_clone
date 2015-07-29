class UsersController < ApplicationController
  skip_before_action :ensure_current_user, only: [:new, :create]
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to login_path
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @username = @user.username
    @posts = @user.posts
    @comments = @user.comments
  end

 private

 def user_params
  params.require(:user).permit(:username,:first_name,:last_name,:password)
 end

end
