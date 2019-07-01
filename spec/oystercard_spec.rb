require 'oystercard'

describe Oystercard do

  it "has an initial balance of £0" do
    expect(subject.balance).to eq Oystercard::DEFAULT_BALANCE
  end

  describe '#top_up' do
    it "Tops up the balance by a specified amount" do
      expect(subject.top_up(5)).to eq 5
    end

    it "Tops up the balance by a specified amount" do
      expect(subject.top_up(10)).to eq 10 
    end
  end

end
