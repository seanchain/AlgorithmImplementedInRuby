#! /usr/bin/ruby 

#背包(bag)数据结构的实现
#背包是一种不支持从中删除元素的集合数据类型，目的是为了帮助用例收集元素并对于元素进行迭代遍历，使用bag说明元素的顺序并不重要
#
#通过遍历数字并求得其平均数和方差

num = []
while var = gets
  num.push var.chomp!.to_i   #一次保存输入的数字，并消除其换行符，将其转化为数字
end

sum, sum1 = 0, 0
for i in num
  sum += i
end

average = (Rational sum, num.length).to_f
num.each do |item|
  sum1 += (item - average) ** 2
end

sdev = Math::sqrt(sum1 / (num.length - 1))

printf "Average: %.2f\n", average
printf "Standard dev: %.2f\n", sdev
