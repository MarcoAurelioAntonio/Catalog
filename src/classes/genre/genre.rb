class Genre
  attr_accessor :items
  attr_reader :genre, :id

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
