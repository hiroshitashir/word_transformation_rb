class State
	attr_reader :word
	include Comparable
	
	@@dict = nil
	def initialize(wd)
		@word = wd
	end
	
	def self.setDict(arg)
		@@dict = arg
	end
	
	def getSuccessors()
		successors = []
		len_word = @word.length
		@@dict[len_word].each do |target_word|
			num_diff = 0
			for i in 0...len_word
				if target_word[i] != @word[i]
					num_diff += 1
				end
				
				if num_diff >= 2
					break
				end
			end
			
			if num_diff == 1
				successors.push(State.new(target_word))
			end
		end
		return successors
	end
	
	def to_s()
		return "#{@word}"
	end
	
	def ==(another_state)
		return @word == another_state.word
	end
end
