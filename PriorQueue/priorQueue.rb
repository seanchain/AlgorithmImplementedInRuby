#! /usr/bin/ruby

#使用堆来实现优先队列
#使用一个长度为n+1的私有数组pq[]来表示一个大小为n的堆,pq[0]不用


class Heap
  attr_reader :pq, :n
  def initialize arr
    @pq = arr
    @n = @pq.size
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
    pq[@n] = v
    print pq
    self.swim(@n - 1)
  end
  def delMax
    max = pq[0]
    pq[0], pq[@n] = pq[@n], pq[0]
    @n -= 1
    pq[@n] = nil
    sink 1
    return max
  end

end

heap = Heap.new [2, 3, 5, 6, 8, 4]
heap.insert 1
p heap.pq
