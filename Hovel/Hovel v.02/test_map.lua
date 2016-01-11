--Test Map Class
--Date: 01/08/2016
--Author: Johann S. R. Eckman

Tile = require("tile")

local Test_Map = {}

Test_Map.x_size = nil
Test_Map.y_size = nil

function Test_Map:new( o )
	o = o or {}
	setmetatable( o, self )
	self.__index = self
	return o
end

function Test_Map:initialize( x_size, y_size )
	self.x_size = x_size
	self.y_size = y_size

	for i = 1, x_size do
		self[i] = {}
		for j = 1, y_size do
			self[i][j] = 0
		end
	end

	setup_map( x_size, y_size, self )
end

function setup_map( x, y, matrix )
	for i = 1, x do
		for j = 1, 5 do
			matrix[i][j] = Tile:new{}
			matrix[i][j]:initialize( "Dirt" )
		end
	end

	for i = 1, x do
		for j = 6, 13 do
			matrix[i][j] = Tile:new{}
			matrix[i][j]:initialize( "Grass" )
		end
	end

	for i = 1, x do
		for j = 14, 20 do
			matrix[i][j] = Tile:new{}
			matrix[i][j]:initialize( "Water" )
		end
	end

	for i = 1, x do
		for j = 21, 30 do
			matrix[i][j] = Tile:new{}
			matrix[i][j]:initialize( "Grass" )
		end
	end

	for i = 1, x do
		for j = 31, 32 do
			matrix[i][j] = Tile:new{}
			matrix[i][j]:initialize( "Dirt" )
		end
	end
end

return Test_Map