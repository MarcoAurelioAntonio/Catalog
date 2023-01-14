require './data/persistors/genre_persistor'
require './data/persistors/music_album_persistor'
require './data/persistors/book_persistor'
require './data/persistors/label_persistor'
require './data/persistors/item_persistor'
require './data/persistors/author_persistor'
require './data/persistors/game_persistor'

require './src/classes/book'
require './src/classes/music_album'
require './src/classes/game'

class App
  def initialize
    @genres = GenrePersistor.read_from_file
    @labels = LabelPersistor.read_from_file
    @authors = AuthorPersistor.read_from_file
    @music_albums = MusicAlbumPersistor.read_from_file(@genres)
    @books = BookPersistor.read_from_file(@labels, @authors, @genres)
    @games = GamePersistor.read_from_file(@authors)
    @menu_options = {
      '1' => method(:list_all_books),
      '2' => method(:list_all_music_albums),
      '3' => method(:list_all_games),
      '4' => method(:list_all_genres),
      '5' => method(:list_all_labels),
      '6' => method(:list_all_authors),
      '7' => method(:add_book),
      '8' => method(:add_music_album),
      '9' => method(:add_game)
    }
    ItemPersistor.read_from_file(@genres, @music_albums, @books, @games)
    ItemPersistor.read_from_file(@authors, @music_albums, @books, @games)
    # Add ItemPersistor.read_from_file for @labels and @authors
  end

  def run
    @menu_options.each_with_index do |option, index|
      puts "#{index + 1} - #{option[1].name.to_s.split('_').join(' ').capitalize}"
    end
    puts '0 - Exit'

    option = gets.chomp.to_s
    if @menu_options.key?(option)
      puts ''
      @menu_options[option].call
      puts ''
      run
    elsif option == '0'
      save_data
      puts "\nThank you for using this app!\n\n"
    else
      puts "\nThat is not a valid option\n\n"
      run
    end
  end

  def list_all_books
    @books.each_with_index do |book, index|
      puts "(#{index + 1}) - #{book.genre} - #{book.author} - #{book.label}"
    end
  end

  def list_all_music_albums
    @music_albums.each_with_index do |music_album, index|
      puts "(#{index + 1}) - #{music_album.genre.genre} - #{music_album.author} - #{music_album.label}"
    end
  end

  def list_all_games
    @games.each_with_index do |game, index|
      puts "[#{index}]  #{game.label}  #{game.genre}  #{game.publish_date}  #{game.multiplayer}"
    end
  end

  def list_all_genres
    @genres.each_with_index do |genre, index|
      puts "(#{index + 1}) - #{genre.genre}"
    end
    puts @genres.inspect
  end

  def list_all_labels
    @labels.each_with_index do |label, index|
      puts "(#{index + 1}) - #{label}"
    end
  end

  def list_all_authors
    puts 'list all authors'
  end

  def add_book
    book = Book.add_book
    @books << book
    @labels << book.label
    @genres << book.genre
    @authors << book.author
  end

  def add_music_album
    MusicAlbum.add_music_album(@music_albums, @genres)
  end

  def add_game
    # game = Game.add_game
    # @games << game
    # @authors << game.author
    # @genres << game.genre
    # @labels << game.label
    Game.add_game(@games, @authors)
  end

  def save_data
    # Call other persistors
    MusicAlbumPersistor.write_to_file(@music_albums)
    GenrePersistor.write_to_file(@genres)
    BookPersistor.write_to_file(@books)
    LabelPersistor.write_to_file(@labels)
    GamePersistor.write_to_file(@games)
    AuthorPersistor.write_to_file(@authors)
  end
end
