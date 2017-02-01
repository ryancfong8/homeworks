class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {[]}
    place_stones
  end

  def place_stones
    @cups.each_index do |i1|
      next if i1 == 6 || i1 == 13
      @cups[i1] = [:stone, :stone, :stone, :stone]
    end
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' if start_pos.between?(1,12) == false || start_pos == 6
    raise 'Invalid starting cup' if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []
    pos = 0
    (1..stones.length).each do |i1|
      pos = start_pos + i1
      if pos > 13
        if current_player_name == @name2
          pos = pos - 14
        else
          pos = pos - 13
        end
      elsif pos == 13
        if current_player_name != @name2
          pos = 0
        else
          pos = 13
        end
      elsif pos >= 6
        if current_player_name != @name1
            pos = pos + 1
        end
      end
      @cups[pos] << :stone
    end
    render
    next_turn(pos)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif @cups[ending_cup_idx] == [:stone]
      return :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if @cups.take(6).all? {|cup| cup.empty? } || @cups[7..12].all? {|cup| cup.empty? }
    return false
  end

  def winner
    return :draw if @cups[6] == @cups[13]
    return @cups[6].length > @cups[13].length ? @name1 : @name2
  end
end
