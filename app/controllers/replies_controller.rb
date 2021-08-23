class RepliesController < ApplicationController
  def new
    @replies = Reply.new
  end
  def create
    @comment = Comment.find(params[:comment_id])
    @reply = @comment.replies.new(reply_params)
    @reply.user_id = current_user.id
    if @comment.save
     redirect_to notes_path
    else
      flash[:notice] = "something went wrong please try again"
      redirect_to notes_path
    end
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
      params.require(:reply).permit(:name, :body)
    end
end

