require 'journey'

describe Journey do

  describe '#start' do
    it 'is in jounrey when journey starts' do
      expect{subject.start}.to change{subject.in_journey?}.from(false).to(true)
    end
  end

  describe '#finish' do
    it 'is not in journey when journey finished' do
      subject.start
      expect{subject.finish}.to change{subject.in_journey?}.from(true).to(false)
    end
  end
end
