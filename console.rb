require 'pry-byebug'
require_relative 'models/album'
require_relative 'models/artist'

Artist.delete_all()
Album.delete_all()

artist1 = Artist.new({ 'name' => 'Oasis'})
artist2 = Artist.new({ 'name' => 'Weezer'})
artist1.save()
artist2.save()

album1 = Album.new({ 'title' => 'Be Here Now', 'genre' => 'Rock', 'artist_id' => artist1.id })
album2 = Album.new({ 'title' => 'Weezer (Blue Album)', 'genre' => 'Surf Rock', 'artist_id' => artist2.id})

binding.pry
nil






