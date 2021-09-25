require_relative './spec_helper'

describe Dictionary do
  it 'exists' do
    dictionary = Dictionary.new
    expect(dictionary).to be_an_instance_of(Dictionary)
  end
end
