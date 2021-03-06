class ExhibitionsController < ApplicationController

	def index
		# if params[:user_id]
		# 	@exhibitions = Exhibition.find(params[:user_id]).exhibitions
		# 	render json: @exhibitions
		# else
		# 	@exhibitions = Exhibition.all
		# 	render json: @exhibitions
		# end
		@exhibitions = Exhibition.order(created_at: :desc).page(params[:page])
	end

	def show
		@exhibition = Exhibition.find_by(id: params[:id])
		@rsvp = @exhibition.rsvps.build
		render json: @exhibition
		# @exhibition.dates
	end

	def new
		@exhibition = Exhibition.new
		# (author_id: current_user.id)
		# @exhibition.addresses.build
		# @exhibition.dates
		render json: @exhibition
	end

	def create
		@exhibition = Exhibition.new(exhibition_params)
		# byebug
		if @exhibition.save
			# redirect_to user_exhibitions_path, :notice => "Your Exhibition was added."
			# redirect_to @exhibition, :notice => "Your Exhibition was added."
			render json: @exhibition, status: 201
		else
			# render :new
			render json: @exhibition
		end
	end

	def edit 
		@exhibition = Exhibition.find_by(id: params[:id])
	end

	def update
		@exhibition = Exhibition.find_by(id: params[:id])
		if @exhibition.update(exhibition_params)
			redirect_to exhibitions_path, :notice => "Your Exhibition has been updated."
		else
			render :edit
		end
	end

	def destroy
		@exhibition = Exhibition.find_by(id: params[:id])
		@exhibition.delete
		redirect_to user_path(current_user), :notice => "Your Exhibition has been deleted."
		render json: @exhibition
	end

	private

	def exhibition_params
		params.require(:exhibition).permit(:name, :review, :description, :start_at, :end_at, :author_id, :street_address, :city, :state, :zipcode)
	end
end

