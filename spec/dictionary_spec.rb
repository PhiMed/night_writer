require_relative './spec_helper'

describe Dictionary do
  it 'exists' do
    dictionary = Dictionary.new
    expect(dictionary).to be_an_instance_of(Dictionary)
  end

  it 'creates a dictionary of Letter objects' do
    dictionary = Dictionary.new
    expect(dictionary.letters[0]).to be_an_instance_of(Letter)
  end
end
