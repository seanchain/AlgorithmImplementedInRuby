#! /usr/bin/ruby 
#
require './sort.rb'
ary1 = [2, 3, 1, 5, 4, 12, 7, 9]
ary2 = [3, 2, 5, 6, 1, 14, 7, 9]
ary3 = [2, 3, 1, 5, 4, 6, 7, 9]

Sort.bubbleSort ary1
Sort.shellSort ary2
Sort.mergeSort ary3, 0, ary3.size - 1 
p ary1
p ary2
p ary3
p ary2.shuffle!
