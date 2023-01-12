require 'date'

class Item
  attr_accessor :genre, :author, :label, :publish_date

  def initialize(date, genre, author, label)
    @id = Random.rand(1000)
    @genre = genre
    @author = author
    @label = label
    @publish_date = Date.parse(date)
    @archved = false
  end

  def can_be_archived?
    (Date.today - @publish_date) > 3652
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private :can_be_archived?
end
