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
			remove_child(@parent, self)
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

	def remove_child(node, child)
		children = node.children
		index = children.index(child)
		node.children = children[0...index].concat(children[index+1 .. -1])
	end

end

