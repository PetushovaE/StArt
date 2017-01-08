class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
    	t.string :street_address
    	t.string :city
    	t.string :state
    	t.integer :zipcode
    	t.integer :exhibition_id

      t.timestamps
    end
  end
end
