--Button Class
--Class for UI buttons. Should allow for easy placement and management
--of buttons. There selection checks should be made in regards to their relative placements.
--Date: 01/09/2016
--Author: Johann S. R. Eckman

local Button = {}

Button.x_pos = nil
Button.y_pos = nil
Button.width = nil
Button.height = nil
Button.color_r = nil
Button.color_g = nil
Button.color_g = nil
Button.text = nil
Button.is_selected = false
Button.action = nil

function Button:new( o )
	o = o or {}
	setmetatable( o, self )
	self.__index = self
	return o
end

function Button:initialize( x, y, width, height, text )
	self.x_pos = x
	self.y_pos = y
	self.width = width
	self.height = height
	self.color_r = 193
	self.color_g = 163
	self.color_b = 30 
	self.text = text
end

function Button:draw_entity()
	if self.is_selected == false then
		love.graphics.setColor( self.color_r, self.color_g, self.color_b )
	else
		love.graphics.setColor( 255, 255, 255 )
	end
	love.graphics.rectangle( "fill", self.x_pos, self.y_pos, self.width, self.height )
	love.graphics.setColor( 255, 255, 255 )
	love.graphics.print( self.text, self.x_pos + self.width / 10, self.y_pos + self.height / 2.5 )
end

function Button:check_selection( x, y, button  )
	--check x range(if it is in the grid)
	if x > self.x_pos and x < self.x_pos + self.width then
		--check y range(if it is in the grid)
		if y > self.y_pos and y < self.y_pos + self.height then
			if button == 1 then 
				self.is_selected = true
				self.action()
			end
			--do button action
		end
	end
end

return Button