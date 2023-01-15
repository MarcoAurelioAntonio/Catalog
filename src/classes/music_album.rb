require_relative './item'
require_relative './label'
require_relative './author'
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

  def self.add_music_album
    puts 'ADD A NEW MUSIC ALBUM'
    print 'Enter genre: '
    genre = Genre.new(gets.chomp.to_s)
    puts 'Enter author'
    author = Author.input_author
    puts 'Enter label'
    label = Label.input_label
    print 'Enter publish date (YYYY-MM-DD):'
    date = gets.chomp.to_s
    print 'Is on spotify? (y/n):'
    on_spotify = gets.chomp
    on_spotify = on_spotify == 'y'
    music_album = MusicAlbum.new(on_spotify, date, genre, author, label)
    music_album.move_to_archive
    author.add_item(music_album)
    label.add_item(music_album)
    genre.add_item(music_album)
    puts 'Music album added'
    music_album
  end
end
