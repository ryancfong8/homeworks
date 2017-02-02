fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octopus(array)
  array.each_with_index do |el, i1|
    max_length = true
    array.each_with_index do |el2, i2|
      next if i1 == i2
      if el2.length > el.length
        max_length = false
      end
    end
    return el if max_length
  end
end

#puts sluggish_octopus(fish) == 'fiiiissshhhhhh'

class Array
  def merge_sort(&prc)
    return self if self.length < 2
    prc ||= Proc.new{|x, y| x <=> y}

    midpoint = self.length / 2
    left_side = self.take(midpoint).merge_sort(&prc)
    right_side = self.drop(midpoint).merge_sort(&prc)
    Array.merge(left_side, right_side, &prc)
  end

  private
  def self.merge(left, right, &prc)
    prc ||= Proc.new{|x, y| x <=> y}
    result = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        result << left.shift
      when 0
        result << left.shift
      when 1
        result << right.shift
      end
    end
    result + left + right
  end
end

def dominant_octopus(array)
  arr = array.merge_sort {|x, y| x.length <=> y.length}
  arr.last
end

#puts dominant_octopus(fish) == 'fiiiissshhhhhh'

def clever_octopus(array)
  longest_word = array.first
  longest_length = array.first.length
  array.drop(1).each do |el|
    if el.length > longest_length
      longest_length = el.length
      longest_word = el
    end
  end
  longest_word
end

puts clever_octopus(fish) == 'fiiiissshhhhhh'

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(tile_direction, tiles_array)
  tiles_array.each_with_index do |el, i|
    return i if el == tile_direction
  end
end

#puts slow_dance("up", tiles_array) == 0
#puts slow_dance("right-down", tiles_array) == 3

def fast_dance(tile_direction, tiles_array)
  hash = {
    "up" => 0,
    "right-up" => 1,
    "right" => 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
  }

  hash[tile_direction]
end

#puts fast_dance("up", tiles_array) == 0
#puts fast_dance("right-down", tiles_array) == 3
