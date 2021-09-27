require_relative './spec_helper'

describe Formatter do
  before :each do
    @formatter = Formatter.new
  end

  it 'exists' do
    expect(@formatter).to be_an_instance_of(Formatter)
  end

  it 'formats' do
    expect(@formatter.reformat).not_to be nil
  end

end
