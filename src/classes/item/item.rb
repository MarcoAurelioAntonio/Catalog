class Item
  def initialize(genre, author, label, date)
    @id = Random.rand(1000)
    @genre = genre
    @author = author
    @label = label
    @publish_date = date
    @archved = false
  end
end
