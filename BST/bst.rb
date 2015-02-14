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
  def insert node #向二叉查找树中插入节点node，需要使用put函数
    @root = self.put @root, node
  end
  def put x, node
    return Node.new(node.key, node.value) if x == nil
    x.left = put x.left, node if node.key < x.key
    x.right = put x.right, node if node.key > x.key
    x.value = node.value if node.key == x.key
    return x
  end

  def getVal key  #在BST中查找一个键值为k的元素是否存在，存在则输出get函数
    return self.get @root, key
  end
  def get x, key
    begin
      raise "Can't find such key of the BST" if x == nil #根节点为空直接返回
      cmp = key - x.key
      return self.get x.left, key if cmp < 0
      return self.get x.right, key if cmp > 0
      return x.value if cmp == 0
    rescue => ex
      return ex.message
    end
  end
end
