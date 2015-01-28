#! /usr/bin/ruby 

#Implementation of union-find algorithms
#Designed API
#class UF N 以整数标识初始化的N个触点
#def union p, q 在p和q之间加上一条连接
#def find p p所在分量的标识符
#def connected p, q 查看p和q是否存在于同一分量
#def count 联通分量的数量
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
		#return (find1(p) == find1(q))
		return (find2(p) == find2(q))
	end
=begin
	unio1和find1使用的是quick-find方法保证当且仅当id[p]等于id[q]的时候p和q是连同的，即在同一连通图中所有的出点在id[]中的值必须全部相同
=end
	def find1 p
		return @id[p]
	end
	def union1 p, q
		pID, qID = find1(p), find1(q)
		return if pID == qID  #如果p和q已经在相同的分量之中则不需要采取任何行动
		(0...@id.size).each do |i|
			id[i] = qID if id[i] == pID  #将p的分量从命名为q的名称
		end
		@count -= 1
	end
=begin
	union1使用的quick-fnd问题有一定的问题因为每一次的union操作都需要进行扫描整个数组,而这样的算法时间复杂度将会达到平方级别，所以应该有算法专门提高union的运算效率.而union2的算法则更像树之间的归并，id[idx]仿佛为点idx的父节点，对于两个将要进行归并的节点，分别找到他们的根节点，对其根节点进行归并，将一树的根节点接于另外一树。
=end
	def find2 p
		p = id[p] while p != id[p]
		return p
	end
	def union2 p, q
		pRoot, qRoot = find2(p), find2(q)
		return if pRoot == qRoot
		id[pRoot] = id[qRoot]
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
		uf.union2 p, q
		printf "%d  %d\n", p, q
	end
end

print uf.count, " components", "\n"


