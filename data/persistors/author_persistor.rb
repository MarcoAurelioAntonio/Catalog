require 'json'
require './src/classes/author'
require './data/persistors/item_persistor'

module AuthorPersistor
  SOURCE = './data/DB/author.json'.freeze

  def self.read_from_file
    return [] unless File.exist?(SOURCE)

    deserialized_authors = JSON.parse(File.read(SOURCE))
    deserialized_authors.map { |author| json_to_author(author) }
  end

  def self.write_to_file(authors)
    serialized_authors = authors.map { |author| author_to_json(author) }
    File.write(SOURCE, JSON.pretty_generate(serialized_authors))
  end

  def self.author_to_json(author_item)
    {
      'id' => author_item.id,
      'first_name' => author_item.first_name,
      'last_name' => author_item.last_name,
      'items' => []
    }
  end

  def self.json_to_author(json)
    new_author = Author.new(json['first_name'], json['last_name'])
    new_author.id = json['id']
    new_author
  end
end
