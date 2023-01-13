require_relative './music_album'
require_relative '../genre/genre'

class ManageMusicAlbum
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
    on_spotify = gets.chomp.to_s
    # on_spotify = on_spotify == 'y'
    music_album = MusicAlbum.new(on_spotify, date, genre, author, label)
    validate_genre(genre, genres, music_album)
    music_album.move_to_archive
    music_albums << music_album
    puts 'Music album added'
  end

  def self.validate_genre(genre, genres, item)
    if genres.select { |genre_item| genre_item.genre == genre }.empty?
      new_genre = Genre.new(genre)
      new_genre.add_item(item)
      genres << new_genre
    else
      genres.select { |genre_item| genre_item.genre == genre }[0].add_item(item)
    end
  end
end
