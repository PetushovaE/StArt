class AddArtistToExhibitions < ActiveRecord::Migration[5.0]
  def change
  	add_column :exhibitions, :artist, :string
  end
end
