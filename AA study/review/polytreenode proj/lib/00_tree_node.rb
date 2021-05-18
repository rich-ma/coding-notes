class PolyTreeNode

	def initialize(node)
		@value = node
		@parent = nil
		@children = []
	end

	def value
		@value
	end

	def parent
		@parent
	end

	def children
		@children
	end

	def parent=(node)
		unless @parent.nil?
			remove_child(node, self)
		end
		@parent = node
		if node
			node.add_child(self)
		end
	end

	def remove_child(node, child)
		children = node.children
		i = children.index(child)
		node.children = children.slice(0,i).concat(children.slice(i+1..-1))
	end

	def children=(node)
		@children = node
	end

	def add_child(node)
		unless @children.include?(node)
			@children << node
		end
	end
end

