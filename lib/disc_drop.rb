# disc_drop.rb

# DiscDrop - game of Connect Four
class DiscDrop
  attr_reader :game_over, :board, :current_player
  def initialize
    @game_over = false
    @columns = 7
    @rows = 6
    @board = Array.new(@rows) { Array.new(@columns, '_') }
    @current_player = 'x'
  end

  def welcome_message
    puts 'Welcome to DiscDrop, a 7,6,4 m,n,k game.'
  end

  def display_board
    @board.each do |row|
      puts row.join(' | ')
    end
  end

  def drop_disc(column, player)
    unless valid_input?(column)
      puts "Invalid input. Please pick a column between 0 and 6."
      return
    end
  
    dropped = false
    @board.reverse_each do |row|
      if row[column] == '_'
        row[column] = player
        dropped = true
        break
      end
    end
  
    puts "Column full! Choose another." unless dropped
  end
  def switch_player
    @current_player = @current_player == 'x' ? 'o' : 'x'
  end

  def valid_input?(input)
    return false unless input.is_a? Numeric
    input.between?(0, 6)
  end

  def horizontal_win?
    @board.each do |row|
      if row.join.include?('xxxx') || row.join.include?('oooo')
        return true
      end
    end
    false
  end

  def vertical_win?
    @board.transpose.each do |col|
      if col.join.include?('xxxx') || col.join.include?('oooo')
        return true
      end
    end
    false
  end

  def diagonal_win?
    # upper-left to lower-right (↘)
    (0..@rows - 4).each do |row|
      (0..@columns - 4).each do |col|
        diagonal = (0..3).map { |i| @board[row + i][col + i] }
        if diagonal.join == 'xxxx' || diagonal.join == 'oooo'
          return true
        end
      end
    end
    false
  end

  def reverse_diagonal_win?
    # lower-left to upper-right (↗)
    (3...@rows).each do |row|
      (0..@columns - 4).each do |col|
        diagonal = (0..3).map { |i| @board[row - i][col + i] }
        if diagonal.join == 'xxxx' || diagonal.join == 'oooo'
          return true
        end
      end
    end
    false
  end

  def check_winner
    horizontal_win? || vertical_win? || diagonal_win? || reverse_diagonal_win?
  end

  def full_board?
    @board.flatten.none?('_')
  end

  def game_over?
    if check_winner
      puts "#{@current_player} wins!!!"
      @game_over = true
    elsif full_board?
      puts "It's a draw!"
      @game_over = true
    end
  end

  def play_game
    until @game_over
      display_board
      puts "#{@current_player}'s turn. Pick a column (0-6):"
      column = gets.chomp.to_i

      if valid_input?(column)
        drop_disc(column, @current_player)
        game_over?
        switch_player unless @game_over
      else
        puts "Invalid input. Please pick a valid column."
      end
    end
    display_board
    puts "Game Over! #{@game_over_message}"
  end
end
