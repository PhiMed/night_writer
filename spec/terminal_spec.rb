require 'rspec'
require './lib/terminal'

describe Terminal do
  it 'exists' do
    night_writer = Terminal.new("message.txt", "braille.txt")
    expect(night_writer).to be_an_instance_of(Terminal)
  end

  it 'returns a custom message to the command line' do
    night_writer = Terminal.new("message.txt", "braille.txt")
    expect(night_writer.user_provided_file).to eq "message.txt"
    expect(night_writer.output_braile_file).to eq "braille.txt"
  end

end
