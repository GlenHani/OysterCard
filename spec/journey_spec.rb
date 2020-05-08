require './lib/journey'
require 'journey'

RSpec.describe Journey do
  let(:entry_station) { double(:Aldgate) }
  let(:exit_station) { double(:Finchley) }

  it 'should return complete single journey' do
    subject.current_journey(entry_station, exit_station)
    expect(subject.journey).to eq [{ entry_station => exit_station }]
  end


  it "Should return an empty journey when initialised" do
    expect(subject.journey).to eq []
  end
   
end