# spec/disc_drop_spec.rb

require_relative '../lib/disc_drop.rb'
require 'spec_helper'

# describe whole class
# set subject to be new instance of class
# first test is there is a new instance of the class
describe DiscDrop do
  subject { DiscDrop.new}

  describe '#initialize' do
    it 'creates an instance of DiscDrop' do
      expect(subject).to be_an_instance_of(DiscDrop)
    end

    it 'game over is false' do
      expect(subject.game_over).to be false
    end
  end

  describe '#welcome_message' do
    it 'displays message to stdout' do
      expect { subject.welcome_message }.to output("Welcome to DiscDrop, a 7,6,4 m,n,k game.\n").to_stdout
    end
  end

  describe '#drop_disc' do
    it 'rejects invalid input' do
      bad_input = 7
      expect { subject.drop_disc(bad_input) }.to output("invalid input\n").to_stdout
    end

    it 'accepts good input' do
      good_input = 5
      subject.drop_disc(good_input)
      expect(subject.board[5][5]).to eq('x')
    end
  end
end
