--Second varaition on Hovel utilizing a modular design.
--main.lua contains the love2D faciilities that launch into other managers handling 
--the functionality and ui in other files.
--The game is broken up into three layers; application, ui, and game.
--This top level is simply the love2D engine functionality. 
--Version 0.02
--Date: 01/08/2016
--Author: Johann S. R. Eckman


--required classes
UI_Manager = require("UI_Manager")
Input_Interprator = require("input_interprator")

--


--initialize the various managers and setup the game window
--The main game window will be handled in this file.
function love.load()
	--setup the winddow here
	love.window.setMode( 1200, 1000 )
	love.window.setTitle( "Hovel v0.02")

	selected_x = 1
	selected_y = 1

	--initialize appliaction manager/loading up resources
	--initialize game manager/loading up initial game state
	
	--initialize ui manager/load up the initial game view
	ui_manager = UI_Manager:new{}
	ui_manager:initialize()

	--initialize the input interprator
	interprator = Input_Interprator:new{}
	interprator:initialize( ui_manager )

	debug_x = 0
	debug_y = 0
end

--what happens in update? what changes during the game?
--since the game is turn based state doesn't really change over time unless
--triggered by an action through a button
function love.update(dt)

end
--ui mananger will handle the drawing
function love.draw()
	ui_manager:draw()
	love.graphics.setColor( 255, 255, 255 )
	love.graphics.print( debug_x.. " , " ..debug_y, 600, 900 )
end

--this function will be handed off to an input interprator
function love.mousepressed( x, y, button )
	debug_x = x
	debug_y = y
	interprator:mouse_pressed( x, y, button )
end

--this function will be handed off to an input interprator
function love.mousereleased( x, y, button )
	interprator:mouse_released( x, y, button )
end

--this function will be handed off to an input interprator
function love.keypressed( key )
end

--this function will be handed off to an input interprator
function love.keyreleased( key )
end

--ui manager will handle the focusing
--possibly just handle it in this file
function love.focus( f )
end

--quiting, possibily saving state
function love.quit()
end	