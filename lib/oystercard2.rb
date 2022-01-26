# Makers Week 4 challenge: Oyster Card
require_relative './station.rb'
require_relative './journey_list.rb'

class Oystercard
  attr_reader :balance, :MIN_FARE, :entry_station, :exit_station

  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_FARE = 1
  
  def initialize(balance = 0)
    @balance = balance
    @journeys = JourneyList.new
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
    @journeys.journey[:entry_station] = station
  end

  def touch_out(station)
    deduct(MIN_FARE)
    @exit_station = station
    @entry_station = nil
    @journeys.journey[:exit_station] = station
    @journeys.completed_journey
  end

  def display_journeys
    all_journeys = @journeys.journey_list
    all_journeys.each { |i| puts i }
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end