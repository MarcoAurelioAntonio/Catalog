require 'json'
require './src/classes/genre/genre'

module GenrePersistor
  SOURCE = './data/DB/genres.json'.freeze

  def self.read_from_file
    return [] unless File.exist?(SOURCE)

    deserialized_genres = JSON.parse(File.read(SOURCE))
    deserialized_genres.map { |genre| json_to_genre(genre) }
  end

  def self.json_to_genre(json)
    new_genre = Genre.new(json['genre'])
    new_genre.id = json['id']
    # Change this to add items (books, music albums, movies)
    new_genre.items = json['items']
    new_genre
  end

  def self.write_to_file(genres)
    serialized_genres = genres.map { |genre| genre_to_json(genre) }
    File.write(SOURCE, JSON.pretty_generate(serialized_genres))
  end

  def self.genre_to_json(genre_item)
    {
      id: genre_item.id,
      genre: genre_item.genre,
      # Change this to add serialized items using an appropriate method
      items: 'Pending implementation of items serialization'
    }
  end
end
