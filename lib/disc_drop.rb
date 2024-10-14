# disc_drop.rb

# DiscDrop - game of Connect Four
class DiscDrop
  attr_reader :game_over, :board
  def initialize
    @game_over = false
    @columns = 7
    @rows = 6
    @board = Array.new(6) { Array.new(7, '_') }
    @current_player = 'x'
  end

  def welcome_message
    puts 'Welcome to DiscDrop, a 7,6,4 m,n,k game.'
  end

  def display_board
    @board.each_with_index do |row, index|
      puts row.join(' | ')
    end
  end

  def drop_disc(column,player)
    unless valid_input?(column)
      puts "invalid input"
      return nil
    end

    dropped = false

    @board.reverse_each do |row|
      next if row[column] != '_'
      break if dropped == true
      row[column] = @current_player
      dropped = true
    end

    unless dropped
      puts 'column full'
    end
  end

  def switch_player
    @current_player = @current_player == 'x' ? 'o' : 'x'
  end

  def valid_input?(input)
    return false unless input.is_a? Numeric
    input.between?(0,6)
  end

end
