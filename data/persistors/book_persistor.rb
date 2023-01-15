require 'json'
require './src/classes/book'

module BookPersistor
  SOURCE = './data/DB/books.json'.freeze

  def self.read_from_file(labels, authors, genres)
    return [] unless File.exist?(SOURCE)

    deserialized_books = JSON.parse(File.read(SOURCE))
    deserialized_books.map { |book| json_to_book(book, labels, authors, genres) }
  end

  def self.write_to_file(books)
    serialized_books = books.map { |book| book_to_json(book) }
    File.write(SOURCE, JSON.pretty_generate(serialized_books))
  end

  def self.book_to_json(book)
    {
      'id' => book.id,
      'publisher' => book.publisher,
      'cover_state' => book.cover_state,
      'publish_date' => book.publish_date,
      'genre_id' => book.genre.id,
      'author_id' => book.author.id,
      'label_id' => book.label.id,
      'archived' => book.archived
    }
  end

  def self.json_to_book(json, labels, authors, genres)
    new_book = Book.new(json['publisher'], json['cover_state'], json['publish_date'], json['genre'], json['author'],
                        'label')
    new_book.archived = json['archived']
    new_book.label = labels.find { |label| label.id == json['label_id'] }
    new_book.genre = genres.find { |genre| genre.id == json['genre_id'] }
    new_book.author = authors.find { |author| author.id == json['author_id'] }
    new_book
  end
end
