require_relative './item'
require_relative './genre'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(on_spotify, *args)
    super(*args)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    (Date.today - @publish_date) > 3652 && @on_spotify
  end

  def self.add_music_album(music_albums, genres)
    puts 'ADD A NEW MUSIC ALBUM'
    print 'Enter genre: '
    genre = gets.chomp.to_s
    print 'Enter author:'
    author = gets.chomp.to_s
    print 'Enter label:'
    label = gets.chomp.to_s
    print 'Enter publish date (YYYY-MM-DD):'
    date = gets.chomp.to_s
    print 'Is on spotify? (y/n):'
    on_spotify = gets.chomp
    on_spotify = on_spotify == 'y'
    music_album = MusicAlbum.new(on_spotify, date, genre, author, label)
    Genre.validate_genre(genre, genres, music_album)
    music_album.move_to_archive
    music_albums << music_album
    puts 'Music album added'
  end
end
