class Game
  def initialize(last_played_at)
    @multiplayer = false
    @last_played_at = last_played_at
  end

  def can_be_archived
    if can_be_archived && @last_played_at < (365 * 2)
      return true
    else
      return false
    end
  end
end
