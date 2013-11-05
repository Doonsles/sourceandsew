class FactoriesController < ApplicationController
  before_filter :require_current_user!
  def index
    @factories = Factory.all
    
    render :index
  end
  
  def show
    @factory = Factory.find(params[:id])
    
    render :show
  end
end
