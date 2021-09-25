require_relative './spec_helper'

describe Letter do
  it 'exists' do
    letter = Letter.new({:braille_letter => ".0/n00/n00/n",
                        :roman_letter => "a"})
    expect(letter).to be_an_instance_of(Letter)
  end

  it 'attributes' do
    letter = Letter.new({:braille_letter => ".0/n00/n00/n",
                        :roman_letter => "a"})
    expect(letter.braille_letter).to eq(".0/n00/n00/n")
    expect(letter.roman_letter).to eq("a")
  end

end
