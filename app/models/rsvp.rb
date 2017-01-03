class Rsvp < ApplicationRecord
	belongs_to :user
	belongs_to :exhibition

	scope :yes, -> { where( :answer => 'yes' ) }
	scope :no, -> { where( :answer => 'no' ) }
	scope :maybe, -> { where( :answer => 'maybe' ) }

	def answer= value
		self[:answer] = value.to_s
	end
end
