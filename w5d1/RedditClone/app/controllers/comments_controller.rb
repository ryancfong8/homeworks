class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    render :new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to post_url(@comment.post_id)
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to new_post_comment_url
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :author_id, :post_id)
  end
end
