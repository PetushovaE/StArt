class Exhibition < ApplicationRecord

	has_many :rsvp
	has_many :users, through: :rsvp
	has_many :comments

	validates :name,:presence => true

	# validate :validate_starts_before_it_ends
end
