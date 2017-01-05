class SessionsController < ApplicationController

	def create
    @user = User.find_or_create_by_omniauth(auth) 
    @user.name = auth['info']['name']
    @user.save
    session[:user_id] = @user.id
    redirect_to @user
  end

  # def create
  #   @user = User.find_or_create_by(:uid => auth['uid']) do |u|
  #     u.name = auth['info']['name']
  #     u.email = auth['info']['email']
  #   end
  #   session[:user_id] = user.id
  #   redirect_to @user
  # end

  def destroy
    self.current_user = nil
    redirect_to root_url, notice: "Signed out"
  end
 
  def auth
    request.env['omniauth.auth']
  end
end
