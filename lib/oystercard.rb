# Makers Week 4 challenge: Oyster Card
class Oystercard
  attr_reader :balance, :MIN_FARE, :entry_station, :exit_station, :journey_list, :journey

  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_FARE = 1
  
  def initialize(balance = 0)
    @balance = balance
    @journey_list = []
    @journey = {}
  end

  def top_up(amount)
    fail "Max balance exceeded" unless @balance + amount <= MAX_BALANCE
    @balance += amount
  end

  def in_journey?
    !!entry_station
  end

  def touch_in(station)
    fail "insufficient balance" if balance < MIN_BALANCE
    @entry_station = station
    @journey[:entry_station] = station
  end

  def touch_out(station)
    deduct(MIN_FARE)
    @exit_station = station
    @entry_station = nil
    @journey[:exit_station] = station
    @journey_list.push(@journey)
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
