require_relative './spec_helper'

describe Translator do
  before :each do
    @translator = Translator.new
  end

  it 'exists' do
    expect(@translator).to be_an_instance_of(Translator)
  end

  it 'can has access to the braille.txt file' do
    expect(@translator.content.length).to eq 5
  end

  it 'can convert the content to an array of characters' do
    expect(@translator.content_to_array_of_characters).not_to eq nil
  end

  it 'can translate' do
    expect(@translator.translate).not_to eq nil
  end
end
