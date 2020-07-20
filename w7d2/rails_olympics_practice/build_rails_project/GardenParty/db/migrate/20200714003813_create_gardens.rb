class CreateGardens < ActiveRecord::Migration[5.2]
  def change
    create_table :gardens do |t|
      t.string :name, unique: true, null: false
      t.integer :size

      t.timestamps
    end
  end
end
