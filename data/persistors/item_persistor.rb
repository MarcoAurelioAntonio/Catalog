require 'json'
require_relative './music_album_persistor'
require './src/classes/genre'
require './src/app'

module ItemPersistor
  SOURCE = './data/DB/genres.json'.freeze

  def self.deserialize_items(genres, music_albums)
    genres_array = JSON.parse(File.read(SOURCE))
    genres.each do |genre|
      temp_genre = genres_array
        .find { |genres_obj| genres_obj['id'] == genre.id }
      temp_genre['items'].each do |item|
        temp_music_album = music_albums.find { |music_album| music_album.id == item['item_id'] }
        genre.add_item(temp_music_album)
      end
    end
  end

  def self.ruby_to_json(item)
    {
      item_id: item.id,
      item_class: item.class
    }
  end
end
