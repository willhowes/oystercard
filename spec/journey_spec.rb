require 'journey'

describe Journey do

  # let(:oystercard) { double :oystercard }
  let(:entry_station) { double :station}
  let(:exit_station) { double :station }
  let(:journeys) { double :journeys}
  oystercard = Oystercard.new

  describe '#start' do
    it 'is in journey when journey starts' do
      expect{subject.start(entry_station)}.to change{subject.in_journey?}.from(false).to(true)
    end
  end

  describe '#finish' do
    it 'is not in journey when journey finished' do
      subject.start(entry_station)
      expect{subject.finish(exit_station)}.to change{subject.in_journey?}.from(true).to(false)
    end
  end


end
