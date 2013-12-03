require_relative './cell'
require_relative './world'

da_world = World.new

da_world.board[5][5].alive = true
da_world.board[6][5].alive = true
da_world.board[4][5].alive = true
#Blinker
# da_world.board[7][5].alive = true
# da_world.board[6][4].alive = true

10.times do |x|
	puts "World #{x+1}"
	da_world.display
	da_world.tick!
	sleep(0.5)
end