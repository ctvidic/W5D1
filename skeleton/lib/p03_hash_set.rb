class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if count == num_buckets 
      resize!
    end
    if !self.include?(key)
      self[key].push(key)
      @count += 1
    end
  end

  def include?(key)
    return true if self[key].include?(key)
    false
  end

  def remove(key)
    if self.include?(key)
      self[key].delete(key)
      @count -= 1
    end
  end

  private

  def [](key)
    @store[key.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
     # @store <<  Array.new(num_buckets)
     flat = @store.flatten
     # num_buckets *= 2
     double = num_buckets*2
     @store = Array.new(double) { Array.new }
     @count = 0
     flat.each do |ele|
       insert(ele)
     end
     # return @store.length
  end
end
