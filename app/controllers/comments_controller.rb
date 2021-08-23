class CommentsController < ApplicationController
def new
  @comments = Comment.new
end
def create
  @note = Note.find(params[:note_id])
  @comment = @note.comments.new(comment_params)
  @comment.user_id = current_user.id
  if @comment.save
   redirect_to notes_path
  else
    flash[:notice] = "something went wrong please try again"
    redirect_to notes_path
  end
end
def edit
  @note = Note.find(params[:note_id])
  @comment = @note.comments.find(params[:id])
  # @note = Note.find(params[:id])
end
def update
  @note = Note.find(params[:note_id])
  @comment = @note.comments.find(params[:id])
  if @comment.update(comment_params)
    redirect_to notes_path
  else
    #render :edit
  end
end
def destroy
  @note = Note.find(params[:note_id])
  @comment = @note.comments.find(params[:id])
  @comment.destroy
  redirect_to notes_path
end
    
private
  def comment_params
    params.require(:comment).permit(:name, :body)
  end
end

