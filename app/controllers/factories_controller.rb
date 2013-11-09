class FactoriesController < ApplicationController
  before_filter :require_current_user!
  def index
    @factories = Factory.all
    @factories.each do |factory|
      if Favorite.find_by_factory_id_and_user_id(factory.id, current_user.id)
        factory.favorited = true
      else
        factory.favorited = false
      end
    end
    
    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @factories }
    end
    #render :index
  end
  
  def show
    @factory = Factory.find(params[:id])
    
    render :show
  end
  

end
