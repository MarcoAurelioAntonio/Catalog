class Game
  def initialize(last_played_at)
    @multiplayer = false
    @last_played_at = Date.parse(last_played_at)
  end
end
