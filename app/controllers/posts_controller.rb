class PostsController < ApplicationController
  before_action :require_login, only:[:new,:edit,:delete]

  def index
    @posts = Post.all.order("created_at desc")
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.user_id = session[:user_id]
    if post.save
      redirect_to post_path(post)
    else
      redirect_to new_post_path
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @comments = @post.comments
  end

  def edit
    @post = Post.find_by(id: params[:id])
    owner_auth(@post.user_id)
  end

  def update
    post = Post.find_by(id: params[:id])
    post.assign_attributes(post_params)
    if post.save
      redirect_to post_path(post)
    else
      redirect_to edit_post_path(post)
    end
  end

  def destroy
    post = Post.find_by(id: params[:id])
    post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :url)
  end
end
