require 'pry'

class Oystercard

  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90

  attr_reader :balance

  def initialize
    @balance = DEFAULT_BALANCE
  end

  def top_up(amount)
    raise("Maximum limit of #{MAXIMUM_BALANCE} exceded") if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
    puts "Topped up £#{amount}. New balance: £#{@balance}"
    return @balance
  end

  private

  # def limit_exceded?
  #   @balance > 90
  # end

end

binding.pry
