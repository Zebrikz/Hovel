--Village Class
--Date: 01/07/2016
--Author: Johann S. R. Eckman

local Village = {}

function Village.initialize( village_name )
	local village = {}
	village.name = village_name
	village.wealth = 0
	village.food = 0
	village.stone = 0
	village.wood = 0
	village.population = 1
	return village
end

return Village

