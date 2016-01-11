--UI_Manager Class
--Handles the UI, splitting the game view up into panels. Also handles the Input Interprator
--which deals with taking the input(mostly mousepresses) and associating them with the ui.
--Date: 01/08/2016
--Author: Johann S. R. Eckman

local UI_Mananger = {}

--UI Manager constructor
function UI_Manager:new( o )
	o = o or {}
	setmetatable( o, self )
	self.__index = self
	return o
end

return UI_Manager
