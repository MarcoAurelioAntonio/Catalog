require_relative '../item/item'
require_relative '../book/label'
require 'date'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, *args)
    super(*args)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    (Date.today - @publish_date) > 3652 or @cover_state == 'bad'
  end

  def self.add_book(books, labels)
    # puts 'ADD A NEW BOOK'
    print 'Enter publisher: '
    publisher = gets.chomp.to_s
    print 'Enter cover state (good/bad):'
    cover_state = gets.chomp.to_s
    print 'Enter publish date (YYYY-MM-DD):'
    date = gets.chomp.to_s
    print 'Enter genre:'
    genre = gets.chomp.to_s
    print 'Enter author:'
    author = gets.chomp.to_s
    print 'Enter label:'
    label = gets.chomp.to_s
    book = Book.new(publisher, cover_state, date, genre, author, label)
    book.author = author
    book.label = label
    book.genre = genre
    book.publish_date = date
    validate_label(labels, book)
    books << book
    puts 'Book added'
  end

  def self.validate_label(labels, book)
    print 'Enter label title:'
    title = gets.chomp.to_s
    print 'Enter label color:'
    color = gets.chomp.to_s
    if labels.select { |book_label| book_label.title == title && book_label.color == color }.empty?
      new_label = Label.new(title, color)
      new_label.add_item(book)
      labels << new_label
    else
      labels.select { |book_label| book_label.title == title && book_label.color == color }[0].add_item(book)
    end
  end
end

# oobjt = Book.new('publisher', 'good', '2019-01-01', 'genre', 'author', 'label')
# puts oobjt.inspect
# puts oobjt.can_be_archived?
