class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    post = Post.find(params[:post_id])
    comment = Comment.new(comment_params)
    comment.post_id = post
    puts comment.save
    if comment.save
      flash[:success] = 'Comment created successfully'
    else
      flash[:error] = 'Comment not created'
    end
    redirect_to "/users"
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
