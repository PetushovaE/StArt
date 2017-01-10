class RsvpsController < ApplicationController

	def show
		@rsvp = Rsvp.find_by(id: params[:id])
	end
	
	def index
		@rsvps = Rsvp.all 
		# @attendees_sum = @rsvps.where(accept: true).sum(:attendees)
	end

	def new
		@rsvp = Rsvp.new
	end

	def create
		@rsvp = current_user.rsvps.build(rsvp_params)
		@rsvp.save
			# flash[:success] = 'Thank you for RSVP!'
		redirect_to rsvp_path(@rsvp)  
	end

	def update
	end

	private

	def rsvp_params
		params.require(:rsvp).permit(:exhibition_id, :user_id, :status)
	end
	
end
