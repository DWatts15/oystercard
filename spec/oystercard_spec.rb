require 'oystercard'

describe Oystercard do

  let(:oystercard) {Oystercard.new}
  
  it {expect(oystercard).to respond_to(:balance)}

  it "checks that the default balance is 0" do
    expect(oystercard.balance).to eq(0)
  end
  
  it {expect(oystercard).to respond_to(:top_up)}

  it "checks that top_up will add a given amount to the balance" do
    oystercard.top_up(50)
    expect(oystercard.balance).to eq(50)
  end
  
  it "checks that top_up will sum given amounts to the balance" do
    oystercard.top_up(10)
    oystercard.top_up(10)
    expect(oystercard.balance).to eq(20)
  end

  it {expect(oystercard).to respond_to(:top_up)}

  it "fails if the top_up increases balance beyond the limit" do
    expect {oystercard.top_up(1999)}.to raise_error 'Max balance exceeded'
  end

  it "should deduct a fare from the card" do
    oystercard.top_up(50)
    oystercard.touch_out
    expect(oystercard.balance).to eq(49)
  end

  it "is initially not in journey" do
    expect(oystercard).not_to be_in_journey
  end

  it "can touch in" do
    oystercard.top_up(5)
    oystercard.touch_in
    expect(oystercard).to be_in_journey
  end

  it "can touch out" do
    oystercard.touch_out
    expect(oystercard).not_to be_in_journey
    expect { oystercard.touch_out }.to change { oystercard.balance }.by (-Oystercard::MIN_FARE)
  end

  it 'will not touch in if under minimum balance' do
    expect{ oystercard.touch_in }.to raise_error "insufficient balance"
  end

  # it 'deducts a minimum fare from card when used' do
  #   expect { oystercard.touch_out }.to change { oystercard.balance }.by (-Oystercard::MIN_FARE)
  # end

  # let(:station){ double :station }

  # it "stores the entry station" do
  #   oystercard.touch_in
  #   expect(oystercard.entry_station).to eq station
  # end
end
