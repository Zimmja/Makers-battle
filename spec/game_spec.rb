require 'game'

describe Game do
  let(:player1) { double("player 1") }
  let(:player2) { double("player 2") }
  let(:game) { described_class.new(player1, player2) }
  let(:target) { double("target") }

  describe "#attack" do
    it "calls the take_hit method on the target" do
      expect(target).to receive(:take_hit).with(10)
      game.attack(target, 10)
    end
  end

end