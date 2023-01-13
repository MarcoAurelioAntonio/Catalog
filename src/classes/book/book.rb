require_relative '../item/item'
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

  def self.add_book
    puts 'ADD A NEW BOOK'
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
    puts book.inspect
    puts 'Book added'
  end

end








#oobjt = Book.new('publisher', 'good', '2019-01-01', 'genre', 'author', 'label')
#puts oobjt.inspect
#puts oobjt.can_be_archived?
