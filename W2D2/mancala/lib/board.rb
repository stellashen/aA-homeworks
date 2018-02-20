require_relative 'player'
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = Player.new(name1, 1)
    @player2 = Player.new(name2, 2)
    @cups = Array.new(14) { [] }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    idx = 0
    while idx < 14
      unless [6, 13].include?(idx)
        4.times { cups[idx] << :stone }
      end
      idx += 1
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless (1..14).cover?(start_pos)
  end

  def make_move(start_pos, current_player_name)
    opponent_store_pos = start_pos < 7 ? 13 : 6
    num_stones = @cups[start_pos].length
    # 1. empty the selected cup
    @cups[start_pos] = Array.new

    # 2. distribute the stones from the selected cup    
    skip = false
    num_stones.times do |idx|
      idx_to_place_stone = start_pos + 1 + idx
      # skip the opponent's store
      if idx_to_place_stone == opponent_store_pos
        skip = true
        next
      end
      # add one stone to the current cup
      distribute_stone(idx_to_place_stone)
    end

    # 3. if we have skipped a cup, we need to place the last stone
    if skip == true
      distribute_stone(start_pos + num_stones + 1)
      ending_cup_idx = start_pos + num_stones + 1
    else
      ending_cup_idx = start_pos + num_stones
    end

    # 4. ending situations: if the ending cup
    # a) has stones already in it
    # => returns the cup's array index
    # b) is an empty cup
    # => returns :switch
    # c) is an empty cup
    # => returns :prompt
    next_turn(ending_cup_idx)
  end

  def distribute_stone(idx)
    # helper method to determine what #make_move returns
    cup = @cups[idx]
    if cup.nil?
      @cups[idx] = [:stone]
    else
      @cups[idx] << :stone
    end
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    return :prompt if [6, 13].include? (ending_cup_idx)
    return :switch if @cups[ending_cup_idx].length == 1
    ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
