require 'journey_list'

describe JourneyList do
  let(:journey_list) {JourneyList.new}

  it "initializes with an empty journey list" do
    expect(journey_list.journey_list).to eq([])
  end

  it "initializes with an empty journey hash" do
    expect(journey_list.journey).to eq({})
  end
end