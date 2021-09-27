require_relative './spec_helper'

describe TranslateToEnglish do
  before :each do
    user_file = './braille.txt'
    @translator = TranslateToEnglish.new(user_file)
  end

  it 'exists' do
    expect(@translator).to be_an_instance_of(TranslateToEnglish)
  end

  it 'has access to the braille.txt file' do
    expect(@translator.content.length).to eq 39
  end

  it 'can convert the content to an array of characters' do
    expect(@translator.array_of_untranslated_characters).not_to eq nil
  end

  it 'can translate' do
    original_array = @translator.array_of_untranslated_characters
    expect(@translator.translate_to_english).not_to eq nil
    expect(@translator.translate_to_english).not_to eq original_array
  end
end
