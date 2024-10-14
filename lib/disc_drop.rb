# disc_drop.rb

# DiscDrop - game of Connect Four
class DiscDrop
  attr_reader :game_over, :board
  def initialize
    @game_over = false
    @columns = 7
    @rows = 6
    @board = Array.new(6) { Array.new(7, '_') }
  end

  def welcome_message
    puts 'Welcome to DiscDrop, a 7,6,4 m,n,k game.'
  end

  def display_board
    @board.each_with_index do |row, index|
      puts row.join(' | ')
    end
end
