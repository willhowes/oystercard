require 'pry'

class Oystercard

  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90
  MINUMUM_BALANCE = 1
  MINUMUM_CHARGE = 1

  attr_reader :balance, :entry_station, :journeys, :exit_station

  def initialize
    @journeys = []
    @balance = DEFAULT_BALANCE
    @entry_station
    @exit_station
  end

  def top_up(amount)
    raise("Maximum limit of #{MAXIMUM_BALANCE} exceded") if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
    puts "Topped up £#{amount}. New balance: £#{@balance}"
    return @balance
  end

  def touch_in(entry_station)
    @balance < MINUMUM_BALANCE ? raise("Insufficient funds") : @entry_station = entry_station
  end

  def touch_out(exit_station)
    deduct
    @exit_station = exit_station
    @journeys << {:entry_station => @entry_station, :exit_station => @exit_station}
    @entry_station = nil
  end

  def in_journey?
    !!entry_station
  end

  private

  def deduct
    @balance -= MINUMUM_CHARGE
  end

end

# binding.pry
