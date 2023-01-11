require './src/classes/item/item'

class Genre
  def initialize(genre)
    @id = Random.rand(1000)
    @genre = genre
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.genre = self
  end
end
