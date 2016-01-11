--Panel Class
--An attempt to create a screen ui class used for handling
--objects such as buttons and lists in one class. Hopefully
--a way to manage the window with multiple panels open.
--Date: 01/07/2016
--Author: Johann S. R. Eckman

local Panel = {}

function Panel.initialize( x, y, width, height, color_r, color_g, color_b )
	local panel = {}
	panel.x_pos = x
	panel.y_pos = y
	panel.width = width
	panel.height = height
	panel.color_r = color_r
	panel.color_g = color_g
	panel.color_b = color_b
	panel.is_visible = false
	panel.is_focused = false

	function panel.draw_panel()
		love.graphics.setColor( panel.color_r, panel.color_g, panel.color_b )
		love.graphics.rectangle( "fill", panel.x_pos, panel.y_pos, panel.width, panel.height )
	end

	return panel
end

return Panel
