class AddAddressToExhibitions < ActiveRecord::Migration[5.0]
  def change
  	add_column :exhibitions, :address, :string
  end
end
