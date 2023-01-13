require './src/classes/item/item'

class MusicAlbum < Item
  attr_reader :on_spotify

  def initialize(on_spotify, *args)
    super(*args)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    (Date.today - @publish_date) > 3652 && @on_spotify
  end
end