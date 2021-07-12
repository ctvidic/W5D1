# require 'Enumerable'
require 'byebug'
class Node
  attr_reader :key
  attr_accessor :val, :next, :prev
  
  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
      self.prev.next = self.next
      self.next.prev = self.prev
      self.next = nil
      self.prev = nil
      # optional but useful, connects previous link to next link
      # and removes self from list.
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = Node.new()
    @tail = Node.new()
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index do |link, j| 
      return link if i == j  
    end
    nil
  end

  def first
    @head
  end

  def last
    @tail
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
      self.each do |node|
        if node.key == key
          return node.val
        end
      end  
  end

  def include?(key)
      self.each do |node|
        return true if node.key == key
      end
      false

  end

  def append(key, val)
    newNode = Node.new(key,val)
    prev = @tail.prev
    # self.tail.prev.next = newNode
    newNode.next = @tail
    newNode.prev = prev
    prev.next = newNode
    @tail.prev = newNode
  end

  def update(key, val)
  end

  def remove(key)
      self.each do |node|
          if node.key == key 
              debugger
              nextNode = node.next
              prevNode = node.prev
              
              prevNode.next = nextNode
              nextNode.prev = prevNode
          end
      end
  end

  def each(&prc)
      currNode = @head.next
      while currNode.next != nil
            prc.call(currNode)
             
            currNode = currNode.next
      end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
