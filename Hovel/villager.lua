--Villager Class
--Date: 01/07/2016
--Author: Johann S. R. Eckman

local Villager = {}

function Villager.initialize( name, age )
	local villager = {}
	villager.name = name
	villager.age = age
	villager.action_points = 4
	return villager
end

return Villager