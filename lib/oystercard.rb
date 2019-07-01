require 'pry'

class Oystercard

  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90

  attr_reader :balance, :in_journey

  def initialize
    @balance = DEFAULT_BALANCE
    @in_journey = false
  end

  def top_up(amount)
    raise("Maximum limit of #{MAXIMUM_BALANCE} exceded") if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
    puts "Topped up £#{amount}. New balance: £#{@balance}"
    return @balance
  end

  def deduct(amount)
    @balance -= amount
    puts "Spent £#{amount}. New balance: £#{@balance}"
    return @balance
  end

  def touch_in
    @in_journey = true
  end

  private

  # def in_journey
  #   @in_journey = true
  # end

  # def limit_exceded?
  #   @balance > 90
  # end

end

binding.pry
