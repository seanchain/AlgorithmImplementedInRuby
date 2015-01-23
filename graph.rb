#! /usr/bin/ruby 


a = {:b => 2, :c => 7}
b = {:a => 4, :c => 1}
c = {:a => 3}
arr = []
arr << a << b << c
p arr
for item in arr
	item.each do |key, val|
		p key, val
	end
end
