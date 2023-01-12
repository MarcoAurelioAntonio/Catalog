require './src/classes/item/item'

class MusicAlbum < Item
  attr_reader :on_spotify

  def initialize(date, on_spotify)
    super(date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    (Date.today - @publish_date) > 3652 && @on_spotify
  end
end
