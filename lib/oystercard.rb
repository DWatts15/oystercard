# Makers Week 4 challenge: Oyster Card
class Oystercard
  attr_reader :balance, :in_journey, :MIN_FARE

  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_FARE = 1
  
  def initialize(balance = 0)
    @balance = balance
    @in_journey = false
  end

  def top_up(amount)
    fail "Max balance exceeded" unless @balance + amount <= MAX_BALANCE
    @balance += amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    fail "insufficient balance" if balance < MIN_BALANCE
    @in_journey = true 
  end

  def touch_out
    deduct(MIN_FARE)
    @in_journey = false
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
