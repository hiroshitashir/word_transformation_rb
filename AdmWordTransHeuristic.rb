require_relative 'State.rb'
require "test/unit"

class Heuristic
end

class AdmWordTransHeuristic < Heuristic
	include Test::Unit::Assertions
	
	def initialize(goal_st)
		@goal_state = goal_st
	end
	
	def getHeuristicEstimate(target_state)
		assert_instance_of State, target_state
		
		target_word = target_state.word
		goal_word = @goal_state.word
		
		if target_word.length != goal_word.length
			return infinity
		end
		
		num_diff = 0
		for i in 0...target_word.length
			if target_word[i] != goal_word[i]
				num_diff += 1
			end
		end
		return num_diff
	end
end