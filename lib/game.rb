require_relative 'player'

class Game

  def attack(target, damage)
    target.take_hit(damage)
  end

end