class CommentsController < ApplicationController
  before_action :require_login, only:[:new,:edit,:delete, :vote]
  # Also can use private methods as a middle ground between totally DRY code and more readable code
  def new
    @post = Post.find_by(id: params[:post_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = session[:user_id]
    @comment.post_id = params[:post_id]
    if @comment.save
      request.xhr? ? render(partial: 'comment', object: @comment, layout: false) : redirect_to(@comment)
    else
      request.xhr? ? render(status:422) : render('new')
    end
  end

  def edit
    # @post = Post.find_by(id: params[:post_id])
    @comment = Comment.find_by(id: params[:id])
    # Use your associations to avoid unnecessary db calls.
    @post = @comment.post
  end

  def vote
    comment = Comment.find_by(id: params[:id])
    if request.xhr?
      comment.increment!(:vote_count)
      @comment_vote = comment.vote_count
      render json: {vote_count: @comment_vote}.to_json
    else
      redirect_to post_path(id: comment.post_id)
    end
  end

  def update
    comment = Comment.find_by(id: params[:id])
    comment.assign_attributes(comment_params)
    if comment.save
      redirect_to post_path(comment.post_id)
    else
      # let your user know why it didn't save
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
