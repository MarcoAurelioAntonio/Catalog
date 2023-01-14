require 'json'
require './src/classes/game/game'
require_relative './author_persistor'

module GamePersistor
  SOURCE = './data/DB/game.json'.freeze

  def self.read_from_file
    return [] unless File.exist?(SOURCE)

    deserialized_music_albums = JSON.parse(File.read(SOURCE))
    deserialized_music_albums.map { |game| json_to_ruby(game) }
  end

  def self.json_to_ruby(json)
    new_game = Game.new(json['genre'], json['date'], json['author'], json['multiplayer'],
                                     json['label'])
    new_game.archived = json['archived']
    new_game
  end

  def self.write_to_file(games)
    serialized_games = games.map { |game| ruby_to_json(game) }
    File.write(SOURCE, JSON.pretty_generate(serialized_games))
  end

  def self.ruby_to_json(game)
    {
      author: game.author
      genre: game.genre,
      label: game.label,
      publish_date: game.publish_date,
      multiplayer: game.multiplayer,
      archived: game.archived,
      last_played_at: game.last_played_at
    }
  end
end
