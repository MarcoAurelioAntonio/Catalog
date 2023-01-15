require 'json'
require './src/classes/game'
require_relative './author_persistor'

module GamePersistor
  SOURCE = './data/DB/games.json'.freeze

  def self.read_from_file(labels, authors, genres)
    return [] unless File.exist?(SOURCE)

    deserialized_music_albums = JSON.parse(File.read(SOURCE))
    deserialized_music_albums.map { |game| json_to_ruby(game, labels, authors, genres) }
  end

  def self.json_to_ruby(json, labels, authors, genres)
    new_game = Game.new(json['last_played_at'], json['multiplayer'], json['publish_date'], json['genre'],
                        'author', json['label'])
    new_game.archived = json['archived']
    new_game.author = authors.find { |author| author.id == json['author_id'] }
    new_game.genre = genres.find { |genre| genre.id == json['genre_id'] }
    new_game.label = labels.find { |label| label.id == json['label_id'] }
    new_game
  end

  def self.write_to_file(games)
    serialized_games = games.map { |game| ruby_to_json(game) }
    File.write(SOURCE, JSON.pretty_generate(serialized_games))
  end

  def self.ruby_to_json(game)
    {
      'id' => game.id,
      'author_id' => game.author.id,
      'genre_id' => game.genre.id,
      'label_id' => game.label.id,
      'publish_date' => game.publish_date,
      'multiplayer' => game.multiplayer,
      'archived' => game.archived,
      'last_played_at' => game.last_played_at
    }
  end
end
