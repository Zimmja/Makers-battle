require 'game'

describe Game do
  let(:player1) { double("player 1") }
  let(:player2) { double("player 2") }
  let(:game) { described_class.new(player1, player2) }
  let(:target) { double("target") }

  before(:each) { game.switch_turn }

  # describe "#attack" do
  #   it "calls the take_hit method on the target" do
  #     expect(target).to receive(:take_hit).with(10)
  #     game.attack(target, 10)
  #   end
  # end

  describe "#turn_attack" do
    it "whichever player's turn it is to receive an attack takes a hit" do
      check_hit(player2)
      game.switch_turn
      check_hit(player1)
    end

    def check_hit(player)
      expect(player).to receive(:take_hit).with(10)
      game.turn_attack(10)
    end
  end

  describe "#switch_turn" do
    it "switches current_player between the two players" do
      3.times do
        check_current_and_switch(player1)
        check_current_and_switch(player2)
      end
    end

    def check_current_and_switch(player)
      expect(game.current_player).to eq player
      game.switch_turn
    end
  end

end