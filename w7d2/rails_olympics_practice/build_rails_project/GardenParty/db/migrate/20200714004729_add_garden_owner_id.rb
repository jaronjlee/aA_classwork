class AddGardenOwnerId < ActiveRecord::Migration[5.2]
  def change
    add_column :gardens, :garden_owner_id, :integer, null: false
  end
end
