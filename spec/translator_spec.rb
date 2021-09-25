require_relative './spec_helper'

describe Translator do
  before :each do
    @translator = Translator.new
  end

  it 'exists' do
    expect(@translator).to be_an_instance_of(Translator)
  end

  it 'can read the braille.txt file' do
    expect(@translator.content.length).to eq 729
  end

end
