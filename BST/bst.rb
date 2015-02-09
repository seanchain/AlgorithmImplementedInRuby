#! /usr/bin/ruby


class Node
  attr_accessor :left, :right
  attr_reader :hash
  def initialize key = nil, val = nil
    @hash = Hash.new
    @hash.store key, val
  end
  def key
    return @hash.keys[0]
  end
  def value
    return @hash.values[0]
  end
end

class BST
  attr_accessor :root
  def initialize node = nil
    @root = node
  end
  def insert node
    @root = self.put @root, node
  end
  def put x, node
    return Node.new(node.key, node.value) if x == nil
    x.left = put x.left, node if node.key < x.key
    x.right = put x.right, node if node.key > x.key
    x.value = node.value if node.key == x.key
    return x
  end
end
