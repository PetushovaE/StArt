class User < ApplicationRecord
	
	has_many :rsvp
	has_many :exhibitions, through: :rsvp
	has_many :comments
	# has_many :wishlists

	
end
