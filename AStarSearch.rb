require 'algorithms'
require_relative 'Node.rb'

class AStarSearch
	
	def searchPath(start_state, goal_state, h)
		# lower numbers get higher priority
		lam = lambda { |x, y|
			#puts "inside lambda x:#{x} y:#{y}"
			(y <=> x) == 1
		}
		queue = Containers::PriorityQueue.new(&lam)
		queue.push(Node.new(start_state, 0, h), 1)
		
		tmp_node = nil
		flag_found = false
		
		while !queue.empty? and flag_found == false
			tmp_node = queue.pop
			
			if tmp_node.state == goal_state
				flag_found = true
			else
				succ_nodes = tmp_node.get_successors()
				succ_nodes.each do |node|
					queue.push(node, node.get_fn())
				end
			end
		end
		
		result = []
		if flag_found
			puts "Found a solution"
			
			while !tmp_node.isRootNode()
				result.unshift(tmp_node.state)
				tmp_node = tmp_node.parent_node
			end
			result.unshift(start_state)
		else
			puts "Solution not found"
		end
		return result
	end
end