require './src/classes/item/item'

class Genre
  def initialize(genre)
    @id = Random.rand(1000)
    @genre = genre
    @items = []
  end
end
