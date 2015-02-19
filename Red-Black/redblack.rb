#! /usr/bin/ruby

=begin
红黑二叉查找树是一种二三树德实现，其中，红链接将两个2-结点连接起来构成一个3-结点，而黑链接则是普通的链接，使用红黑树的好处在于可以方便的使用二叉查找树的方法

红黑树满足：
1 红链接均为左链接
2 没有任何一个结点同时跟两条红链接相连
3 任意结点稻根节点的路径上黑链接的数量相等。

=end

RED = true
BLACK = false

class Node
  attr_accessor :left, :right, :color
  attr_reader :hash
  def initialize key = nil, val = nil, color = BLACK
    @hash = Hash.new
    @hash.store key, val
    @color = color
  end
  def key
    return @hash.keys[0]
  end
  def value
    return @hash.values[0]
  end
  def isRed x
    return false if x == nil
    return x.color == RED
  end
end
