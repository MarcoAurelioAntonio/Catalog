require 'json'
require_relative './music_album_persistor'
require './src/classes/genre'
require './src/app'

module ItemPersistor
  def self.ruby_to_json(item)
    {
      item_id: item.id,
      item_class: item.class
    }
  end
end
