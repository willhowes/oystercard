require 'pry'

class Oystercard

  DEFAULT_BALANCE = 0

  attr_reader :balance

  def initialize
    @balance = DEFAULT_BALANCE
  end

  def top_up(amount)
    amount += @balance
  end
end

# binding.pry
