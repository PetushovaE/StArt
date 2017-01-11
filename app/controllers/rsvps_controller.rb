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
		if @rsvp.save
			flash[:success] = 'You have RSVPed!'
		redirect_to rsvp_path(@rsvp)
		# redirect_to Exhibition.find(params[:exhibition_id]) 
		end 
	end

	def update
	end

	private

	def rsvp_params
		params.require(:rsvp).permit(:exhibition_id, :user_id, :status)
	end
	
end
