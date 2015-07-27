class PostsController < ApplicationController
  # before_action :require_login, only:[:new,:edit,:delete, :vote]

  def index
    @posts = Post.all.order("created_at desc")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      request.xhr? ? render(partial: 'post', object: @post, layout: false) : redirect_to(@post)
    else
      request.xhr? ? render(status:422) : render('new')
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

  def vote
    post = Post.find_by(id: params[:id])
    if request.xhr?
      post.increment!(:vote_count)
      @post_vote = post.vote_count
      render json: {post_vote: @post_vote}.to_json
    else
      redirect_to posts_path
    end
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
