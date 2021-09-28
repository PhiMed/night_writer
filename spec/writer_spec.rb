require_relative './spec_helper'

describe Writer do
  it 'exists' do
    night_writer = Writer.new("message.txt", "braille.txt")
    expect(night_writer).to be_an_instance_of(Writer)
  end

  it 'returns a custom message to the command line' do
    night_writer = Writer.new("message.txt", "braille.txt")
    expect(night_writer.user_provided_file).to eq "message.txt"
    expect(night_writer.output_file).to eq "braille.txt"
  end

  it 'returns the character count of user_provided_file' do
    night_writer = Writer.new("message.txt", "braille.txt")
    expect(night_writer.character_count("message.txt")).to eq 150
  end

  it 'creates a new file called braille.txt loaded with translated text' do
    night_writer = Writer.new("message.txt", "braille.txt")
    expect(night_writer.character_count("message.txt")).to eq 150
    night_writer.copy_translate_and_save_to_braille
    expect(night_writer.character_count("braille.txt")).to be 867
  end
end
