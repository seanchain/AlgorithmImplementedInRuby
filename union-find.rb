#! /usr/bin/ruby 

#Implementation of union-find algorithms
#Designed API
#class UF N 以整数标识初始化的N个触点
#def union p, q 在p和q之间加上一条连接
#def find p p所在分量的标识符
#def connected p, q 查看p和q是否存在于同一分量
#def count 联通分量的数量
#
class UF
	attr_reader :id
	def initialize n
		@count, @id = n, []
		(0...n).each {|i| @id.push i}
	end

	def count
		return @count
	end
	def connected p, q
		return (find(p) == find(q))
	end
	def find p
		return @id[p]
	end
	def union p, q
		pID, qID = find(p), find(q)
		return if pID == qID
		(0...@id.size).each do |i|
			id[i] = qID if id[i] == pID
		end
		@count -= 1
	end
end

def getFileNodes filename
	File.open filename, "r" do |file|
		arr = []
		file.each_line do |line|
			arr.push line.chomp!.split(' ').map{|str| str.to_i}
		end
		arr.flatten!.uniq!
		return arr.size
	end
end

n = getFileNodes "tinyUF.txt"

uf = UF.new n
File.open "tinyUF.txt", "r" do |file|
	file.each_line do |line|
		ary = line.chomp!.split(' ').map{|str| str.to_i}
		p, q = ary[0], ary[1]
		next if uf.connected p, q
		uf.union p, q
		printf "%d  %d\n", p, q
	end
end

print uf.count, " components", "\n"


