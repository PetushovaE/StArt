class RsvpsController < ApplicationController

	def index
		@rsvps = Rsvp.all 
	end

	def show
		@rsvp = Rsvp.find_by(id: params[:id])
	end

	def new
		@rsvp = Rsvp.new
	end

	def create
		@rsvp = current_user.rsvps.build(rsvp_params)
		if @rsvp.save
			flash[:success] = 'You have RSVPed!'
		redirect_to user_path(current_user)
		end 
	end

	def update
	end

	def destroy
		@rsvp = Rsvp.find_by(id: params[:id])
		@rsvp.delete
		# redirect_to rsvps_path, notice: 'You removed rsvped exhibition.' 
		redirect_to user_path(current_user), notice: 'You removed rsvped exhibition.' 
	end

	private

	def rsvp_params
		params.require(:rsvp).permit(:exhibition_id, :user_id, :status)
	end
	
end
