class Exhibition < ApplicationRecord

	has_many :rsvps
	has_many :users, through: :rsvps
	has_many :comments
	has_many :artists

	has_many :addresses
  	accepts_nested_attributes_for :addresses

	has_one :review

	validates :name, :description, :address, presence: true
	validate :validate_end_at_before_start_at

	def dates
		if start_at && end_at
			self.start_at.strftime('%B %d, %Y') + " - " + self.end_at.strftime('%B %d, %Y')
		end
	end

	def self.most_rsvp
		Exhibition.all.max_by do |exhibition|
			exhibition.rsvps.count
		end
	end

	def average_review_rating
		self.reviews.average(:rating)
	end


  	def validate_end_at_before_start_at
    	if end_at && start_at
      		errors.add(:end_at, "Error ") if end_at < start_at
    	end
    end
end
