class FavoritesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @favorites = @user.favorites
        
    render :index
  end
  
  def create
    @favorite = Favorite.new(params[:favorite])
    if @favorite.save
      redirect_to factories_url
    else
      flash.now[:errors] = @favorite.errors.full_messages
      redirect_to factories_url
    end
  end
  
  def destroy
    @favorite = Favorite.find(params[:id])
    
    @favorite.destroy
    redirect_to factories
  end
end
