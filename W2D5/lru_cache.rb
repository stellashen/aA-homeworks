class LRUCache
  def initialize(size)
    @size = size
    @cache = []
  end

  def count
    # returns number of elements currently in cache
    @cache.count
  end

  def add(el)
    # adds element to cache according to LRU principle
    if @cache.include?(el)
      @cache.delete(el)
    elsif count >= @size
      @cache.shift
    end
    @cache << el
  end

  def show
    # shows the items in the cache, with the LRU item first
    idx = 0
    while idx < self.count
      puts @cache[idx]
    end
  end
end
