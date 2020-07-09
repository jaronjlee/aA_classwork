# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

user_1 = User.create(username: "Bob")
user_2 = User.create(username: "Larry")
user_3 = User.create(username: "Joe")
user_4 = User.create(username: "Hank")

artwork_1 = Artwork.create(title: "Mona Lisa", image_url: "google.com", artist_id: user_1.id)
artwork_2 = Artwork.create(title: "The Last Supper", image_url: "firefox.com", artist_id: user_2.id)
artwork_3 = Artwork.create(title: "idk", image_url: "internetexplorer.com", artist_id: user_3.id)

ArtworkShare.create(artwork_id: artwork_1.id, viewer_id: user_2.id)
ArtworkShare.create(artwork_id: artwork_2.id, viewer_id: user_3.id)
ArtworkShare.create(artwork_id: artwork_3.id, viewer_id: user_1.id)


#[{"id":34,"username":"Bob"},{"id":35,"username":"Larry"},{"id":36,"username":"Joe"},{"id":37,"username":"Hank"}]
#{"id":13,"title":"Mona Lisa","image_url":"google.com","artist_id":34}