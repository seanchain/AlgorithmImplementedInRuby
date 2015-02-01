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
	def shellSort num
		n, h = num.size, 1
		h = 3 * h + 1 while h < n/3
		while h >= 1
			(h...n).each do |i|
				j = i
				while num[j] < num[j - h] && j >= h
					num[j], num[j - h] = num[j - h], num[j]
					j -= h
				end
			end
		h /= 3
    	end    
	end

    module_function :selSort, :bubbleSort, :insertSort, :shellSort

end

