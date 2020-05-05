require './lib/oystercard'

describe OysterCard do
  let(:station) {double :station}

  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  it 'can top up the balance' do
    expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
  end

  it 'will not touch in if below minimum balance' do
    minimum_balance = OysterCard::MINIMUM_BALANCE
    expect{ subject.touch_in(station) }.to raise_error "Insufficient balance to touch in"
  end

  it 'minimum charge for touch out' do
    minimum_balance = OysterCard::MINIMUM_BALANCE
    expect { subject.touch_out }.to change{ subject.balance }.by (-OysterCard::MINIMUM_BALANCE)
  end

  it 'raises an error if the maximum balance is exceeded' do
    maximum_balance = OysterCard::MAXIMUM_BALANCE
    subject.top_up maximum_balance
    expect{ subject.top_up 1 }.to raise_error "Maximum balance of #{maximum_balance} exceeded"
  end

  it 'is initially not in a journey' do
    expect(subject).not_to be_in_journey
  end

  it "can touch in" do
    subject.top_up(15)
    subject.touch_in(station)
    expect(subject).to be_in_journey
  end

  it "can touch out" do
    subject.top_up(15)
    subject.touch_in(station)
    subject.touch_out
    expect(subject).not_to be_in_journey
  end



  it 'entry station' do
    subject.top_up(15)
    subject.touch_in(station)
    expect{ subject.entry_station.to eq (station) }
  end
end
