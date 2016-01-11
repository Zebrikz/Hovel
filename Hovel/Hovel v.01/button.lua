--Button Class
--Date: 01/07/2016
--Author: Johann S. R. Eckman

local Button = {}


function Button.initialize( x_pos, y_pos, width, height, text, font_size )
	local button = {}
	button.x_pos = x_pos
	button.y_pos = y_pos
	button.width = width
	button.height = height
	button.text = text
	button.action = nil
	button.font_size = font_size
	button.is_visible = false
	button.is_pressed = false
	button.time_pressed = 0
	button.color_r = 255
	button.color_g = 169
	button.color_b = 3
	button.reaction = nil

	--check if a button has been pressed
	function button.check_button_select( x, y )
		if (x > button.x_pos) and (x < button.width + button.x_pos) and 
			(y > button.y_pos) and (y < button.height + button.y_pos) then
			return true
		else
			return false
		end
	end

	--draw the button
	function button.draw_button()
		if button.is_visible == true then
			love.graphics.setColor( button.color_r, button.color_g, button.color_b )
			love.graphics.rectangle("fill", button.x_pos, button.y_pos, button.width, button.height)
			love.graphics.setColor( 0, 0, 0 )
			love.graphics.setFont( button.font_size )
			love.graphics.print( button.text, button.x_pos + button.width / 10, button.y_pos + button.height / 3  )
		end
	end
	
	return button
end

return Button
