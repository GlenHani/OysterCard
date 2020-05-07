require './lib/journey'

RSpec.describe Journey do
  let(:station) { double :station, zone: 1}
  subject {described_class.new(entry_station: station)}

  it "knows if a journey is not complete" do
    expect(subject).not_to be_complete
  end

  it 'has a penalty fare by default' do
    expect(subject.fare).to eq Journey::PENALTY_FARE
  end

  it "returns itself when exiting a journey" do
    expect(subject.finish(station)).to eq(station)
  end

  it 'calculates a fare' do
    test = subject.check_in
    test1 = subject.fare
    expect { test.(to eq 1) }
  end


  context 'given an entry station' do

    it 'has an entry station' do
      expect(subject.entry_station).to eq station
    end

    it "returns a penalty fare if no exit station given" do
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end

    context 'given an exit station' do
      let(:other_station) { double :other_station }

      before do
        subject.finish(other_station)
      end


      it "knows if a journey is complete" do
        expect { subject.(to_be complete) }
      end
    end
  end
end
