--building class
--Date: 01/07/2016
--Author: Johann S. R. Eckman

local Building = {}

function Building.initialize( type, image )
	local building = {}
	building.type = type
	building.image = image
	return building
end

return Building
