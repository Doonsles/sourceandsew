class NotesController < ApplicationController
  def index
    current_user.id

    @factories = current_user.noted_factories.includes(:notes)
    
    
    puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    puts"The current user is #{current_user}"
    puts "The current user's noted factores are"
    current_user.noted_factories.each do |factory|
      puts factory.name
    end
    
    puts "the @factories are "
    @factories.each do |factory|
      puts factory.name
    end
    
    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @factories }
    end
  end
  
  def update
    # @note = Note.find(params[:id])
    # 
    # if @note.update_attributes(params[:note])
    #   redirect_to factories_url
    # else
    #   flash.now[:errors] = @note.errors.full_messages
    #   redirect_to factories_url
    # end
  end
  
  def create
    puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    puts "inside create method"
    puts "the params are #{params}"
    
    @note  = Note.new(params[:note].merge({:user_id => current_user.id}))
    puts "the new note is #{@note}"
    if @note.save
      render :json => @note
    else
      flash.now[:errors] = @note.errors.full_messages
      render :json => @note.errors, :status => 422
    end
  end
  
  def destroy
  #   @note = Note.find(params[:id])
  #   
  #   @note.destroy
  #   redirect_to factories_url
  end
end
