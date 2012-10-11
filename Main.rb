require_relative 'InputHandler.rb'
require_relative 'AStarSearch.rb'
require_relative 'AdmWordTransHeuristic.rb'


if __FILE__ == $0
	unless ARGV.length == 3
		puts "Usage: Main <State finename> <Begining State> <Ending State>n"
		raise ArgumentError,"Wrong number of arguments passed - #{ARGV}\n"
	end
	
	ih = InputHandler.new(ARGV[0], ARGV[1], ARGV[2])
	alg = AStarSearch.new()
	h = AdmWordTransHeuristic.new(ih.goal_state)
	
	dict = ih.handleFileInput()
	
	puts "dict:\n"
	dict.each do |row|
		puts "#{row}\n"
	end
	puts "\n"
	
	result_path = alg.searchPath(ih.start_state, ih.goal_state, h)
	puts "result: #{result_path}"
	exit
end