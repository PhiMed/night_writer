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
    expect(night_writer.character_count("message.txt")).to eq 2
  end

  it 'creates a new file called braille.txt loaded with translated text' do
    night_writer = Terminal.new("message.txt", "braille.txt")
    expect(night_writer.character_count("message.txt")).to eq 2
    night_writer.copy_translate_format_and_save
    night_writer.elaborate_way_to_remove_brackets
    expect(night_writer.character_count("braille.txt")).to be 6
  end
end
