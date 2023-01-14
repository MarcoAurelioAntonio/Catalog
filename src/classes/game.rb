class Game
  def initialize(last_played_at, multiplayer: false)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived
    return true if can_be_archived && @last_played_at < (365 * 2)
  end
end