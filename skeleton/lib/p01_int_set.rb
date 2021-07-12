class MaxIntSet
  def initialize(max)
      @store = Array.new(max)
  end

  def store
    @store
  end

  def store=(num)
    @store[num]
  end

  def insert(num)
    raise 'Out of bounds' if num > @store.length-1 || num < 0
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    return true if @store[num]
    false
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num].push(num)
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    return true if self[num].include?(num)
    false
  end

  private

  def [](num)
    @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)    
    if count == num_buckets
      resize!
    end
    if !self.include?(num)
      self[num].push(num)
      @count += 1
    end
  end

  def remove(num)
    if self.include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    return true if self[num].include?(num)
    false
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    # @store <<  Array.new(num_buckets)
    if @count > num_buckets
      flat = @store.flatten
      # num_buckets *= 2
      double = num_buckets*2
      @store = Array.new(double) { Array.new }
      # @count = 0
      flat.each do |ele|
        insert(ele)
      end
    end
  
    return @store.length
  end
end
