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
		
	end

	def new
		@exhibition = Exhibition.new(author_id: current_user.id)
		@exhibition.addresses.build
	end


	def create
		@exhibition = Exhibition.new(exhibition_params)
		if @exhibition.save
		redirect_to user_exhibition_path(current_user, @exhibition)
	else
		render :new
	end
	end


	def edit 
		@exhibition = Exhibition.find(params[:id])
	end

	def update
		@exhibition = Exhibition.find(params[:id])
		@exhibition.update(exhibition_params)
		redirect_to exhibition_path(@exhibition)
	end

	def destroy
		@exhibition = Exhibition.find_by(id: params[:id])
		@exhibition.destroy
		flash[:notice] = "Exhibition deleted."
    	# redirect_to exhibitions_path
		redirect_to user_rsvp_path(current_user, @exhibition.rsvp)
		# end
	end

	private

	def exhibition_params
		params.require(:exhibition).permit(:name, :artist, :review, :description, :author_id, address_ids:[], addresses_attributes:[:street_address, :city, :state, :zipcode
    ])
	end
# :dates, 

end
