require_relative './game'
require 'json'

class ManageGame
  def self.add(gam, authors)
    puts 'Add a New Game'
    puts 'Enter Genre: '
    genre = gets.chomp.to_s
    puts 'Enter Label: '
    label = gets.chomp.to_s
    puts 'Does it include multiplayer?.(true/false)'
    multiplayer = gets.chomp.to_s
    puts 'Enter Game Author: '
    author = gets.chomp.to_s
    puts 'Enter Release Date (yyyy-mm-dd): '
    publish_date = gets.chomp.to_s
    puts 'Enter Last Played Date (yyyy-mm-dd): '
    last_played_at = gets.chomp.to_s
    game = Game.new(last_played_at, multiplayer, publish_date, genre, author, label)
    game.genre = genre
    game.label = label
    game.author = author
    game.move_to_archive
    gam << game
    authors.push(author)
    puts 'Game Successfully Added'
  end
end
