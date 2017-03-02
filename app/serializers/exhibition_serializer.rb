class ExhibitionSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :address 


  has_many :comments

end
