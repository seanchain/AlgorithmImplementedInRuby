#! /usr/bin/ruby


class Node
  attr_accessor :left, :right
  attr_reader :hash
  def initialize key, val
    @hash = Hash.new
    @hash.store key, val
  end
end

class BST
  def initialize
    @root = Node.new
  end
end

a = Node.new :ruby, 1
b = Node.new :python, 3
a.left = b
p a.left.hash
