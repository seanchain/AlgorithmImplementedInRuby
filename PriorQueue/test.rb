#! /usr/bin/ruby

require './priorQueue.rb'

heap = Heap.new
heap.insert 'P'
heap.insert 'Q'
heap.insert 'E'
heap.delMax
p heap.pq
heap.insert 'X'
p heap.pq
heap.insert 'A'
heap.insert 'M'
print heap.pq
heap.delMax
heap.insert 'P'
heap.insert 'L'
heap.insert 'E'
print heap.pq
heap.delMax

p heap.pq

