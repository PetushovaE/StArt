class AddStatusToRsvps < ActiveRecord::Migration[5.0]
  def change
  	add_column :rsvps, :status, :string
  end
end
