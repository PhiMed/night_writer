require_relative './spec_helper'

describe Letter do
  it 'exists' do
    letter = Letter.new({:braille_letter => "0.....",
                        :roman_letter => "a"})
    expect(letter).to be_an_instance_of(Letter)
  end

  it 'attributes' do
    letter = Letter.new({:braille_string => "0.....",
                        :roman_letter => "a"})
    expect(letter.braille_string).to eq("0.....")
    expect(letter.roman_letter).to eq("a")
  end

end
