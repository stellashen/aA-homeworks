require_relative 'player'
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
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
    raise "Invalid starting cup" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    if current_player_name == @name1
      opponent_store = 13
    else
      opponent_store = 6
    end

    num_stones = @cups[start_pos].length
    # 1. empty the selected cup
    @cups[start_pos] = Array.new

    # 2. distribute the stones from the selected cup
    num_placed = 0
    idx_to_place_stone = start_pos + 1
    while num_placed < num_stones
      unless opponent_store == idx_to_place_stone
        distribute_stone(idx_to_place_stone)
        num_placed += 1
      end
      idx_to_place_stone += 1 unless num_placed == num_stones
      idx_to_place_stone = 0 if idx_to_place_stone > 13
    end

    # 3. display board
    render

    # 4. ending situations: if the ending cup
    # a) has stones already in it
    # => returns the cup's array index
    # b) is an empty cup
    # => returns :switch
    # c) is an empty cup
    # => returns :prompt
    next_turn(idx_to_place_stone)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    return :prompt if [6, 13].include?(ending_cup_idx)
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

  private

  def distribute_stone(idx)
    # helper method to determine what #make_move returns
    cup = @cups[idx]
    if cup.nil?
      @cups[idx] = [:stone]
    else
      @cups[idx] << :stone
    end
  end
end
