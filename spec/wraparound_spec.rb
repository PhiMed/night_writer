require_relative './spec_helper'

describe Wraparound do
  before :each do
    filename = './braille.txt'
    @wraparound = Wraparound.new(filename)
  end

  it 'exists' do
    expect(@wraparound).to be_an_instance_of(Wraparound)
  end
end
