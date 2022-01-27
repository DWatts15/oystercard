require 'station'

describe Station do
  let(:station) {Station.new("city", "1")}

  it "has an station name property upon instantiation" do
    expect(station.station_info[:name]).to eq("city")
  end

  it "has a zone property upon instantiation" do
    expect(station.station_info[:zone]).to eq("1")
  end
end