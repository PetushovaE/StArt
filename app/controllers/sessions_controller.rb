class SessionsController < ApplicationController
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
