require_relative '../item/item.rb'
require 'date'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, date)
    super(date)
    @publisher = publisher
    @cover_state = cover_state
    
  end

  def can_be_archived?
    (Date.today - @publish_date) > 3652 or @cover_state == 'bad'
  end
end

oobjt = Book.new('Penguin', 'good', 'fiction', 'J. K. Rowling', 'Harry Potter and the Philosopher\'s Stone', '1997-06-26') 
puts oobjt.inspect
puts oobjt.can_be_archived?