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
    @journey = Journey.new
    @journey.start(@journey.entry_station)
    deduct_fare
    puts "Penalty fare of £6 deducted. You will be refunded on touch out"
  end

  def touch_out
    @journey.finish(@journey.exit_station)
    @journeys << {entry_station: @journey.entry_station, exit_station: @journey.exit_station}
    deduct_fare
    puts "Journey complete. Minimum fare of £1 deducted. Penalty fare refunded. New balance #{balance}"
  end

  def journey
    @journey
  end

  private

  def deduct_fare
    if !@journey.complete?
      @balance -= Oystercard::PENALTY_FARE
    elsif @journey.complete?
      @balance += Oystercard::PENALTY_FARE
      @balance -= Oystercard::MINIMUM_CHARGE
    end
  end
end

binding.pry
