--UI_Manager Class
--Handles the UI, splitting the game view up into panels. Also handles the Input Interprator
--which deals with taking the input(mostly mousepresses) and associating them with the ui.
--Date: 01/08/2016
--Author: Johann S. R. Eckman

Panel = require("panel")
Game_Board = require("game_board")
Test_Map = require("test_map")
Bottom_UI = require("bottom_ui")
Tile_Panel = require("tile_panel")

local UI_Manager = {}


UI_Manager.panels = {}
UI_Manager.num_panels = 0

--UI Manager constructor
function UI_Manager:new( o )
	o = o or {}
	setmetatable( o, self )
	self.__index = self
	return o
end
	
--initialize the ui
function UI_Manager:initialize()
	small_font = love.graphics.newFont(8)
	medium_font = love.graphics.newFont(12)

	--setup test matrix(would usually come from game state)
	test_map = Test_Map:new{}
	test_map:initialize( 48, 32 )

	--setup the main game board
	main_gameboard = Game_Board:new{}
	main_gameboard:initialize( 0, 0, 1200, 800, 120, 120, 120, test_map )
	main_gameboard.is_visible = true
	main_gameboard.is_focused = true

	--setup the bottom ui
	bottom_ui = Bottom_UI:new{}
	bottom_ui:initialize( 0, 800, 1200, 200, 150, 150, 150, test_map )
	bottom_ui.is_visible = true
	bottom_ui.is_focused = true 

	--setup additional panels
	tile_panel = Tile_Panel:new{}
	tile_panel:initialize( 0, 0, 25, 25, 1200, 800 )
	tile_panel.is_visible = false
	tile_panel.is_focused = false

	--setup the ui to meet the initial game state

	--add the initialized panels to UI_Manager internal panels table
	self.panels[1] = main_gameboard
	self.panels[2] = bottom_ui
	self.panels[3] = tile_panel
	self.num_panels = 3
end

--draw the game ui
function UI_Manager:draw()
	for i=1, self.num_panels do
		--check what panels are visible
		if self.panels[i].is_visible then
			--draw visible panels
			self.panels[i]:draw_panel()
			--draw entities	
			for j = 1, self.panels[i].num_entities do
				self.panels[i].entities[j]:draw_entity()
			end
		end
	end
end



return UI_Manager
