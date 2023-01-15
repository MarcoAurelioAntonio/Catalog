class Genre
  attr_accessor :items, :id, :genre

  def initialize(genre)
    @id = Random.rand(1000)
    @genre = genre
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end
