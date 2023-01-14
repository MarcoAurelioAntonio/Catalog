require 'json'
require_relative './music_album_persistor'
require './src/classes/genre'
require './src/app'

module ItemPersistor
  SOURCE = './data/DB/genres.json'.freeze
  # Item components: label, author, genre

  def self.deserialize_items_all(genres, music_albums, books, games)
    genres_array = JSON.parse(File.read(SOURCE))
    genres.each do |genre|
      temp_genre = genres_array
        .find { |genres_obj| genres_obj['id'] == genre.id }
      deserialize_item(genre, temp_genre, music_albums, books, games)
    end
  end

  def self.deserialize_item(genre, temp_genre, music_albums, books, games)
    temp_genre['items'].each do |item|
      temp_item = case item['item_class']
                  when 'MusicAlbum'
                    music_albums.find { |music_album| music_album.id == item['item_id'] }
                  when 'Book'
                    books.find { |book| book.id == item['item_id'] }
                  else
                    games.find { |game| game.id == item['item_id'] }
                  end
      genre.add_item(temp_item)
    end
  end

  def self.ruby_to_json(item)
    {
      item_id: item.id,
      item_class: item.class
    }
  end
end
