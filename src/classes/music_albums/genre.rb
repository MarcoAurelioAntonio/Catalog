class Genre
  attr_accessor :items

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
