require 'json'
require './src/classes/genre/genre'
require './data/persistors/item_persistor'

module GenrePersistor
  SOURCE = './data/DB/genres.json'.freeze

  def self.read_from_file
    return [] unless File.exist?(SOURCE)

    deserialized_genres = JSON.parse(File.read(SOURCE))
    deserialized_genres.map { |genre| json_to_ruby(genre) }
  end

  def self.json_to_ruby(json)
    new_genre = Genre.new(json['genre'])
    new_genre.id = json['id']
    new_genre
  end

  def self.write_to_file(genres)
    serialized_genres = genres.map { |genre| ruby_to_json(genre) }
    File.write(SOURCE, JSON.pretty_generate(serialized_genres))
  end

  def self.ruby_to_json(genre_item)
    {
      id: genre_item.id,
      genre: genre_item.genre,
      items: genre_item.items.map { |item| { item_id: item.id, item_class: item.class.to_s } }
    }
  end
end
