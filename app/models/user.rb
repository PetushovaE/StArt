class User < ApplicationRecord
	
	has_many :rsvps
	has_many :exhibitions, through: :rsvps
	has_many :comments
	# has_many :wishlists

	has_secure_password

	validates :email, :presence => true
	validates :email, :uniqueness => true

	# devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

	def self.find_or_create_by_omniauth(auth_hash)
		self.where(:email => auth_hash["info"]["email"]).first_or_create do |user|
			user.password = SecureRandom.hex
		end
	end

	
end
