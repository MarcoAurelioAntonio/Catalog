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
end

oobjt = Book.new('publisher', 'good', '2019-01-01', 'genre', 'author', 'label')
puts oobjt.inspect
puts oobjt.can_be_archived?
