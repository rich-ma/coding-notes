class PolyTreeNode

	def initialize(node)
		@value = node
		@parent = nil
		@children = []
	end

	#getters
	def value
		@value
	end

	def parent
		@parent
	end

	def children
		@children
	end

	#setters
	def parent=(node)
		if @parent
			@parent.remove_child(self)
		end
		
		@parent = node
		if node
			node.add_child(self) 
		end
	end

	def children=(children)
		@children = children
	end

	def add_child(child)
		unless @children.include?(child)
			@children << child
		end
	end

	def remove_child(child)
		index = @children.index(child)
		@children = @children[0...index].concat(@children[index+1..-1])
	end

end

