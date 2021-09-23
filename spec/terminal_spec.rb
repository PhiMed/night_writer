require 'rspec'
require './lib/terminal'

describe Terminal do
  it 'exists' do
    night_writer = NightWriter.new(input)
    expect(night_writer).to be_an_instance_of(NightWriter)
  end
end
