require_relative 'player'

class Game

  attr_reader :player_1, :player_2, :turn

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @turn = 0
  end

  def turn_attack(damage)
    attack(current_target, damage)
  end

  def switch_turn
    @turn = (@turn == 1 ? 2 : 1)
  end

  def current_player
    @turn == 1 ? @player_1 : @player_2
  end

  def current_target
    @turn == 1 ? @player_2 : @player_1
  end

  private

  def attack(target, damage)
    target.take_hit(damage)
  end
  
end