# spec/disc_drop_spec.rb

require 'spec_helper'
require_relative '../lib/disc_drop.rb'

# describe whole class
# set subject to be new instance of class
# first test is there is a new instance of the class
describe DiscDrop do
  describe '#initialize' do
    subject = DiscDrop.new
    it 'creates an instance of DiscDrop' do
      expect(subject).to be_an_instance_of(DiscDrop)
    end

    it 'game over is false' do
      expect(subject.game_over).to be false
    end
  end
end
