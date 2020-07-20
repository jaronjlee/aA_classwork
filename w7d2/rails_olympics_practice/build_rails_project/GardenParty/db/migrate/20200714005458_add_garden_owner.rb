class AddGardenOwner < ActiveRecord::Migration[5.2]
  def change
    add_column :flowers, :garden_id, :integer, null: false
  end
end
