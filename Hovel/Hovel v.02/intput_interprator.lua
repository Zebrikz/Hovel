--Input_Interprator Class
--Handles inputs and their respective actions
--Date: 01/08/2016
--Author: Johann S. R. Eckman

local Input_Interprator = {}

Input_Interprator.ui_manager = nil

function Input_Interprator:new( o )
	o = o or {}
	setmetatable( o, self )
	self.__index( self )
	return o
end

function Input_Interprator:initialize( ui_manager )
	self.ui_manager = ui_manager
end

function Input_Interprator:mouse_pressed( x, y, button )
	--left click will always be some sort of selection
	if button == 1 then
		--loop through ui managers panels
		for i = 1, 2 do
			if self.ui_manager.panels[i].is_focused then
				for j = 1, self.ui_manager.panels[i].num_entities do
					self.ui_manager.panels[i].entities[j]:check_selection( x, y )
				end
			end
		end
	end

	--right click will always be some sort of cancel
	if button = 2 then
		--do stuff
	do
end

function Input_Interprator:mouse_released()
end

function Input_Interprator:key_pressed()
end

function Input_Interprator:key_released()
end

return Input_Interprator