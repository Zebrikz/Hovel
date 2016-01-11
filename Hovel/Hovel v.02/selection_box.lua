--Selection_Box Class
--Selection Box that appears on the gameboard grid when a certain box
--has been left clicked.
--Date: 01/08/2016
--Author: Johann S. R. Eckman

local Selection_Box = {}

Selection_Box.x_pos = nil
Selection_Box.y_pos = nil
Selection_Box.width = nil
Selection_Box.height = nil
Selection_Box.grid_x = nil
Selection_Box.grid_y = nil
Selection_Box.is_selected = false

function Selection_Box:new( o )
	o = o or {}
	setmetatable( o, self )
	self.__index = self
	return o
end

function Selection_Box:initialize( x, y, width, height, grid_x, grid_y )
	self.x_pos = x
	self.y_pos = y
	self.width = width
	self.height = height
	self.grid_x = grid_x
	self.grid_y = grid_y
end

function Selection_Box:draw_entity()
		love.graphics.setColor( 255, 0, 0, 75 )
		love.graphics.rectangle( "fill", self.x_pos, self.y_pos, self.width, self.height )
end

--TODO. selection check 
function Selection_Box:check_selection( x, y, button )
	--check x range(if it is in the grid)
	if x > 0 and x < self.grid_x then
		--check y range(if it is in the grid)
		if y > 0 and y < self.grid_y then 
			if button == 1 or button == 2 then 
				self.x_pos = math.floor( x / 25 ) * 25
				self.y_pos = math.floor( y / 25 ) * 25
				selected_x = self.x_pos / 25 
				selected_y = self.y_pos / 25
			end

			if button == 2 then
				ui_manager.panels[3].is_visible = true
				ui_manager.panels[3].is_focused = true
				ui_manager.panels[1].is_focused = false
			end

			return true
		end
	end
	return false
end

return Selection_Box