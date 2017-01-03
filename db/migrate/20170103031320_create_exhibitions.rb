class CreateExhibitions < ActiveRecord::Migration[5.0]
  def change
    create_table :exhibitions do |t|
    	t.string :name
    	t.datetime :start_at
    	t.datetime :end_at

      t.timestamps
    end
  end
end
