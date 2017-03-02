class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

	def index
		@users = User.all
    render json :@user
	end

	def show
		@user = User.find_by(id: params[:id])
    @exhibitions = @user.exhibitions
    render json: @user
	end

	def new
    @user = User.new
    render json: @user
  end

  def create
    @user = User.new(user_params)
      if @user.save
        # login @user
        flash[:success] = "Welcome to St.Art App!"
        # redirect_to @user
        render json: @user
      else
        # render :new 
        render json: {errors: @user.errors.full_messages, status: :uprocessable_entity}
    end
  end

  def edit
    @user = User.find(params[:id])
    render json: @user
  end

  def update
    if @user.update(user_params)
      # redirect_to @user, notice: 'User was successfully updated.' 
      	render json: @user
        else
      	# render :edit
        render json: {errors: @user.errors.full_messages, status: :uprocessable_entity}
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
