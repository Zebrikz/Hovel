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
Villager = require("villager")
Panel = require("panel")

function setup_mainboard()
	GRID_WIDTH = 47
	GRID_HEIGHT = 31

	main_screen = Panel.initialize( 0, 0, 1200, 800, 120, 120, 120 )
	main_screen.is_visible = true
	main_screen.is_focused = true

	return main_screen
end

function setup_bottom_hud()
	bottom_screen = Panel.initialize(0, 800, 1200, 200, 70, 70, 70 )
	bottom_screen.is_visible = true
	bottom_screen.is_focused = true

	return bottom_screen
end

function game_state_init()
	--x,y coords for printing debug on where the mouse pressed
	printx = 0
	printy = 0
	--x,y coords for selection box
	select_box_x = 0
	select_box_y = 0

	small_font = love.graphics.newFont(8)
	medium_font = love.graphics.newFont(12)

	is_mainscreen_focused = true
	is_villagerlist_focused = false

	-- setup initial village
	test_village = Village.initialize( "Test Village")

	--initialize villagers
	villager_list = {}
	villager_list.x_pos = 605
	villager_list.y_pos = 200
	villager_list.width = 150
	villager_list.height = 400
	villager_list[1] = Villager.initialize( "Chad", 6 )
	villager_list[2] = Villager.initialize( "Brad", 5 )
	villager_list[3] = Villager.initialize( "Karl", 5 )
	test_village.population = 3
end

function love.load()
	--set the size of the window to 1200 by 1000
	love.window.setMode( 1200, 1000)

	love.window.setTitle( "Hovel v0.01" )

	panels = {}
	panels.size = 2
	panels[1] = setup_mainboard()
	panels[2] = setup_bottom_hud()

	game_state_init()

	--build matrix of size 48x32 representing the grids
	main_cells = Cell_Matrix.initialize()

	--build the test map tiles
	main_cells.build_test_map()

	--set the initial selected tile on the mainboard
	selected_tile =  main_cells[0][0]

	--list of buttons
	setup_buttons()

	--setup the button actions
	setup_button_actions()
end

function setup_buttons()
	--list of buttons
	buttons = {}
	buttons.size = 3
	buttons[0] = Button.initialize( 500, 830, 100, 25, "Test Button", medium_font )
	buttons[1] = Button.initialize( 650, 830, 100, 25, "Test2 Button", medium_font )
	buttons[2] = Button.initialize( 1050, 830, 100, 100, "Turn Button", medium_font )
	buttons[2].is_visible = true
	buttons[3] = Button.initialize( 500, 830, 100, 25, "Test3 Button", medium_font )
end

function setup_button_actions()
	--button actions
	buttons[0].action = function()
		test_village.wealth = test_village.wealth + 1
	end

	buttons[1].action = function()
		test_village.wealth = test_village.wealth - 1
	end

	buttons[2].action = function()
		test_village.week = test_village.week + 1
		if test_village.week > 4 then
			test_village.month = test_village.month + 1
			test_village.week = 1
		end
		if test_village.month > 12 then
			test_village.year = test_village.year + 1
			test_village.month = 1
		end
	end

	buttons[3].action = function()
		test_village.food = test_village.food + 1
	end
end

function love.update(dt)
	check_buttons(dt)
end

function check_buttons(dt)
	for i=0, buttons.size do
		if buttons[i].is_pressed == true and buttons[i].time_pressed == 0 then
			buttons[i].action()
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
	--draws the panels
	for i=1, panels.size do
		panels[i].draw_panel()
	end 

	--draw the main gameboard
	main_cells.draw_board( GRID_WIDTH, GRID_HEIGHT )

	--draw the bottom interface
	draw_hud()

	--draw buttons
	for i = 0, buttons.size do
		buttons[i].draw_button()
	end
end

function draw_hud()
	love.graphics.setFont( love.graphics.newFont(12) )
	--draw the x,y debug information at the bottom of the window
	love.graphics.setColor( 255, 255, 255 )
	love.graphics.print("x " .. printx .. " y " .. printy, 600, 900 )

	--draw selection box
	love.graphics.setColor( 255, 255, 255, 100 )
	love.graphics.rectangle( "fill", select_box_x, select_box_y, 25, 25 )

	draw_selected_tile()
	draw_village_stats()
	draw_date()
end

function draw_date()
	love.graphics.setFont( love.graphics.newFont(12) )
	love.graphics.print( "W:" ..test_village.week, 1050, 930 )
	love.graphics.print( "M:" ..test_village.month, 1075, 930 )
	love.graphics.print( "Y:" ..test_village.year, 1105, 930 )
end

function draw_village_stats()
	love.graphics.setFont( love.graphics.newFont(12) )
	love.graphics.setColor( 255, 255, 255 )
	love.graphics.print( "Village: " .. test_village.name, 500, 970 )
	love.graphics.print( "Pop: " ..test_village.population, 650, 970 )
	love.graphics.print( "Wealth: " ..test_village.wealth, 725, 970 )
	love.graphics.print( "Resources: ", 850, 970 )
	love.graphics.print( "W-" ..test_village.wood, 925, 970 )
	love.graphics.print( "S-" ..test_village.stone, 975, 970 )
	love.graphics.print( "F-" ..test_village.food, 1025, 970 )
end

function draw_selected_tile()
	love.graphics.setFont( love.graphics.newFont(12) )
	--draw the terrain of the selected tile
	love.graphics.setColor( selected_tile.terrain.color_r, selected_tile.terrain.color_g, selected_tile.terrain.color_b ) 
	love.graphics.rectangle( "fill", 25, 825, 150, 150 )

	if selected_tile.has_building == true then
		--draw a house over the terrain image and print the building info next to the image
		love.graphics.draw( selected_tile.building.big_image, 25, 825 )
		love.graphics.setColor( 255, 255, 255 )
		love.graphics.print( selected_tile.building.type, 185, 830 )
		love.graphics.print( "This is hovel that houses 1 resident", 185, 850)
		buttons[0].is_visible = true
		buttons[1].is_visible = false
		buttons[3].is_visible = false
	elseif selected_tile.has_resource == true then
		--draw a resource over the terrain image and print the resource description next to the image
		love.graphics.setColor( 255, 255, 255 )
		love.graphics.print( selected_tile.resource.type, 185, 830 )
		love.graphics.print( selected_tile.resource.description, 185, 850 )
		buttons[0].is_visible = false
		buttons[1].is_visible = true
		buttons[3].is_visible = true
	else
		--print the terrain info next to the selected tile image
		love.graphics.setColor( 255, 255, 255 )
		love.graphics.print( selected_tile.terrain.type, 185, 830 )
		love.graphics.print( selected_tile.terrain.description, 185, 850 )
		buttons[0].is_visible = false
		buttons[1].is_visible = false
		buttons[3].is_visible = false
	end
end

function grid_select( x, y )
	printx = math.floor( x / 25 )
	printy = math.floor( y / 25 )

	selected_tile = main_cells[printx][printy]

	--select the grid the mouse was pressed at
	select_box_x = printx * 25
	select_box_y = printy * 25
end

function button_select( x , y )
	for i=0, buttons.size do
		if buttons[i].check_button_select( x, y ) == true and buttons[i].is_visible then
			buttons[i].is_pressed = true
			buttons[i].color_r = 200
			buttons[i].color_g = 200
			buttons[i].color_b = 200
		end
	end
end

function love.mousepressed( x, y, button )
	if button == 1 then
		if is_mainscreen_focused == true then
			if x <= 1200 and y <= 795 then
				grid_select( x, y )
			else
				button_select( x, y )
			end
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