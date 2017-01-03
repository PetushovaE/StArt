class Exhibition < ApplicationRecord

	has_many :rsvps
	has_many :users, through: :rsvps
	has_many :comments

	validates :name,:presence => true

	# validate :validate_starts_before_it_ends
end
