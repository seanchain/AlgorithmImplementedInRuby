#! /usr/bin/ruby 

class Stack
  attr_reader :arr
  def initialize
    @arr = []
  end
  def stackSize
    @arr.size
  end
  def push elem
    @arr.push elem 
  end
  def pop
    return @arr.pop
  end
  def to_s
    @arr
  end
end
