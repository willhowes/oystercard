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
  end

  def top_up(amount)
    raise("Maximum limit of #{MAXIMUM_BALANCE} exceded") if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
    puts "Topped up £#{amount}. New balance: £#{@balance}"
    return @balance
  end

  def touch_in
    raise("Insufficient funds") if @balance < MINUMUM_BALANCE
  end

  def touch_out
    deduct

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
