class Comment < ApplicationRecord

	belongs_to :user

	# belongs_to :author, :class_name => 'User', optional: true
	belongs_to :exhibition
	
	validates :content, :presence =>{message: "Cannot be blank"}
end
