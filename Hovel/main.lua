--Hovel is a world building game that follows a medevial setting where the player starts with one villager and
--a single building, their hovel. From there, the player can advance their village by building more residences
--allowing for villagers to come. The game allows the player to have creative freedom by giving them control
--of any villager's actions, enabling them to create a story they wish to see. There is no true objective
--in hovel, only to provide the player with a setting that they can enjoy by coming up with their own goals.

--Hovel v0.01
--Date: 01/07/2016
--Author: Johann S. R. Eckman

function love.load()
	--x,y coords for printing debug on where the mouse pressed
	printx = -1
	printy = -1
	--x,y coords for selection box
	select_box_x = -1
	select_box_y = -1

	selection_x = -1
	selection_y = -1

	--set the size of the window to 1200 by 1000
	love.window.setMode( 1200, 1000)

	love.window.setTitle( "Hovel v0.01" )

	--create a canvas with size 1200, 1000
	my_canvas = love.graphics.newCanvas( 1200, 1000 )

	--Draw text in the center of the canvas
	love.graphics.setCanvas( my_canvas )
		love.graphics.setColor( 255, 255, 255 )
		love.graphics.setBackgroundColor( 120, 120, 120 )
	love.graphics.setCanvas()
end

function love.update(dt)
end

function love.draw()
	--draws the intial canvas
	love.graphics.draw( my_canvas )

	love.graphics.setColor( 255, 255, 255 )
	--set up the grid
	for i=25, 800, 25 do
		love.graphics.line( 0, i, 1200, i )
	end
	for i=25, 1200, 25 do 
		love.graphics.line(i, 0, i, 800)
	end
	love.graphics.print("x " .. printx .. " y " .. printy, 600, 900 )

	--draw selection box
	love.graphics.setColor( 255, 0, 0, 100 )
	love.graphics.rectangle( "fill", select_box_x, select_box_y, 25, 25 )
end

function love.mousepressed(x, y, button)
	--Debug print to find the  coordinates of the mouse press
	if button == 1 then
		printx = math.floor( x / 25 )
		printy = math.floor( y / 25 )

		--selection coords
		selection_x = printx
		selection_y = printy

		--select the grid the mouse was pressed at
		select_box_x = printx * 25
		select_box_y = printy * 25
	end
end

function love.mousereleased( x, y, button)
end

function love.keypressed(key)
end

function love.keyreleased(key)
end

function love.focus(f)
end

function love.quit()
end