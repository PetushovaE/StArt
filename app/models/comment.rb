class Comment < ApplicationRecord

	belongs_to :user, optional: true
	belongs_to :exhibition
	
	validates :content, :presence =>{message: "Cannot be blank"}
end
