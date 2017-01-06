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
		@exhibition.addresses.build
	end

	def new
		@exhibition = Exhibition.new
		@exhibition.addresses.build
	end


	def create

		@exhibition = Exhibition.create(exhibition_params)
		redirect_to exhibition_path(@exhibition)
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
		params.require(:exhibition).permit(:name, :artist, :review, :description, :user_id, address_ids:[], addresses_attributes:[:street_address, :city, :state, :zipcode
    ])
	end
# :dates, 

end
