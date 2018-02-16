class Map
  attr_accessor :map

  def initialize
    @map = {}
  end

  def assign(key, value)
    map[key] = value if map[key] == nil
    map[key] << value
  end

  def lookup(key)
    map[key]
  end

  def remove(key)
    map.delete(key)
  end

  def show
    map.dup
  end
end
