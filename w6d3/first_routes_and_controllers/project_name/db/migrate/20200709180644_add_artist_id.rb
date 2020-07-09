class AddArtistId < ActiveRecord::Migration[5.2]
  def change
    add_column :artworks, :artist_id, :integer, null: false
  end
end
