require 'spec_helper'
require_relative '../lib/disc_drop.rb'

RSpec.describe 'Example' do
  it 'does something' do
    expect(1 + 1).to eq(2)
  end
end

# describe whole class
# set subject to be new instance of class
# first test is there is a new instance of the class
describe DiscDrop do
  it 'creates an instance of DiscDrop' do
    instance = DiscDrop.new
    expect(instance).to be_an_instance_of(DiscDrop)
  end
end
