require_relative './spec_helper'

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

  it 'returns the character count of user_provided_file' do
    night_writer = Terminal.new("message.txt", "braille.txt")
    expect(night_writer.character_count("message.txt")).to eq 729
  end

  it 'creates a new file loaded with users txt' do
    night_writer = Terminal.new("message.txt", "braille.txt")
    expect(night_writer.character_count("message.txt")).to eq 729
    expect(night_writer.character_count("braille.txt")).to eq 0
    night_writer.copy_and_create
    expect(night_writer.character_count("braille.txt")).to eq 729
  end

end
