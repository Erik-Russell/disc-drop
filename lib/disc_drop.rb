# disc_drop.rb

# DiscDrop - game of Connect Four
class DiscDrop
  attr_reader :game_over
  def initialize
    @game_over = false
    @columns = 7
    @rows = 6
  end

  def welcome_message
    puts 'Welcome to DiscDrop, a 7,6,4 m,n,k game.'
  end
end
