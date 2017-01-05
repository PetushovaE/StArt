class SessionsController < ApplicationController

  def destroy
    self.current_user = nil
    redirect_to root_url, notice: "Signed out!"
  end

	def create
    	@user = User.find_or_create_by_omniauth(auth) 
    	@user.name = auth["info"]["name"]
    	@user.save
    	
    	session[:user_id] = @user.id
    	
    	redirect_to @user
  	end
 
  	def auth
    	request.env['omniauth.auth']
  	end
end
