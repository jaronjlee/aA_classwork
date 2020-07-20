class CreateCats < ActiveRecord::Migration[5.2]
  def change
    create_table :cats do |t|
      t.string :birth_date
      t.integer :age, null: false
      t.string :color, null: false
      t.string :name, null: false
      t.text :description

      t.timestamps
    end
  end
end
