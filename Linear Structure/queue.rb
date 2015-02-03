#! /usr/bin/ruby 

class Queue
  attr_reader :arr
  def initialize
    @arr = []
  end
  def enqueue elem
    @arr.push elem
  end
  def dequeue
    return @arr.shift
  end

  def queueSize
    return @arr.size
  end

  def to_s
    @arr
  end

end
