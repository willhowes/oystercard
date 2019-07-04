require 'oystercard'

class Journey

attr_reader :entry_station
attr_reader :exit_station

  def initialize
    @in_journey = false
    @entry_station = nil
    @exit_station = nil
  end

  def start(entry_station)
    @entry_station = entry_station
    @in_journey = true
  end



  def finish(exit_station)
    @exit_station = exit_station
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

  def fare
    Oystercard::PENALTY_FARE if double_touch_in
    entry_station.nil? ? Oystercard::PENALTY_FARE : Oystercard::MINUMUM_CHARGE
  end
end
