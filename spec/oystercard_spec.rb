require 'oystercard'

describe Oystercard do

  let(:station) { double :station}

  describe '#top_up' do

    it 'raises an error if maximum limit (£90) is reached' do
      subject.top_up Oystercard::MAXIMUM_BALANCE
      expect{ subject.top_up 1 }.to raise_error("Maximum limit of #{Oystercard::MAXIMUM_BALANCE} exceded")
    end

    it 'allows you to top up to the maxumum limit' do
      expect(subject.top_up Oystercard::MAXIMUM_BALANCE).to eq subject.balance
    end
  end

  describe '#touch_in' do
    it "Commences a journey" do
      subject.top_up 1
      subject.touch_in(station)
      expect(subject.entry_station).to eq station
    end

    it 'raises an error if there are insufficient funds' do
      expect{ subject.touch_in(station) }.to raise_error("Insufficient funds")
    end

    it 'Sets station at touch_in' do
      subject.top_up(1)
      subject.touch_in(station)
      expect(subject.entry_station).to eq station
    end

  end

  describe '#touch_out' do
    it "Ends a journey" do
      subject.top_up 5
      subject.touch_in(station)
      subject.touch_out
      expect(subject.entry_station).to eq nil
    end

    it 'deducts the fare from the balance (£1) after a journey' do
      subject.top_up 5
      subject.touch_in(station)
      expect{ subject.touch_out }.to change{ subject.balance }.by (-Oystercard::MINUMUM_CHARGE)
    end

    it 'Sets entry_station to nil on touch_out' do
      subject.top_up 1
      subject.touch_in(station)
      subject.touch_out
      expect(subject.entry_station).to eq nil
    end
  end

  describe '#in_journey?' do
    it "Checks if in_journey" do
      subject.top_up 1
      subject.touch_in(station)
      expect(subject.in_journey?).to eq true
    end

  end

end
