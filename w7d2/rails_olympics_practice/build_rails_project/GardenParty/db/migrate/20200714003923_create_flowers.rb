class CreateFlowers < ActiveRecord::Migration[5.2]
  def change
    create_table :flowers do |t|
      t.string :flower_type, null: false

      t.timestamps
    end
  end
end
