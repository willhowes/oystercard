require 'oystercard'

describe Oystercard do

  it "has an initial balance of £0" do
    expect(subject.balance).to eq Oystercard::DEFAULT_BALANCE
  end

  describe '#top_up' do
    it "Tops up the balance by a specified amount" do
      expect{ subject.top_up 5 }.to change{ subject.balance }.by 5
    end

    it "Tops up the balance by a specified amount" do
      expect{ subject.top_up 10 }.to change{ subject.balance }.by 10
    end

    it 'raises an error if maximum limit (£90) is reached' do
      subject.top_up Oystercard::MAXIMUM_BALANCE
      expect{ subject.top_up 1 }.to raise_error("Maximum limit of #{Oystercard::MAXIMUM_BALANCE} exceded")
    end

    it 'allows you to top up to the maxumum limit' do
      expect(subject.top_up Oystercard::MAXIMUM_BALANCE).to eq subject.balance
    end

  end

end
