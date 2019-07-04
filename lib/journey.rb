require 'oystercard'

class Journey

attr_reader :entry_station
attr_reader :exit_station

  def initialize
    @in_journey = false
    @entry_station
    @exit_station
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
end
