require './lib/oystercard'

describe OysterCard do
  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  it 'can top up the balance' do
    expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
  end

  it 'raises an error if the minumum balance is reached' do
    minimum_balance = OysterCard::MINIMUM_BALANCE
    expect { subject.touch_out  }.to change{ subject.balance }.by (-OysterCard::MINIMUM_BALANCE)
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
    subject.touch_in
    expect(subject).to be_in_journey
  end

  it "can touch out" do
    subject.touch_in
    subject.touch_out
    expect(subject).not_to be_in_journey
  end
end
