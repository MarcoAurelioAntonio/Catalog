require_relative './item'
require_relative './label'
require_relative './author'
require_relative './genre'
require 'date'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, *args)
    super(*args)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    (Date.today - Date.parse(@publish_date)) > 3652 or @cover_state == 'bad'
  end

  def self.add_book
    print 'Enter publisher: '
    publisher = gets.chomp.to_s
    print 'Enter cover state (good/bad):'
    cover_state = gets.chomp.to_s
    print 'Enter publish date (YYYY-MM-DD):'
    date = gets.chomp.to_s
    print 'Enter genre:'
    genre = Genre.new(gets.chomp.to_s)
    puts 'Enter author:'
    author = Author.input_author
    puts 'Enter label:'
    label = Label.input_label
    book = Book.new(publisher, cover_state, date, genre, author, label)
    book.publish_date = date
    book.move_to_archive
    author.add_item(book)
    label.add_item(book)
    genre.add_item(book)
    puts 'Book added'
    book
  end
end
