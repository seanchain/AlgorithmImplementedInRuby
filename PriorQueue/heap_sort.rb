#! /usr/bin/ruby

require "./priorQueue.rb"
h = Heap.new
arr = [3, 4, 5, 6, 1, 2, 14, 7]
arr.each do |elem|
  h.insert elem
end

arr = []

while true
  a = h.delMax
  break if a == nil
  arr.push a
end

arr.reverse!

print arr, "\n"
