class Map
  def initialize
    @map = [] # holds [key,value] pairs
  end

  def assign(key, value)
    idx = @map.index { |pair| pair[0] == key }
    # overwrite value if key exists, otherwise insert key, value pair
    idx ? @map[idx][1] = value : @map.push([key, value])
    [key, value]
  end

  def lookup(key)
    @map.each { |pair| return pair[1] if pair[0] == key}
    nil
  end

  def remove(key)
    @map.reject! { |pair| pair[0] == key }
    nil
  end

  def show
    deep_dup(@map)
  end

  private

  def deep_dup(arr)
    arr.map { |el| el.is_a?(Array) ? deep_dup(arr) : el}
  end
end
