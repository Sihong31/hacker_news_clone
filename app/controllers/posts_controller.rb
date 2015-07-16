class PostsController < ApplicationController

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
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :url)
  end
end
