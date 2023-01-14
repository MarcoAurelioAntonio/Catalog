require_relative './item'
require_relative './author'
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

  def self.add_game(games, authors)
    puts 'Add a New Game'
    puts 'Enter Genre: '
    genre = gets.chomp.to_s
    puts 'Enter Label: '
    label = gets.chomp.to_s
    puts 'Does it include multiplayer?.(true/false)'
    multiplayer = gets.chomp.to_s
    puts 'Enter Game Author: '
    author = Author.input_author
    puts 'Enter Release Date (yyyy-mm-dd): '
    publish_date = gets.chomp.to_s
    puts 'Enter Last Played Date (yyyy-mm-dd): '
    last_played_at = gets.chomp.to_s
    game = Game.new(last_played_at, multiplayer, publish_date, genre, author, label)
    author.add_item(game)
    puts game.author.id
    authors << author
    game.move_to_archive
    games << game
    puts 'Game Successfully Added'
  end
end
