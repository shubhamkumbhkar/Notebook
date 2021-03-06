class NotesController < ApplicationController
  def index
    #byebug
      @notes =  Note.includes(:comments)
      @note = Note.new
      
    respond_to do |format|
      format.html
      format.json{
        render json:@notes
      }
    end
  end

  def create
   #byebug
    @note = Note.new(note_params)
    @note.user_id = current_user.id
    if @note.save
      redirect_to notes_path
    else
      flash[:notice] = "something went wrong please try again"
      redirect_to notes_path
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    respond_to do |format|
      format.html
      format.json{
        #render json:@notes
      }
    end
    @note = Note.find(params[:id])
    if @note.update(note_params)

      redirect_to notes_path
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy

    redirect_to notes_path
  end
  
  private
    def note_params
      params.require(:note).permit(:name, :body)
    end
end
