require_relative '../item/item'

class Game < Item
  attr_accessor :last_played_at, :multiplayer
  def initialize(last_played_at, date, multiplayer: false)
    super(date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived
    return true if can_be_archived && @last_played_at < (365 * 2)
  end
end
