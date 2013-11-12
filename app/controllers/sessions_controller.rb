class SessionsController < ApplicationController
  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
      )
      
    if user.nil?
      session[:errors] = "Credentials were wrong"
      render :new
    else
      self.current_user = user
      redirect_to factories_url
    end
  end
  
  def destroy
    logout_current_user!
    redirect_to root_url
  end
end
