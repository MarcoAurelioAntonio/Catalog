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

  def self.validate_genre(genre, genres, item)
    if genres.select { |genre_item| genre_item.genre == genre }.empty?
      new_genre = Genre.new(genre)
      new_genre.add_item(item)
      genres << new_genre
    else
      genres.find { |genre_item| genre_item.genre == genre }.add_item(item)
    end
  end
end
