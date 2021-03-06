class FavoritesController < ApplicationController
  before_filter :require_current_user!
  def index
    @factories = current_user.favorited_factories.includes(:notes)
    @factories.each do |factory|
      factory.favorited = true
    end
    
    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @factories }
    end
  end
  
  def create
    @favorite = Favorite.new(:user_id => current_user.id, 
        :factory_id => params[:factory_id])
    if @favorite.save
      redirect_to factories_url
    else
      flash.now[:errors] = @favorite.errors.full_messages
      redirect_to factories_url
    end
  end
  
  def destroy
    sleep(0.25)
    @favorite = Favorite.find_by_factory_id_and_user_id(params[:factory_id], current_user.id)
    @favorite.destroy
    head :ok
  end  
end
