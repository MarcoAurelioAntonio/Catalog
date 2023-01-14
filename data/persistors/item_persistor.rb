require 'json'
require_relative './music_album_persistor'
require './src/app'

module ItemPersistor
  SOURCE = './data/DB/genres.json'.freeze

  # def self.deserialize_items(genres, music_albums, games, books)
  #   return [] unless File.exist?(SOURCE)

  #   deserialized_genres = JSON.parse(File.read(SOURCE))
  #   genres.each do |genre|
  #     genre_file = genre ... implement this
  #   end
  # end

  # def self.json_to_ruby(items, music_albums, games, books)
  #   items.map do |item|
  #     case item['item_class']
  #     when 'MusicAlbum'
  #       music_albums.find { |music_album| music_album.id == item['item_id'] }
  #     when 'Game'
  #       games.find { |game| game.id == item['item_id'] }
  #     else
  #       books.find { |book| book.id == item['item_id'] }
  #     end
  #   end
  # end

  def self.ruby_to_json(item)
    {
      item_id: item.id,
      item_class: item.class
    }
  end
end
