require_relative './game'

class ManageGame
  def add_game(games, author)
    puts 'Add a New Game'
    puts 'Enter Genre: '
    genre = gets.chomp.to_s
    puts 'Enter Label: '
    label = gets.chomp.to_s
    puts 'Does it include multiplayer?.(y/n)'
    multiplayer = gets.chomp.to_s == y ? true : false
    puts 'Enter Game Author: '
    author = gets.chomp.to_s
    puts 'Enter Release Date (yyyy-mm-dd): '
    publish_date = gets.chomp.to_s
    puts 'Enter Last Played Date (yyyy-mm-dd): '
    last_played_at = gets.chomp.to_s
    game = Game.new(last_played_at, publish_date, multiplayer)
    game.genre = genre
    game.label = label
    game.author = author
    game.move_to_archive
    games << game
    puts 'Game Successfully Added'
  end
end
