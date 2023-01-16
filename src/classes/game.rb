require_relative './item'
require_relative './label'
require_relative './author'
require_relative './genre'

require 'json'

class Game < Item
  attr_accessor :last_played_at, :multiplayer

  def initialize(last_played_at, multiplayer, *args)
    super(*args)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived
    return true if date > 3_652 && @last_played_at < (365 * 2)
  end

  def self.add_game
    puts 'Add a New Game'
    print 'Enter Genre: '
    genre = Genre.new(gets.chomp.to_s)
    puts 'Enter Label '
    label = Label.input_label
    puts 'Does it include multiplayer?.(true/false)'
    multiplayer = gets.chomp.to_s
    puts 'Enter Game Author: '
    author = Author.input_author
    puts 'Enter Release Date (yyyy-mm-dd): '
    publish_date = gets.chomp.to_s
    puts 'Enter Last Played Date (yyyy-mm-dd): '
    last_played_at = gets.chomp.to_s
    game = Game.new(last_played_at, multiplayer, publish_date, genre, author, label)
    game.move_to_archive
    genre.add_item(game)
    label.add_item(game)
    author.add_item(game)
    puts 'Game Successfully Added'
    game
  end
end
