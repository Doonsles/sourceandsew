class UsersController < ApplicationController
  #before_filter :require_current_user!, :except => [:create, :new]
  
  def new
    @user = User.new
    render :new
  end
  
  def create
    @user = User.new(params[:user])
    
    if @user.save
      self.current_user = @user
      if(current_user.favorites.length == 0)
        redirect_to factories_url
      else
        redirect_to user_favorites_url(@user)
      end
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end
end
