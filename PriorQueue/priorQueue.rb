#! /usr/bin/ruby

#使用堆来实现优先队列
#使用一个长度为n+1的私有数组pq[]来表示一个大小为n的堆,pq[0]不用


class Heap
  attr_reader :pq, :n
  def initialize
    @pq = [nil]
    @n = 0
  end
  def less i, j
      @pq[i] < @pq[j]
  end
  def swim k
    while k > 1 && less(k/2, k)
      @pq[k/2], @pq[k] = @pq[k], @pq[k/2]
      k /= 2
    end
  end
  def sink k
    while 2*k <= @n
      j = 2*k
      j += 1 if j < @n && less(j, j + 1)
      break if !less(k, j)
      @pq[k], @pq[j] = @pq[j], @pq[k]
      k = j
    end
  end
  def isEmpty
    return @n == 0
  end
  def size
    return @n
  end
  def insert v
    @n += 1
    @pq[@n] = v
    self.swim(@n)
  end
  def delMax
    max = pq[1]
    pq[1], pq[@n] = pq[@n], pq[1]
    @n -= 1
    pq.pop
    sink 1
    return max
  end
end
