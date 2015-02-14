#! /usr/bin/ruby

require './bst.rb'

a = Node.new 5, "Agger"
b = Node.new 1, "Neuer"
c = Node.new 3, "Pique"
d = Node.new 7, "Suarez"
e = Node.new 6, "Xavi"
f = Node.new 4, "Arsenal"
g = Node.new 9, "Torres"
bst = BST.new a
bst.insert b
bst.insert c
bst.insert d
bst.insert e
bst.insert f
bst.insert g
p bst.root.value
p bst.root.right.value
p bst.root.right.left.value
p bst.root.left.value
p bst.root.left.right.value
p bst.root.left.right.right.value
p bst.root.right.right.value
p bst.getVal 7
p bst.getVal 14
p bst.minval
p bst.maxval
p bst.node_count

p bst.leaves
