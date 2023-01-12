class Game
  def initialize(multiplayer = false, last_played_at)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived
    return true if can_be_archived && @last_played_at < (365 * 2)
  end
end
