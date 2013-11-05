class SessionsController < ApplicationController
  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
      )
      
    if user.nil?
      session[:errors] = "Credentials were wrong"
      puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
      puts "rendering new"
      render :new
    else
      self.current_user = user
      if(current_user.favorites.length == 0)
        puts "!!!!!!!!!!!!!!!!!!!!!!!!!!"
        puts "redirecting to factories"
        redirect_to factories_url
      else
        puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
        puts "redirecting to favorites"
        redirect_to user_favorites_url(user)
      end
    end
  end
  
  def destroy
    logout_current_user!
    redirect_to new_session_url
  end
end
