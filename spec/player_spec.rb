require 'player'

describe Player do
let(:name) { double('player_1_name') }
let(:player) { Player.new(:name) }

  #describe "#show_name" do
    it "displays the player's name" do
       expect(player.name).to eq :name
    end
  #end
end