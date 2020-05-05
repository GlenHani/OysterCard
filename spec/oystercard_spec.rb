require './lib/oystercard'

describe OysterCard do
  let(:in_station) {double :in_station}
  let(:out_station) { double :out_station }

  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  it 'can top up the balance' do
    expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
  end

  it 'will not touch in if below minimum balance' do
    minimum_balance = OysterCard::MINIMUM_BALANCE
    expect{ subject.touch_in(in_station) }.to raise_error "Insufficient balance to touch in"
  end

  it 'minimum charge for touch out' do
    minimum_balance = OysterCard::MINIMUM_BALANCE
    expect { subject.touch_out(out_station) }.to change{ subject.balance }.by (-OysterCard::MINIMUM_BALANCE)
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
    subject.touch_in(in_station)
    expect(subject).to be_in_journey
  end

  it "can touch out" do
    subject.top_up(15)
    subject.touch_in(in_station)
    subject.touch_out(out_station)
    expect(subject).not_to be_in_journey
  end

  it 'entry station' do
    subject.top_up(15)
    subject.touch_in(in_station)
    expect{ subject.entry_station.to eq (in_station) }
  end

  it 'entry station' do
    subject.top_up(15)
    subject.touch_out(out_station)
    expect{ subject.entry_station.to eq (out_station) }
  end

  it 'has an empty list of journeys by default' do
    expect(subject.journeys).to be_empty
  end

  let(:journey){ {in_station: in_station, out_station: out_station} }

  it 'stores a journey' do
    subject.top_up(15)
    subject.touch_in(in_station)
    subject.touch_out(out_station)
    expect {subject.journeys.to include (journey)}
  end

end
