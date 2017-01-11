class Rsvp < ApplicationRecord
	belongs_to :user
	belongs_to :exhibition


	def user_name
		self.user.name
	end

	def exhibition_name
		self.exhibition.name
	end
	
end
