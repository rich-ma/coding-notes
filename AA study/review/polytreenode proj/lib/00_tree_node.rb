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
		@parent = node
	end

	def children=(node)
		
	end
end

