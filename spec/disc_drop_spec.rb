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

  describe '#check_winner' do
    subject(:game) { DiscDrop.new }

    context 'when there is a bottom-left to top-right diagonal win' do
      before do
        game.instance_variable_set(:@board, [
          ['_', '_', '_', '_', '_', '_', '_'],
          ['_', '_', '_', '_', '_', '_', '_'],
          ['_', '_', '_', 'x', '_', '_', '_'],
          ['_', '_', 'x', '_', '_', '_', '_'],
          ['_', 'x', '_', '_', '_', '_', '_'],
          ['x', '_', '_', '_', '_', '_', '_']
        ])
      end

      it 'returns true for reverse_diagonal win' do
        expect(game.check_winner).to be true
      end
    end

    context 'when there is a top-left to bottom-right diagonal win' do
      before do
        game.instance_variable_set(:@board, [
          ['o', '_', '_', '_', '_', '_', '_'],
          ['_', 'o', '_', '_', '_', '_', '_'],
          ['_', '_', 'o', '_', '_', '_', '_'],
          ['_', '_', '_', 'o', '_', '_', '_'],
          ['_', '_', '_', '_', '_', '_', '_'],
          ['_', '_', '_', '_', '_', '_', '_']
        ])
      end

      it 'returns true for diagonal win' do
        expect(game.check_winner).to be true
      end
    end

    context 'when there is a vertical win' do
      before do
        game.instance_variable_set(:@board, [
          ['_', 'x', '_', '_', '_', '_', '_'],
          ['_', 'x', '_', '_', '_', '_', '_'],
          ['_', 'x', '_', '_', '_', '_', '_'],
          ['_', 'x', '_', '_', '_', '_', '_'],
          ['_', '_', '_', '_', '_', '_', '_'],
          ['_', '_', '_', '_', '_', '_', '_']
        ])
      end

      it 'returns true for a vertical win' do
        expect(game.check_winner).to be true
      end
    end

    context 'when there is a horizontal win' do
      before do
        game.instance_variable_set(:@board, [
          ['_', '_', '_', '_', '_', '_', '_'],
          ['_', '_', '_', '_', '_', '_', '_'],
          ['_', '_', '_', '_', '_', '_', '_'],
          ['_', 'x', 'x', 'x', 'x', '_', '_'],
          ['_', '_', '_', '_', '_', '_', '_'],
          ['_', '_', '_', '_', '_', '_', '_']
        ])
      end

      it 'returns true for a horizontal win' do
        expect(game.check_winner).to be true
      end
    end
  end

  describe '#full_board?' do
    subject(:no_win) { DiscDrop.new }

    context 'when the board is not full' do
      before do
        no_win.instance_variable_set(:@board, [
          ['o', 'o', 'x', 'x', 'o', '_', 'o'],
          ['o', 'x', 'x', 'o', 'o', 'x', 'x'],
          ['x', 'x', 'o', 'x', 'x', 'o', 'o'],
          ['x', 'o', 'o', 'o', 'x', 'x', 'o'],
          ['o', 'x', 'x', 'o', 'o', 'o', 'x'],
          ['x', 'x', 'o', 'o', 'o', 'x', 'o']
        ])
      end

      it 'returns false' do
        expect(no_win.full_board?).to be false
      end
    end

   context 'when the board is full and there is no winning move' do
      before do
        no_win.instance_variable_set(:@board, [
          ['o', 'o', 'x', 'x', 'o', 'o', 'o'],
          ['o', 'x', 'x', 'o', 'o', 'x', 'x'],
          ['x', 'x', 'o', 'x', 'x', 'o', 'o'],
          ['x', 'o', 'o', 'o', 'x', 'x', 'o'],
          ['o', 'x', 'x', 'o', 'o', 'o', 'x'],
          ['x', 'x', 'o', 'o', 'o', 'x', 'o']
        ])
      end

      it 'returns true for a full board' do
        expect(no_win.full_board?).to be true
      end
    end
  end
end
