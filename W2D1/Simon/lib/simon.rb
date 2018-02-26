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
    puts "New game is about to start!"
    sleep 2
    self.play
  end

  def take_turn
    show_sequence
    require_sequence
    unless game_over
      @sequence_length += 1
      round_success_message
      sleep 2
    end
  end

  def show_sequence
    system("clear")
    add_random_color
    seq.each do |color|
      puts color.to_s
      sleep 0.75
      system("clear")
      sleep 0.25
    end
  end

  def require_sequence
    count_guess = 0
    puts "Please enter the colors you saw one at a time:
          red blue green yellow."
    sleep 1
    while count_guess < sequence_length
      puts "Please enter the #{get_count(count_guess)} color:"
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
    puts "Congrats! You remember all the colors correctly! Next round:"
  end

  def game_over_message
    puts "Oops! Game is over. You made it #{sequence_length - 1} rounds. Try again."
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  private

  def get_count(count_guess)
    return "1st" if count_guess == 0
    return "2nd" if count_guess == 1
    return "3rd" if count_guess == 2
    "#{count_guess + 1}th"
  end
end

=begin
To play the game, under terminal
~/Dropbox/AA/aA-homeworks/W2D1/Simon (master)$ pry
[1] pry(main)> load 'lib/simon.rb'
[2] pry(main)> game = Simon.new
[3] pry(main)> game.play
=end
