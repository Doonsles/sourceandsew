class NotesController < ApplicationController
  before_filter :require_current_user!
  def index
    current_user.id

    # @factories = current_user.noted_factories.includes(:notes)
    @factories = Factory.all
    
    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @factories }
    end
  end
  
  def update
    @note = Note.find(params[:id])
    
    if @note.update_attributes(params[:note])
      render :json => @note
    else
      flash.now[:errors] = @note.errors.full_messages
      render :json => @note.errors, :status => 422
    end
  end
  
  def create
    @note  = Note.new(params[:note].merge({:user_id => current_user.id}))
    if @note.save
      render :json => @note
    else
      flash.now[:errors] = @note.errors.full_messages
      render :json => @note.errors, :status => 422
    end
  end
  
  def destroy
    @note = Note.find(params[:id])
    
    @note.destroy
    render :json => {}
  end
end
