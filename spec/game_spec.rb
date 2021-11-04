require 'game'

describe Game do
  let(:player1) { double("player 1") }
  let(:player2) { double("player 2") }
  let(:game) { described_class.new(player1, player2) }
  let(:target) { double("target") }

  describe "#turn_attack" do
    it "calls attack on whichever player's turn it is to receive a hit" do
      expect(player2).to receive(:take_hit).with(10)
      game.turn_attack(10)
      expect(player1).to receive(:take_hit).with(10)
      game.turn_attack(10)
    end
  end

  describe "#attack" do
    it "calls the take_hit method on the target" do
      expect(target).to receive(:take_hit).with(10)
      game.attack(target, 10)
    end
  end

  describe "#switch_turn" do
    it "switches @turn back-and-forth between 1 and 2" do
      expect(game.turn).to eq 1
      game.switch_turn
      expect(game.turn).to eq 2
      game.switch_turn
      expect(game.turn).to eq 1
    end
  end

  describe "#current_player" do
    it 'returns the player who has the next turn' do
      expect(game.current_player).to eq player1
      game.switch_turn
      expect(game.current_player).to eq player2
    end
  end

end