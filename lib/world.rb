class World
	#keeps track of new cells
	attr_accessor :cells

	def initialize
		@cells = []
	end

	def tick! #cells should be processed through rules
		cells.each do |cell|
			if cell.neighbors.count < 2 #Rule 1. 
				cell.die!
			end
		end
	end
end