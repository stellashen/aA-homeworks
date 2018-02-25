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
    self.play
  end

  def take_turn
    show_sequence
    require_sequence
    @sequence_length += 1
    round_success_message unless game_over
  end

  def show_sequence
    system("clear")
    add_random_color
    seq.each do |color|
      puts color.to_s
      sleep 0.75
      system("clear")
    end
  end

  def require_sequence
    count_guess = 0
    while count_guess < sequence_length
      puts "Please enter a color: red blue green yellow."
      response = gets.chomp
      if response != seq[count_guess]
        @game_over = true
        return
      end
      count_guess += 1
    end
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "Congrats! You remember all the colors correctly!"
  end

  def game_over_message
    puts "Oops! Game is over. Try again."
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

=begin
To play the game, under terminal
~/Dropbox/AA/aA-homeworks/W2D1/Simon (master)$ pry
[1] pry(main)> load 'lib/simon.rb'
[2] pry(main)> game = Simon.new
[3] pry(main)> game.play
=end
