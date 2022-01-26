require 'station'

describe Station do
  let(:station) {Station.new}

  it "has an station name property upon instantiation" do
    stat = Station.new("city", "1")
    expect(stat.station_info[:name]).to eq("city")
  end

  it "has a zone property upon instantiation" do
    stat = Station.new("city", "1")
    expect(stat.station_info[:zone]).to eq("1")
  end
end