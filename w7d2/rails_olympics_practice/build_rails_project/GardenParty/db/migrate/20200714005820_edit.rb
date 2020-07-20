class Edit < ActiveRecord::Migration[5.2]
  def change
    add_column :flowers, :gardener_id, :integer, null: false
  end
end
