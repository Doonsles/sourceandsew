class FactoriesController < ApplicationController
  before_filter :require_current_user!
  def index
    #below works for non-pagination
    # @factories = Factory.all
    # @factories.each do |factory|
    #   if Favorite.find_by_factory_id_and_user_id(factory.id, current_user.id)
    #     factory.favorited = true
    #   else
    #     factory.favorited = false
    #   end
    # end
    # 
    # respond_to do |format|
    #   format.html { render :index}
    #   format.json { render :json => @factories }
    # end
    
    
    #below is example from AA GitHub page
    # @factories = Factory.page(params[:page])
    # @factories.each do |factory|
    #   if Favorite.find_by_factory_id_and_user_id(factory.id, current_user.id)
    #     factory.favorited = true
    #   else
    #     factory.favorited = false
    #   end
    # end
    # 
    # respond_to do |format|
    #   format.html { render :index => @factories }
    #   format.json {
    #     render :json => { 
    #       models: @factories,
    #       page_number: params[:page],
    #       total_pages: @factories.total_pages
    #    }
    #  }
    # end
    
    all_factories = Factory.all
    all_factories.each do |factory|
      if Favorite.find_by_factory_id_and_user_id(factory.id, current_user.id)
        factory.favorited = true
      else
        factory.favorited = false
      end
    end
    
    @factories = Kaminari.paginate_array(all_factories).page(params[:page]).per(6)
   
    respond_to do |format|
      format.html { render :index}
      format.json { render :json => @factories }
    end 

  end
  
  def show
    @factory = Factory.find(params[:id])
    
    render :show
  end
end
