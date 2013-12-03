require_relative './cell'
require 'debugger'

class World
	#keeps track of new cells
	attr_accessor :cells, :board

	def initialize	
		@rows = 10
		@columns = 10
		@cells = [] 
		build_board
	end

	def build_board
		@board = []
		@rows.times do |x|
			@board << []
			@columns.times do |y|
				@board[x] << Cell.new(self, x, y)
				@board[x][y].alive = false
			end
		end
	end

	def display
		@board.each do |row|
			row.each do |value|
				print value.alive? ? " * " : " . "
			end
			puts
		end
		puts
	end


	def tick! #cells should be processed through rules
		cells.each do |cell|
			if cell.neighbors.count < 2 #Rule 1. 
				cell.die!
			end
			
			if cell.neighbors.count > 3 #Rule 3
				cell.die!
			end

			if cell.dead? && cell.neighbors.count == 3 #Rule 4
				cell.born!
			end
		end
	end

end
