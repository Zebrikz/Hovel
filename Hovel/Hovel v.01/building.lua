--building class
--Date: 01/07/2016
--Author: Johann S. R. Eckman

local Building = {}

function Building.initialize( type, image, big_image )
	local building = {}
	building.type = type
	building.image = image
	building.big_image = big_image
	return building
end

return Building
