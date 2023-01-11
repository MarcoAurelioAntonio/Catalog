require './src/classes/music_albums/manage_music_album'

class App
  def initialize
    @books = []
    @music_albums = []
    @games = []
    @genres = []
    @labels = []
    @authors = []
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
  end

  def run
    @menu_options.each_with_index do |option, index|
      puts "#{index + 1} - #{option[1].name.to_s.split('_').join(' ').capitalize}"
    end
    puts '0 - Exit'

    option = gets.chomp.to_s
    if @menu_options.key?(option)
      @menu_options[option].call
      run
    elsif option == '0'
      puts 'Thank you for using this app!'
    else
      puts 'That is not a valid option'
      run
    end
  end

  def list_all_books
    puts 'list all books'
  end

  def list_all_music_albums
    puts 'list all music albums'
  end

  def list_all_games
    puts 'list all games'
  end

  def list_all_genres
    puts 'list all genres'
  end

  def list_all_labels
    puts 'list all labels'
  end

  def list_all_authors
    puts 'list all authors'
  end

  def add_book
    puts 'add book'
  end

  def add_music_album
    ManageMusicAlbum.add_music_album(@music_albums, @genres)
  end

  def add_game
    puts 'add game'
  end
end
