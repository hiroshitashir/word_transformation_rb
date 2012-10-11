require_relative 'State.rb'
require_relative 'AdmWordTransHeuristic.rb'
require 'test/unit'

class Node
	include Test::Unit::Assertions
	
	attr_reader :state, :parent_node
	def initialize(st, lev, h, p_node = nil)
		assert_instance_of State, st
		assert h.is_a? Heuristic
		if p_node != nil
			assert_instance_of Node, p_node
		end
		
		@parent_node = p_node
		@state = st
		@g_n = lev
		@heuristic = h
		@successsor_nodes = nil
	end
		
	def isRootNode()
		return @parent_node.nil?
	end
		
	def get_successors()
		if @successsor_nodes == nil
			@successsor_nodes = []
			nodes_path_root = [self]
			tmp_node = self
			while !tmp_node.parent_node.nil?
				nodes_path_root.push(self.parent_node)
				tmp_node = tmp_node.parent_node
			end
			successsor_states = @state.getSuccessors() - nodes_path_root
			successsor_states.uniq!
			successsor_states.each do |st|
				@successsor_nodes.push(Node.new(st, @g_n+1, @heuristic, self))
			end			
		end
		#puts "#{self} -[successors]> #{@successsor_nodes}"
		return @successsor_nodes
	end
	
	def to_s()
		return "Node::#{@state}"
	end
	
	def get_hn()
		return @heuristic.getHeuristicEstimate(@state)
	end
	
	def get_fn() 
		return @g_n + get_hn();
	end
		
end