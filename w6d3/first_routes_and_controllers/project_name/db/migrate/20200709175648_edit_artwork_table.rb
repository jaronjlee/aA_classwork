class EditArtworkTable < ActiveRecord::Migration[5.2]
  def change
    rename_column :artworks, :artsit_id, :artist_id
  end
  add_index :artworks, :artsit_id
end
