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
      if(self.current_user.favorites.length == 0)
        redirect_to factories_url
      else
        redirect_to favorites_url
      end
    end
  end
  
  def destroy
    logout_current_user!
    redirect_to new_session_url
  end
end
