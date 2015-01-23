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


    module_function :selSort, :bubbleSort, :insertSort
    def shellSort num
    
    end
    
end

num = [1, 4, 3, 6, 14, 7, 5, 2]
Sort.bubbleSort num
p num
