#! /usr/bin/ruby

#使用堆来实现优先队列
#使用一个长度为n+1的私有数组pq[]来表示一个大小为n的堆,pq[0]不用


class Heap
  def initialize
  end
  def less i, j
    return i < j
  end
end
