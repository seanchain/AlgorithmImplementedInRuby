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
  attr_reader :node_count
  def initialize node = nil
    @root = node
    @node_count = 1
  end
  def insert node #向二叉查找树中插入节点node，需要使用put函数
    @root = self.put @root, node
    @node_count += 1
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
  def minval
    return min(@root).value
  end
  def min x
    return x if x.left == nil
    return min x.left
  end
  def maxval
    return max(@root).value
  end
  def max x
    return x if x.right == nil
    return max x.right
  end
  def leaves
    self.leafcount @root
  end
  def leafcount x
    return 0 if x == nil
    return 1 if x.left == nil and x.right == nil
    return leafcount(x.left) + leafcount(x.right)
  end
  def depth
    return height @root
  end
  def height x
    return 0 if x == nil
    return 1 + getBigger(height(x.left), height(x.right))
  end
  def getBigger x, y
    return x > y ? x : y
  end
  def deleteMin
    @root = deleteMinHelp @root
  end
  def deleteMax
    @root = deleteMaxHelp @root
  end
  def deleteMaxHelp x
    return x.left if x.right == nil #x无右分支，则直接去左边分支作为删掉最大值
    x.right = deleteMaxHelp x.right
    return x
  end
  def deleteMinHelp x
    return x.right if x.left == nil #x无左分支，则直接去邮编分支作为删掉最小值
    x.left = deleteMinHelp x.left
    return x
  end

end
