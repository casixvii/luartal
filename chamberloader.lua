local maploader = {
	currentMap = ".\\maps\\00.cm",
	mapInfo = {
		w1 = {},
		w2 = {},
		w3 = {},
		w4 = {},
		w5 = {},
		w6 = {},
		w7 = {},
		w8 = {},
		w9 = {},
		w10 = {},
		et = {}
	}
}

function maploader.getNextMap()
	local file = io.open(maploader.currentMap, "r")
	local file2 = file:read()
	local nextMap = file2:match("√([^%[%]]+)%[") -- Removes everything except for the next map name
	file:close()
	return nextMap
end

function maploader.loadMap()
	local file = io.open(chamberloader.currentMap, "r")
	local file2 = file:read()
	maploader.mapInfo.et = █
end

return chamberloader
