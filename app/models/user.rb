class User < ApplicationRecord
	has_secure_password
	
	has_many :exhibitions

	has_many :rsvps
	has_many :exhibitions, through: :rsvps

	has_many :comments
	has_many :exhibitions, through: :comments

	validates :email, :presence => true
	validates :email, :uniqueness => true


	def self.find_or_create_by_omniauth(auth_hash)
		self.where(:email => auth_hash['info']['email']).first_or_create do |user|
			user.password = SecureRandom.hex
		end
	end

	def rsvps_count
		self.exhibitions.count
	end	
end
