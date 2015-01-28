#! /usr/bin/ruby 

#Implementation of union-find algorithms
#Designed API
#class UF N 以整数标识初始化的N个触点
#def union p, q 在p和q之间加上一条连接
#def find p p所在分量的标识符
#def connected p, q 查看p和q是否存在于同一分量
#def count 联通分量的数量
class UF
	attr_reader :id, :count, :sz #sz表示各个根根节点所对应的分量的大小，及其所在的树德大小
	def initialize n
		@count, @id, @sz = n, [], []
		(0...n).each {|i| @id.push i}
		(0...n).each {|i| @sz.push 1}
	end

	def count
		return @count
	end
	def connected p, q
		#return (find1(p) == find1(q))
		#return (find2(p) == find2(q))
		return (find3(p) == find3(q))
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
			@id[i] = qID if @id[i] == pID  #将p的分量从命名为q的名称
		end
		@count -= 1
	end
=begin
	union1使用的quick-fnd问题有一定的问题因为每一次的union操作都需要进行扫描整个数组,而这样的算法时间复杂度将会达到平方级别，所以应该有算法专门提高union的运算效率.而union2的算法则更像树之间的归并，id[idx]仿佛为点idx的父节点，对于两个将要进行归并的节点，分别找到他们的根节点，对其根节点进行归并，将一树的根节点接于另外一树。最后可以通过观察idx和id[idx]是否相等来判断根节点的个数，从而获得连同分支的数量。
=end
	def find2 p
		p = @id[p] while p != @id[p]
		return p
	end
	def union2 p, q
		pRoot, qRoot = find2(p), find2(q)
		return if pRoot == qRoot  #p,q两点位于同一棵树上
		@id[pRoot] = @id[qRoot]
		@count -= 1
	end

=begin
	find3和union3是在quick-union算法上的优化，通过将较小的树连接到较大的数来劲简化算法的操作，即加权方式的quick-union算法
=end

	def find3 p
		p = @id[p] while p != @id[p] #寻找根节点
		return p #返回根节点
	end
	def union3 p, q
		i, j = find3(p), find3(q)
		return if i == j
		if @sz[i] < @sz[j]
			@id[i] = j
			@sz[j] += @sz[i]
		else	
			@id[j] = i
			@sz[i] += @sz[j]
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
		uf.union3 p, q
		printf "%d  %d\n", p, q
	end
end

print uf.count, " components", "\n"


