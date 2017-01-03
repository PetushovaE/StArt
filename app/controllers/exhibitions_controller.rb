class ExhibitionsController < ApplicationController



	def index
		@exhibitions = Exhibition.all
	end

	def show
		@exhibition = Exhibition.find_by(id: params[:id])
	end

	def create
	end

	def destroy
		@exhibition = Exhibition.find_by(id: params[:id])
		@exhibition.destroy
		redirect_to user_rsvp_path(current_user, @exhibition.rsvp)
		# end
	end

	private

	def exhibition_params
		params.require(:exhibition).permit(:name, :start_at, :end_at)
	end


end
