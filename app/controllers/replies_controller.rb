class RepliesController < ApplicationController
  def new
    @replies = Reply.new
  end
  def create
    @comment = Comment.find(params[:comment_id])
    @reply = @comment.replies.create(reply_params)
    redirect_to notes_path
  end
  def edit
    #@note = Note.find(params[:note_id])
    @comment = Comment.find(params[:comment_id])
    @reply = @comment.replies.find(params[:id])
  end
  def update
    @reply = Reply.find(params[:id])
    if @reply.update(reply_params)
      redirect_to notes_path
    end
  end
  def destroy
    @comment = Comment.find(params[:comment_id])
    @reply = @comment.replies.find(params[:id])
    @reply.destroy
    redirect_to notes_path
  end
  private
    def reply_params
      params.require(:reply).permit(:name, :body, :user_id)
    end
end

