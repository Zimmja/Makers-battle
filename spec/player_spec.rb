require 'player'

describe Player do
  let(:name) { double('player_1_name') }
  let(:player) { Player.new(:name, 100) }

  it "can display the player's name" do
    expect(player.name).to eq :name
  end

  it "can display the player's HP" do
    expect(player.hp).to eq 100
  end

  describe '#take_hit' do
    it "reduces the player's HP by 10" do
      expect { player.take_hit(10) }.to change { player.hp }.by(-10)
    end
  end
end