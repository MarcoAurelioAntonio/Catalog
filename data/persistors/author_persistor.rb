require 'json'
require './src/classes/author/author'

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

  def self.author_to_json(auth)
    {
      'first_name' => auth,
      'last_name' => '...'
    }
  end

  def self.json_to_author(json)
    Author.new(json['first_name'], json['last_name'])
  end
end
