require 'json'
require_relative './music_album_persistor'
require './src/classes/genre'
require './src/app'

module ItemPersistor
  SOURCE_GENRES = './data/DB/genres.json'.freeze
  SOURCE_LABELS = './data/DB/labels.json'.freeze
  SOURCE_AUTHORS = './data/DB/authors.json'.freeze

  # Item component: Referst to label, author, or genre

  def self.read_from_file(genres, music_albums, books, games)
    source_file = select_source(genres)
    return [] unless File.exist?(source_file)

    genres_array = JSON.parse(File.read(source_file))
    genres.each do |genre|
      temp_genre = genres_array
        .find { |genres_obj| genres_obj['id'] == genre.id }
      find_item(genre, temp_genre, music_albums, books, games)
    end
  end

  def self.select_source(genres)
    case genres.first.class.to_s
    when 'Genre'
      SOURCE_GENRES
    when 'Label'
      SOURCE_LABELS
    else
      SOURCE_AUTHORS
    end
  end

  def self.find_item(genre, temp_genre, music_albums, books, games)
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
