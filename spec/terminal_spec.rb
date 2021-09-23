require 'rspec'
require './lib/terminal'

describe Terminal do
  it 'exists' do
    night_writer = Terminal.new("message.txt", "braille.txt")
    expect(night_writer).to be_an_instance_of(Terminal)
  end
end
