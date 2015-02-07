#! /usr/bin/ruby 
#
require './sort.rb'
include Sort

ary1 = [2, 3, 1, 5, 4, 12, 7, 9]
ary2 = [3, 2, 5, 6, 1, 14, 7, 9]
ary3 = [2, 3, 1, 5, 4, 6, 7, 9]

bubbleSort ary1
shellSort ary2
mergeSort ary3, 0, ary3.size - 1 
p ary1
p ary2
p ary3
ary4 = ary3.shuffle
quickSort ary1
p ary1
