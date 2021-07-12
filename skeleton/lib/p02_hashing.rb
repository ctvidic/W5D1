

class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
      newArr = []
      self.each do |val|
        newArr << [val]
      end
      newArr.join("").to_i.hash
  end
end

class String
  def hash
      newArr = []
      alphabet = ('a'..'z').to_a
      self.each_char do |char|
          newArr << alphabet.index(char)
      end
      newArr.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
          newArr = []
          alphabet = ('a'..'z').to_a
          self.each do |k,v|
                if k.is_a?(String) || k.is_a?(Symbol)
                  k = k.to_s
                  newArr << alphabet.index(k)
                else
                  newArr << k
                end
                if v.is_a?(String) || v.is_a?(Symbol)
                  v = v.to_s
                  newArr << alphabet.index(v)
                else
                  newArr << v
                end
          end
          newArr.sort.hash
  end

end
