class AddDescriptionToExhibitions < ActiveRecord::Migration
  def change
  	add_column :exhibitions, :description, :text
  end
end
