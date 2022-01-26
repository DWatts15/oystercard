class JourneyList
  attr_accessor :journey_list, :journey
  def initialize
    @journey_list = []
    @journey = {}
  end

  def completed_journey
    @journey_list.push(@journey)
  end
end