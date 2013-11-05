class NotesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @notes = @user.notes
        
    render :index
  end
  
  def edit
  end
  
  def update
  end
  
  def create
    @note = Note.new(params[:note])
    if @note.save
      redirect_to factories_url
    else
      flash.now[:errors] = @note.errors.full_messages
      redirect_to factories_url
    end
  end
  
  def destroy
  end
end
