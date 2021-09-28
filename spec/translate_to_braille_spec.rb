require_relative './spec_helper'

describe TranslateToBraille do
  before :each do
    filename = './message.txt'
    @translator = TranslateToBraille.new(filename)
  end

  it 'exists' do
    expect(@translator).to be_an_instance_of(TranslateToBraille)
  end

  it 'has access to the message.txt file' do
    expect(@translator.content.length).to eq 169
  end

  it 'can convert the content to an array of characters' do
    expect(@translator.array_of_untranslated_characters).not_to eq nil
  end

  it 'can translate' do
    original_array = @translator.array_of_untranslated_characters
    expect(@translator.translate_to_braille).not_to eq nil
    expect(@translator.translate_to_braille).not_to eq original_array
  end
end
