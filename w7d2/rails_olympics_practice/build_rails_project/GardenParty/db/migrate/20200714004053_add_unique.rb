class AddUnique < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :username, unique: true
    add_index :flowers, :flower_type, unique: true
    add_index :gardens, :name, unique: true
  end
end
