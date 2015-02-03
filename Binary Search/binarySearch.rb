#! /usr/bin/ruby 
#
#THe foundation part of the reference book Algorithm
#实现二分查找法



def binarySearch var, ary
  min, max = 0, ary.length - 1
  while min <= max
    mid = min + (max - min) / 2  #首先确定中间数的位置，通过变换中间数的位置来进行查找
    max = mid - 1 if var < ary[mid]  #中间索引所对应的值大于var，则最大索引等于中间索引-1
    min = mid + 1 if var > ary[mid]  #中间索引小于var。则最小索引等于中间数+1
    return mid if var == ary[mid] #相等则返回中间数
  end
  return "此数不存在" #找不到，则返回此数不存在
end


ary = [1, 4, 5, 7, 21, 30, 45]
puts "请输入需要查找的数字"
var = gets.to_i
var = binarySearch var, ary
print "您要找的数字索引为", var, "\n"
