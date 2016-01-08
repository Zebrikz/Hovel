--Hovel is a world building game that follows a medevial setting where the player starts with one villager and
--a single building, their hovel. From there, the player can advance their village by building more residences
--allowing for villagers to come. The game allows the player to have creative freedom by giving them control
--of any villager's actions, enabling them to create a story they wish to see. There is no true objective
--in hovel, only to provide the player with a setting that they can enjoy by coming up with their own goals.

--Hovel v0.01
--Date: 01/07/2016
--Author: Johann S. R. Eckman

require("tile_sets")
Cell_Matrix = require("cell_matrix")
Village = require("village")
Button = require("button")

function love.load()
	--x,y coords for printing debug on where the mouse pressed
	printx = 0
	printy = 0
	--x,y coords for selection box
	select_box_x = 0
	select_box_y = 0

	GRID_WIDTH = 47
	GRID_HEIGHT = 31

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

	--build matrix of size 48x32 representing the grids
	main_cells = Cell_Matrix.initialize()

	--build the test map tiles
	main_cells.build_test_map()

	--list of buttons
	buttons = {}
	buttons[0] = Button.initalize( 500, 830, 100, 25, "Test Button" )
	buttons[1] = Button.initalize( 650, 830, 100, 25, "Test2 Button" )

	selected_tile =  main_cells[0][0]

	--setup initial village
	test_village = Village.initialize( "Test Village")
end

function love.update(dt)
	check_buttons(dt)
end

function check_buttons(dt)
	for i=0, 1 do
		if buttons[i].is_pressed == true and buttons[i].time_pressed == 0 then
			--do something
			buttons[i].time_pressed = buttons[i].time_pressed + dt
		elseif buttons[i].is_pressed == true and buttons[i].time_pressed > 0.1 then
			buttons[i].is_pressed = false
			buttons[i].time_pressed = 0 
			buttons[i].color_r = 255
			buttons[i].color_g = 169
			buttons[i].color_b = 3
		elseif buttons[i].is_pressed == true and buttons[i].time_pressed > 0  and buttons[i].time_pressed < 0.5 then
			buttons[i].time_pressed = buttons[i].time_pressed + dt
		end
	end
end

function love.draw()
	--draws the intial canvas
	love.graphics.draw( my_canvas )

	--draw tiles
	for i = 0, GRID_WIDTH do
		for j = 0, GRID_HEIGHT do
			love.graphics.setColor( main_cells[i][j].terrain.color_r, main_cells[i][j].terrain.color_g, main_cells[i][j].terrain.color_b )
			love.graphics.rectangle( "fill", main_cells[i][j].x * 25, main_cells[i][j].y * 25, 25, 25)
		end
	end

	--draw buildings and resources
	for i = 0, GRID_WIDTH do
		for j = 0, GRID_HEIGHT do
			if main_cells[i][j].has_building then
				love.graphics.draw( main_cells[i][j].building.image, i * 25, j * 25 )
			end
			if main_cells[i][j].has_resource then
				love.graphics.draw( main_cells[i][j].resource.image, i * 25, j * 25 )
			end
		end
	end

	love.graphics.setColor( 255, 255, 255 )
	--set up the grid
	for i=25, 800, 25 do
		love.graphics.line( 0, i, 1200, i )
	end
	for i=25, 1200, 25 do 
		love.graphics.line(i, 0, i, 800)
	end

	--draw the x,y debug information at the bottom of the window
	love.graphics.setColor( 255, 255, 255 )
	love.graphics.print("x " .. printx .. " y " .. printy, 600, 900 )

	--draw selection box
	love.graphics.setColor( 255, 0, 0, 100 )
	love.graphics.rectangle( "fill", select_box_x, select_box_y, 25, 25 )

	--draw the selected tile
	love.graphics.setColor( selected_tile.terrain.color_r, selected_tile.terrain.color_g, selected_tile.terrain.color_b ) 
	love.graphics.rectangle( "fill", 25, 825, 150, 150 )

	if selected_tile.has_building == true then
		--draw a house over the terrain image and print the building info next to the image
		love.graphics.draw( selected_tile.building.big_image, 25, 825 )
		love.graphics.setColor( 255, 255, 255 )
		love.graphics.print( selected_tile.building.type, 185, 830 )
		love.graphics.print( "This is hovel that houses 1 resident", 185, 850)
	elseif selected_tile.has_resource == true then
		--draw a resource over the terrain image and print the resource description next to the image
		love.graphics.setColor( 255, 255, 255 )
		love.graphics.print( selected_tile.resource.type, 185, 830 )
		love.graphics.print( selected_tile.resource.description, 185, 850 )
	else
		--print the terrain info next to the selected tile image
		love.graphics.setColor( 255, 255, 255 )
		love.graphics.print( selected_tile.terrain.type, 185, 830 )
		love.graphics.print( selected_tile.terrain.description, 185, 850 )
	end

	--draw buttons
	for i = 0, 1 do
		love.graphics.setColor( buttons[i].color_r, buttons[i].color_g, buttons[i].color_b )
		love.graphics.rectangle("fill", buttons[i].x_pos, buttons[i].y_pos, buttons[i]. width, buttons[i].height)
		buttons[i].is_visible = true
	end

	--print village information
	love.graphics.setColor( 255, 255, 255 )
	love.graphics.print( "Village: " .. test_village.name, 500, 970 )
	love.graphics.print( "Pop: " ..test_village.population, 650, 970 )
	love.graphics.print( "Wealth: " ..test_village.wealth, 725, 970 )
	love.graphics.print( "Resources: ", 850, 970 )
	love.graphics.print( "W-" ..test_village.wood, 925, 970 )
	love.graphics.print( "S-" ..test_village.stone, 975, 970 )
	love.graphics.print( "F-" ..test_village.food, 1025, 970 )
end

function love.mousepressed(x, y, button)
	--Debug print to find the  coordinates of the mouse press
	if button == 1 and x <= 1200 and y <= 800 then
		printx = math.floor( x / 25 )
		printy = math.floor( y / 25 )

		selected_tile = main_cells[printx][printy]

		--select the grid the mouse was pressed at
		select_box_x = printx * 25
		select_box_y = printy * 25
	elseif button == 1 and x <= 1200 and y > 800 then
		for i = 0, 1 do
			if buttons[i].is_visible == true then
				if x > buttons[i].x_pos and x < buttons[i].width + buttons[i].x_pos and y > buttons[i].y_pos and y < buttons[i].height + buttons[i].y_pos then
					buttons[i].is_pressed = true
					buttons[i].color_r = 200
					buttons[i].color_g = 200
					buttons[i].color_b = 200
				end
			end
		end
	end

	if button == 2 then
		for i = 0, 1 do
			buttons[i].color_r = 255
			buttons[i].color_g = 169
			buttons[i].color_b = 3
		end
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