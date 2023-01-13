require_relative './game'

class ManageGame
  def add(gam, authors)
    puts 'Add a New Game'
    puts 'Enter Genre: '
    genre = gets.chomp.to_s
    puts 'Enter Label: '
    label = gets.chomp.to_s
    puts 'Does it include multiplayer?.(y/n)'
    multiplayer = gets.chomp.to_s == y
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
    gam << game
    save_game(game)
    puts 'Game Successfully Added'
  end

  def save_game
    File.open('game.json', 'w') do |file|
      game1 = { class: game.class, genre: game.genre, label: game.label, multiplayer: game.multiplayer,
                author: game.author, publish_date: game.publish_date, last_played_at: game.last_played_at }
      file.write(JSON.generate(game1))
    end
  end
end
