class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    @map.each do |pair|
      if pair[0].include?(key)
        @map.delete(pair)
      end
    end

    @map << [key, value]
  end

  def lookup(key)
    @map.each do |pair|
      return pair[1] if pair[0] == key
    end
    nil
  end

  def remove(key)
    @map.each do |pair|
      @map.delete(pair) if pair[0].include?(key)
    end
  end

  def show
    p @map
  end
end
