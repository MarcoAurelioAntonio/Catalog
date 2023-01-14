require 'json'
require_relative './music_album_persistor'
# require persistors for other classes

module ItemPersistor
  def self.json_to_ruby(genres, music_albums)
    genres.map do |genre|
      genre.items = genre.items.map do |item|
        music_albums.find { |music_album| music_album.id == item.item_id } if item.item_class == 'MusicAlbum'
        # add other classes
      end
    end
  end
end
