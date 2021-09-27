require_relative './spec_helper'

describe Reader do
  before :each do
    @braille_file = './braille.txt'
    @output_file = './message.txt'
    @night_reader = Reader.new("braille.txt", "message.txt")
  end

  it 'exists' do
    expect(@night_reader).to be_an_instance_of(Reader)
  end

  it 'returns the character count of user_provided_file' do
    expect(@night_reader.character_count(@output_file)).to eq 6
  end

  it 'creates a new file loaded with english text' do
    expect(@night_reader.character_count(@braille_file)).to be 39
    @night_reader.copy_translate_save_to_english
    expect(@night_reader.character_count(@output_file)).to be 6

  end
end
