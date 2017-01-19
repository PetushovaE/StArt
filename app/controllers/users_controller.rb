class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

	def index
		@users = User.all
	end

	def show
		@user = User.find_by(id: params[:id])
    @exhibitions = @user.exhibitions
	end

	def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        # login @user
        flash[:success] = "Welcome to St.Art App!"
        redirect_to @user
      else
        render :new 
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.' 
      	else
      	render :edit
     	end
  end
  	
	private

	# Use callbacks to share common setup or constraints between actions.
	def set_user
		@user = User.find_by(id: params[:id])
	end

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end
