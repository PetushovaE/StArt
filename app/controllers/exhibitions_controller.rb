class ExhibitionsController < ApplicationController

	def index
		if params[:user_id]
			@exhibitions = Exhibition.find(params[:user_id]).exhibitions
		else
			@exhibitions = Exhibition.all
		end
	end

	def show
		@exhibition = Exhibition.find_by(id: params[:id])

		@rsvp = @exhibition.rsvps.build
		# @exhibition.dates
	end

	def new
		@exhibition = Exhibition.new(author_id: current_user.id)
		# @exhibition.addresses.build
		@exhibition.dates
	end


	def create
		@exhibition = Exhibition.new(exhibition_params)
		# byebug
		if @exhibition.save
			# redirect_to user_exhibitions_path, :notice => "Your Exhibition was added."
			redirect_to @exhibition, :notice => "Your Exhibition was added."
		else
			render :new
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
		@exhibition.destroy
		redirect_to @user, :notice => "Your Exhibition has been deleted."
	end

	private

	def exhibition_params
		params.require(:exhibition).permit(:name, :artist, :review, :description, :start_at, :end_at, :author_id, :street_address, :city, :state, :zipcode)
	end
 

end

