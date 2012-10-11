require_relative 'State.rb'

class InputHandler
	attr_accessor :start_state, :goal_state
	def initialize(arg_fname, arg_start_st, arg_goal_st)
		@filename = arg_fname
		@start_state = State.new(arg_start_st)
		@goal_state = State.new(arg_goal_st)
	end
	
	def handleFileInput()
		arr = []
		max_line_len = 0
		begin
			file = File.new(@filename, "r")
			while (line = file.gets)
				line = line.gsub(/\r/, "")
				line = line.gsub(/\n/, "")
				if line.length == 0
					next
				end
				if line.length > max_line_len
					max_line_len = line.length
				end
				arr.push(line)
			end
		rescue => err
			puts "Error reading file #{@filename}:\n#{err}"
			err
		ensure
			if !file.nil? and !file.closed?
				file.close
			end
		end
		arr.uniq!
		
		if !checkInputError(arr)
			puts "Start or goal word not found in file."
			puts "Words from #{@filename}: #{arr}"
			puts "Start: #{@start_state}, Goal: #{@goal_state}"
			raise ArgumentError, "\tstart: #{@start_state}\tgoal: #{@goal_state}"
		end
		
		dict = Array.new(max_line_len+1)
		for i in 0...dict.length
			dict[i] = []
		end
		arr.each do |each_word|
			#puts "each_word: #{each_word}, length:#{each_word.length}"
			dict[each_word.length].push(each_word)
		end
		State.setDict(dict)
		return dict
	end
	
	# Private methods
	private
	
	# assuem arg_dict elements are unique
	def checkInputError(arg_dict)
		intersect = arg_dict & [@start_state.word, @goal_state.word] 
		return intersect.length == 2
	end
end