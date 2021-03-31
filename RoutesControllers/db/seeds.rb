# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


    User.create(username: 'Alex')
    User.create(username: 'Phil')
    User.create(username: 'Picasso')


    Artwork.create(title: 'Mona Lisa', image_url: 100, artist_id: User.find(1).id)
    Artwork.create(title: 'Starry Night', image_url: 101, artist_id: User.find(2).id)
    Artwork.create(title: 'Guernica', image_url: 102, artist_id: User.find(3).id)

    ArtworkShare.create(artwork_id: Artwork.find(1).id, viewer_id: User.find(2).id)
    ArtworkShare.create(artwork_id: Artwork.find(2).id, viewer_id: User.find(3).id)
    ArtworkShare.create(artwork_id: Artwork.find(3).id, viewer_id: User.find(1).id)
    ArtworkShare.create(artwork_id: Artwork.find(2).id, viewer_id: User.find(1).id)