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
		@exhibition.dates
	end


	def create
		@exhibition = Exhibition.new(exhibition_params)
		# byebug.pry
		if @exhibition.save
			# redirect_to user_exhibitions_path, :notice => "Your Exhibition was added."
			redirect_to exhibitions_path, :notice => "Your Exhibition was added."
		else
			render :new
		end
	end

	def edit 
		@exhibition = Exhibition.find_by(id: params[:id])
	end

	def update
		@exhibition = Exhibition.find(params[:id])
		if @exhibition.update(exhibition_params)
			redirect_to exhibitions_path, :notice => "Your Exhibition has been updated."
		else
			render :edit
		end
	end

	def destroy
		@exhibition = Exhibition.find_by(id: params[:id])
		@exhibition.destroy
		redirect_to exhibitions_path, :notice => "Your Exhibition has been deleted."
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


# class ExhibitionsController < ApplicationController

# 	def index
# 		if params[:user_id]
# 			@exhibitions = Exhibition.find(params[:user_id]).exhibitions
# 		else
# 			@exhibitions = Exhibition.all
# 		end
# 	end

# 	def show
# 		@exhibition = Exhibition.find_by(id: params[:id])
		
# 	end

# 	def new
# 		@exhibition = Exhibition.new(author_id: current_user.id)
# 		@exhibition.addresses.build
# 		@exhibition.dates
# 	end


# 	def create
# 		@exhibition = Exhibition.new(exhibition_params)
# 		# @exhibition.addresses.build(exhibition_params)
		

# 		if @exhibition.save
# 			# redirect_to user_exhibitions_path, :notice => "Your Exhibition was added."
# 			redirect_to exhibitions_path, :notice => "Your Exhibition was added."
# 		else
# 			render :new
# 		end
# 	end

# 	def edit 
# 		@exhibition = Exhibition.find_by(id: params[:id])
# 	end

# 	def update
# 		@exhibition = Exhibition.find(params[:id])
# 		if @exhibition.update(exhibition_params)
# 			redirect_to exhibitions_path, :notice => "Your Exhibition has been updated."
# 		else
# 			render :edit
# 		end
# 	end

# 	def destroy
# 		@exhibition = Exhibition.find_by(id: params[:id])
# 		@exhibition.destroy
# 		redirect_to exhibitions_path, :notice => "Your Exhibition has been deleted."
#     	# redirect_to exhibitions_path
# 		redirect_to user_rsvp_path(current_user, @exhibition.rsvp)
# 		# end
# 	end

# 	private

# 	def exhibition_params
# 		params.require(:exhibition).permit(:name, :artist, :review, :description, :author_id, address_ids:[], addresses_attributes:[:street_address, :city, :state, :zipcode
#     ])
# 	end
# # :dates, 

# end
