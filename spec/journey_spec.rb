require 'oystercard'

describe Journey do

  # let(:oystercard) { double :oystercard }
  let(:entry_station) { double :station}
  let(:exit_station) { double :station }
  let(:journeys) { double :journeys}
  oystercard = Oystercard.new

  describe '#start' do
    it 'joruney is incomplete when journey starts' do
      subject.start(entry_station)
      expect(subject.complete?).to eq false
    end
  end

  describe '#finish' do
    it 'Journey is set to complete when journey finished' do
      subject.start(entry_station)
      expect{subject.finish(exit_station)}.to change{subject.complete?}.from(false).to(true)
    end
  end

  # describe '#fare' do
  #   it 'returns penalty fare by default' do
  #     subject.start(entry_station)
  #     expect(subject.fare).to eq Oystercard::PENALTY_FARE
  #   end
  #
  #   it 'returns penalty fare of 6 if no entry station on finish' do
  #     subject.finish(exit_station)
  #     expect(subject.fare).to eq Oystercard::PENALTY_FARE
  #   end
  #
  #   it "returns a refund of the difference between the penalty fare and" \
  #   "the minimum fare when journey complete" do
  #     subject.start(entry_station)
  #     subject.finish(exit_station)
  #     expect(subject.fare).to eq Oystercard::MINIMUM_CHARGE - (-Oystercard::PENALTY_FARE)
  #   end
  # end
end
