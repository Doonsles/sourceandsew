class FavoritesController < ApplicationController
  before_filter :require_current_user!
  def index
    @factories = current_user.favorited_factories.includes(:notes)
    @factories.each do |factory|
      puts "#{factory}"
      factory.favorited = true
    end
    
    
    
    # @factories = Factory.all 
    # @factories.each do |factory|
    #   if Favorite.find_by_factory_id_and_user_id(factory.id, current_user.id)
    #     factory.favorited = true
    #   else
    #     factory.favorited = false
    #   end
    # end
    
    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @factories }
    end
    # render :index
  end
  
  def create
    puts params
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
    @favorite = Favorite.find_by_factory_id_and_user_id(params[:factory_id], current_user.id)
    @favorite.destroy
    head :ok
    
    # @favorite = Favorite.find(params[:id])
    # 
    # @favorite.destroy
    # redirect_to factories_url
  end
  
end
