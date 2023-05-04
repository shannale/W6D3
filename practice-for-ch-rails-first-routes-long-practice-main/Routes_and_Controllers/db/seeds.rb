# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


ArtworkShare.destroy_all
Artwork.destroy_all
User.destroy_all

ApplicationRecord.connection.reset_pk_sequence!('users')
ApplicationRecord.connection.reset_pk_sequence!('artworks')
ApplicationRecord.connection.reset_pk_sequence!('artwork_shares')


user_1 = User.create({username: "Shannaollie"})
user_2 = User.create({username: "NJ"})
artwork_1 = Artwork.create({title: "Oliver", image_url: "meow.com", artist_id: user_1.id})
artwork_2 = Artwork.create({title: "Stella", image_url: "bork.com", artist_id: user_2.id})
artshare_1 = ArtworkShare.create!({artwork_id: artwork_1.idqq, viewer_id: user_2.id})
artshare_2 = ArtworkShare.create!({artwork_id: artwork_2.id, viewer_id: user_1.id})