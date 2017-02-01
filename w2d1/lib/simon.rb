class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    puts "Got the sequence? (type yes to proceed)"
    guess = gets.chomp
    system("clear") 
    guess = require_sequence
    round_success_message(guess)
    @sequence_length += 1
  end

  def show_sequence
    add_random_color
    puts @seq
  end

  def require_sequence
    puts "What is the sequence? yellow, blue, green, red, etc."
    gets.chomp.split(", ")
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message(guess)
    if guess == @seq
      puts "Success!"
    else
      puts "Sorry! Incorrect sequence!"
      @game_over = true
    end
  end

  def game_over_message
    puts "Congratulations! You lasted #{@sequence_length} rounds!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

if __FILE__ == $PROGRAM_NAME
  Simon.new.play
end
