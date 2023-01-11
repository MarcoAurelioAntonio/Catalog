require './src/classes/music_albums/music_album'

class ManageMusicAlbum
  def self.add_music_album(music_albums)
    puts 'Add music genre'
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
    on_spotify = on_spotify == 'y'

    music_album = MusicAlbum.new(genre, author, label, date, on_spotify)
    music_album.move_to_archive
    music_albums << music_album

    puts 'Music album added'
    puts music_album.inspect
  end
end
