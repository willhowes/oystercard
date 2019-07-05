require 'pry'
require 'journey'

class Oystercard

  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_CHARGE = 1
  PENALTY_FARE = 6

  attr_reader :balance, :journeys

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
    raise("Insufficient funds") if @balance < MINIMUM_BALANCE
    if @journey
      deduct_penalty_fare
      puts "Did not touch out previously. Penalty fare deducted. New balance: #{balance}"
    end
    @journey = Journey.new
    @journey.start(@journey.entry_station)
  end

  def touch_out
    if !@journey
      deduct_penalty_fare
      puts "Did not touch in. Penalty fare deducted. New balance: #{balance}"
    else
      @journey.finish(@journey.exit_station)
      @journeys << {entry_station: @journey.entry_station, exit_station: @journey.exit_station}
      deduct_minimum_fare
      @journey = nil
      puts "Journey complete. New balance #{balance}"
    end
  end

  def journey
    @journey
  end

  private

  def deduct_penalty_fare
    @balance -= Oystercard::PENALTY_FARE
  end

  def deduct_minimum_fare
    @balance -= Oystercard::MINIMUM_CHARGE
  end
end

binding.pry
