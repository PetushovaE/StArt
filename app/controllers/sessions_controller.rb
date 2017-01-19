class SessionsController < ApplicationController

	def create
    if auth
      @user = User.find_or_create_by_omniauth(auth) 
      @user.name = auth['info']['name']
      @user.save
      session[:user_id] = @user.id
      redirect_to exhibitions_path, :notice => "Welcome back #{@user.name}!"
    else
      @user = User.find_by(email: params[:session][:email].downcase)
      if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        redirect_to exhibitions_path, :notice => "Welcome back #{@user.name}!"
      else
        flash.now[:danger] = 'Invalid email/password combination'
        render 'new'
      end
    end
  end

  def destroy
    logout
    redirect_to root_url, notice: "Signed out"
  end
 
  def auth
    request.env['omniauth.auth']
  end


end
