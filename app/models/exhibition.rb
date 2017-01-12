class Exhibition < ApplicationRecord

	has_many :rsvps
	has_many :users, through: :rsvps
	has_many :comments
	has_many :artists
	
	belongs_to :author, :class_name => 'User', optional: true

	has_one :review
	validates :name, presence: true

	validates :name, :description, presence: true
	validate :validate_end_at_before_start_at

	def address
		"#{self.street_address}, #{self.city}, #{self.state} #{self.zipcode}" 
	end

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
