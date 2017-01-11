class Address < ApplicationRecord
	belongs_to :exhibition, optional: true
end
