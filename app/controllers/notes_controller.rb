class NotesController < ApplicationController
  def index
    current_user.id
    #@factories = Factory.includes(:notes)
    #@factories = Factory.joins(:notes).where("notes.user_id = ?", current_user.id)
    #@factories = Factory.joins(:notes).where(user_id: current_user.id);
    @factories = current_user.noted_factories.includes(:notes)
    
    respond_to do |format|
      format.html { render :index}
      format.html { render :json => @factories }
    end
  end
  
  # def update
  #   @note = Note.find(params[:id])
  #   
  #   if @note.update_attributes(params[:note])
  #     redirect_to factories_url
  #   else
  #     flash.now[:errors] = @note.errors.full_messages
  #     redirect_to factories_url
  #   end
  # end
  # 
  # def create
  #   @note = Note.new(params[:note])
  #   if @note.save
  #     redirect_to factories_url
  #   else
  #     flash.now[:errors] = @note.errors.full_messages
  #     redirect_to factories_url
  #   end
  # end
  # 
  # def destroy
  #   @note = Note.find(params[:id])
  #   
  #   @note.destroy
  #   redirect_to factories_url
  # end
end
