class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]

	def index
		@users = User.all
	end

	def show
		@user = User.find_by(id: params[:id])
	end

	def new
    	@user = User.new
  	end

  	def create
    	@user = User.new(user_params)
    	respond_to do |format|
      		if @user.save
        		session[:user_id] = @user.id
        		format.html { redirect_to user_path(@user), notice: "Welcome to the StArt!" }
      		else
        		format.html { render :new }
      		end
    	end
  	end

  	def edit
  	end

  	def update
    	respond_to do |format|
      		if @user.update(user_params)
        		findormat.html { redirect_to @user, notice: 'User was successfully updated.' }
      		else
        		format.html { render :edit }
     	 	end
    	end
  	end


	private

	# Use callbacks to share common setup or constraints between actions.
	def set_user
		@user = User.find_by(id: params[:id])
	end

	def users_params
		params.require(:user).permit(:name, :password)
	end


end
