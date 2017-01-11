class AddAuthorIdToExhibitions < ActiveRecord::Migration[5.0]
  def change
  	add_column :exhibitions, :author_id, :integer
  end
end
