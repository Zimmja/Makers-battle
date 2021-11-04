require 'game'

describe Game do
  let(:target) { double("target") }

  describe "#attack" do
    it "calls the take_hit method on the target" do
      expect(target).to receive(:take_hit).with(10)
      subject.attack(target, 10)
    end
  end
end