require 'spec_helper'
require_relative '../lib/cell'
require_relative '../lib/world'

describe "Game of life" do 
	let(:world) {World.new}
	context "cell utility methods" do
		
		subject {Cell.new(world)}
		
		it "spawn relative to" do
			cell = subject.spawn_at(3,5)
			cell.is_a? Cell
			expect(cell.x).to eq(3)
			expect(cell.y).to eq(5)
			expect(cell.world).to eq(subject.world) #regression test
		end

		it "detects a neighbor to the north" do
			cell = subject.spawn_at(0,1) #create new cell just one above
			expect(subject.neighbors.count).to eq(1)
		end

		it "detects a neighbor to the north east" do
			cell = subject.spawn_at(1,1) #create new cell up and to right
			expect(subject.neighbors.count).to eq(1)
		end

		it "detects a neighbor to the west" do
			cell = subject.spawn_at(-1,0) #create new left
			expect(subject.neighbors.count).to eq(1)
		end

		it "detects a neighbor to the east" do
			cell = subject.spawn_at(1,0) #create new cell to right
			expect(subject.neighbors.count).to eq(1)
		end

		it "detects a neighbor to the southeast" do
			cell = subject.spawn_at(1,-1) #create new cell to right and down
			expect(subject.neighbors.count).to eq(1)
		end

		it "detects a neighbor to the south" do
			cell = subject.spawn_at(0,-1) #create new cell right below
			expect(subject.neighbors.count).to eq(1)
		end

		it "detects a neighbor to the southwest" do
			cell = subject.spawn_at(-1,-1) #create new cell below to left
			expect(subject.neighbors.count).to eq(1)
		end

		it "detects a neighbor to the northwest" do
			cell = subject.spawn_at(-1,1) #create new cell up to to left
			expect(subject.neighbors.count).to eq(1)
		end

		it "dies" do
			subject.die!
			expect(subject.world.cells).to_not include(subject)
		end
	end

	it "Rule 1: Any live cell with fewer than two live neighbours dies, as if caused by under-population." do
		test_cell = Cell.new(world)
		nu_cell = test_cell.spawn_at(2,0)
		world.tick! #worlds goes through move, cell should be dead
		expect(test_cell).to be_dead
	end

	it "Rule 2: Any live cell with two or three live neighbours lives on to the next generation." do
		test_cell = Cell.new(world)
		nu_cell = test_cell.spawn_at(1,0)
		nu_nu_cell = test_cell.spawn_at(-1,0)
		world.tick!
		expect(test_cell).to be_alive
	end
end