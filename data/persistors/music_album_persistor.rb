require 'json'
require './src/classes/music_album/music_album'
require_relative './genre_persistor'

module MusicAlbumPersistor
  SOURCE = './data/DB/music_album.json'.freeze

  def self.read_from_file
    return [] unless File.exist?(SOURCE)

    deserialized_music_albums = JSON.parse(File.read(SOURCE))
    deserialized_music_albums.map { |music_album| json_to_music_album(music_album) }
  end

  def self.json_to_music_album(json)
    # music_album = MusicAlbum.new(on_spotify, date, genre, author, label)

    new_music_album = MusicAlbum.new(json['on_spotify'], json['publish_date'], 'genre', json['author'],
                                     json['label'])
    new_music_album.id = json['id']
    new_music_album.genre = GenrePersistor.json_to_genre(json['genre'])
    new_music_album.archived = json['archived']
    new_music_album
  end

  def self.write_to_file(music_albums)
    serialized_music_albums = music_albums.map { |music_album| music_album_to_json(music_album) }
    File.write(SOURCE, JSON.pretty_generate(serialized_music_albums))
  end

  def self.music_album_to_json(music_album_item)
    {
      id: music_album_item.id,
      genre: GenrePersistor.genre_to_json(music_album_item.genre),
      author: music_album_item.author,
      label: music_album_item.label,
      publish_date: music_album_item.publish_date,
      archived: music_album_item.archived,
      on_spotify: music_album_item.on_spotify
    }
  end
end
