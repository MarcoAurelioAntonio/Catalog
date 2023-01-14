require 'json'
require './genre_persistor'
require './music_album_persistor'
# require persistors for other classes

module ItemPersistor
  def self.deserialize_all_items(items)
    items.map { |item| json_to_ruby(item) }
  end

  def self.json_to_ruby(json)
    # Change this to deserialize items using an appropriate method
    if json['on_spotify']
      MusicAlbumPersistor.json_to_ruby(json)
    # Add cases for other classes
    # Use an attribute that is unique to each class
    elsif json['unique book attribute']
      puts 'Implement Book serialization'
    elsif json['unique game attribute']
      puts 'Implement Game serialization'
    else
      raise 'Invalid item type'
    end
  end

  def self.serialize_all_items(items)
    items.map { |item| ruby_to_json(item) }
  end

  def self.ruby_to_json(_json)
    # Change this to serialize items using an appropriate method
    case item
    when MusicAlbum
      MusicAlbumPersistor.ruby_to_json(item)
    # Add cases for other classes
    when Book
      puts 'Implement Book serialization'
    when Game
      puts 'Implement Game serialization'
    else
      raise 'Invalid item type'
    end
  end
end
