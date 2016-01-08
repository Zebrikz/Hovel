--Button Class
--Date: 01/07/2016
--Author: Johann S. R. Eckman

local Button = {}


function Button.initalize( x_pos, y_pos, width, height, text )
	local button = {}
	button.x_pos = x_pos
	button.y_pos = y_pos
	button.width = width
	button.height = height
	button.text = text
	button.action = nil
	button.is_visible = false
	button.is_pressed = false
	button.time_pressed = 0
	button.color_r = 255
	button.color_g = 169
	button.color_b = 3
	return button
end

return Button
