class CommentsController < ApplicationController

  def new
    @post = Post.find_by(id: params[:post_id])
    @comment = Comment.new
  end

  def create
    comment = Comment.new(comment_params)
    comment.user_id = session[:user_id]
    comment.post_id = params[:post_id]
    if comment.save
      redirect_to post_path(comment.post_id)
    else
      redirect_to new_post_comment_path(comment.post_id)
    end
  end

  def edit
    @post = Post.find_by(id: params[:post_id])
    @comment = Comment.find_by(id: params[:id])
  end

  def update
    comment = Comment.find_by(id: params[:id])
    comment.assign_attributes(comment_params)
    if comment.save
      redirect_to post_path(comment.post_id)
    else
      redirect_to edit_post_comment_path(post_id: comment.post_id, id: comment.id)
    end
  end

  def destroy
    comment = Comment.find_by(id: params[:id])
    comment.destroy
    redirect_to post_path(comment.post_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
