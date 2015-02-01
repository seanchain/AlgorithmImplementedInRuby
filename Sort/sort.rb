#! /usr/bin/ruby

module Sort
    def selSort num
        (0...num.length).each do |i| 
            least = i 
            ((i + 1)...num.length).each do |j| 
                least = j if num[j] < num[least] 
                num[i], num[least] = num[least], num[i]
            end
        end
    end
    def bubbleSort num
        (0...num.length).each do |i|
            (num.length - 1).downto(i) do |j|
                num[j], num[j - 1] = num[j - 1], num[j] if num[j - 1] > num[j]
            end
        end    
    end
    def insertSort num
        (1...num.length).each do |i|
            j, curr = i - 1, num[i]
            while j >= 0 && num[j] > curr
                num[j + 1] = num[j]
                j -= 1
            end
            num[j + 1] = curr if j != i - 1
        end
    end
=begin

shell排序的思想是使数组中的任意间隔为h的元素都是有序的。这样的数组被称为h有序数组，即一个h数组就是h个能够互相独立的有序数组编织在一起组成的一个数组

=end
	def shellSort num
		n, h = num.size, 1 #首先给n和h分别赋值为数组的长度和1
		h = 3 * h + 1 while h < n/3 #对于h赋值，使得h在小于n/3的情况下分别应该首先使用多少步长的排序方式
		while h >= 1 #h >= 1时，排序继续 
			(h...n).each do |i| #从h到n开始遍历
				j = i
				while num[j] < num[j - h] && j >= h #如果满足在j位置的元素比j - h 位置的小，则二者交换位置，并需要使得j满足大于h
					num[j], num[j - h] = num[j - h], num[j]#交换
					j -= h #j的值-h
				end
			end
		h /= 3 #步长改变
        end 
	end
    module_function :selSort, :bubbleSort, :insertSort, :shellSort
end
