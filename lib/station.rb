class Station
  attr_accessor :station_name, :zone, :station_info
  def initialize(station_name, zone)
    @station_info = {:name => station_name, :zone => zone}
  end
end