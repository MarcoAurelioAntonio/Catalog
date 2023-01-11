require './src/classes/item/item'

class MusicAlbum < Item
  def initialize(genre, author, label, date, on_spotify)
    super(genre, author, label, date)
    @on_spotify = on_spotify
  end
end
