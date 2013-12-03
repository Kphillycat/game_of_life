class Cell
	attr_accessor :world, :x, :y

	def initialize(world,x=0,y=0)
		@world = world
		@x = x
		@y = y
		world.cells << self
	end

	def die!
		world.cells -= [self] #removes the current cell from that array
	end

	def dead?
		!world.cells.include? self
	end

	def alive?
		world.cells.include? self
	end
	
	def neighbors
		@neighbors = [] #add neighbors to array when we find them
		world.cells.each do |cell|
			#cell to the north
			if self.x == cell.x && self.y == cell.y - 1 #check one cell lower
				@neighbors << cell
			end
			#cell to northeast
			if self.x == cell.x - 1 && self.y == cell.y - 1
				@neighbors << cell
			end
			#cell to the east
			if self.x == cell.x - 1 && self.y == cell.y
				@neighbors << cell
			end
			#cell to the southeast
			if self.x == cell.x - 1 && self.y == cell.y + 1
			 	@neighbors << cell
			end
			#cell to the south
			if self.x == cell.x && self.y == cell.y + 1
			 	@neighbors << cell
			end 
			#cell to southwest
			if self.x == cell.x + 1 && self.y == cell.y + 1
			 	@neighbors << cell
			end 
			#cell to the west
			if self.x == cell.x + 1 && self.y == cell.y
				@neighbors << cell
			end
			#cell to the northwest
			if self.x == cell.x + 1 && self.y == cell.y - 1
				@neighbors << cell
			end
			
		end
		@neighbors
	end

	def spawn_at(x,y)
		Cell.new(world,x,y)
	end
end