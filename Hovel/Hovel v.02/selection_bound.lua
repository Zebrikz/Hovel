--Selection Bound Class
--A bounded area where where a selection can be made. If a mouse click comes out
--of this area, some sort of cancellation will occur. The tile panel will lose visibility if
--clicked outside of its bounded area.
--Date: 01/10/2016
--Author: Johann S. R. Eckman

local Selection_Bound = {}

Selection_Bound.x_pos = nil
Selection_Bound.y_pos = nil
Selection_Bound.width = nil
Selection_Bound.height = nil
Selection_Bound.action = nil

function Selection_Bound:new( o )
	o = o or {}
	setmetatable( o, self )
	self.__index = self
	return o
end

function Selection_Bound:initialize( x, y, width, height )
	self.x_pos = x
	self.y_pos = y
	self.width = width
	self.height = height
end

function Selection_Bound:draw_entity()
	--do nothing, as this is simply an invisible boundary
end

function Selection_Bound:check_selection( x, y, button )
	--if outside the boundary, do something
	if button == 1 then 
		if (x < self.x_pos or x > self.x_pos + self.width) or
			(y < self.y_pos or y > self.y_pos + self.height) then
			self.action()
		end
	end
end

return Selection_Bound