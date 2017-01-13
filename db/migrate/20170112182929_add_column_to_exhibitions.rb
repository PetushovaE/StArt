class AddColumnToExhibitions < ActiveRecord::Migration[5.0]
  def change
  	add_column :exhibitions, :street_address, :string
  	add_column :exhibitions, :city , :string
  	add_column :exhibitions, :state , :string
  	add_column :exhibitions, :zipcode , :integer
  end
end
