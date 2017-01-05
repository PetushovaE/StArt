class CreateArtists < ActiveRecord::Migration[5.0]
  def change
    create_table :artists do |t|
    	t.string :name
    	t.string :exhibition_id

      t.timestamps
    end
  end
end