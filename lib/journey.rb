require 'oystercard'

class Journey

  def initialize
    @in_journey = false
    @entry_station
    @exit_station
  end

  def start(entry_station, oystercard)
    @oystercard = oystercard
    @entry_station = entry_station
    @in_journey = true
  end

  def finish(exit_station, oystercard)
    @exit_station = exit_station
    oystercard.journeys << {entry_station: @entry_station, exit_station: @exit_station}
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end
end
