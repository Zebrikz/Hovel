--Resource Class
--Date: 01/07/2016
--Author: Johann S. R. Eckman


-- house_image = love.graphics.newImage("House_Image.png")
-- big_house_image = love.graphics.newImage("Big_House_Image.png")
animal_image = love.graphics.newImage("Animal_Image.png")
fruit_image = love.graphics.newImage("Fruit_Image.png")
stone_image = love.graphics.newImage("Stone_Image.png")
tree_image = love.graphics.newImage("Tree_Image.png")

local Resource = {}

function Resource.initialize( type )
	local resource = {}
	if type == "Tree" then
 		resource.type = type
 		resource.image = tree_image
 		resource.description = "Tree resource that can be harvested\nfor wood"
 	elseif type == "Fruit" then
 		resource.type = type
 		resource.image = fruit_image
 		resource.description = "Fruit resource that can be harvested\nfor food"
 	elseif type == "Stone" then
 		resource.type = type
 		resource.image = stone_image
 		resource.description = "Stone resource that can be harvested\nfor stone materials"
 	else
 		resource.type = type
 		resource.image = animal_image
 		resource.description = "Animal resource that can be harvested\nfor food"
 	end
 	return resource
 end

 return Resource

