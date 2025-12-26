_G.jankloader = {
	currentMap = ".\\maps\\00.jma",
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

function jankloader.getNextMap()
	local file = io.open(jankloader.currentMap, "r")
	local file2 = file:read()
	local nextMap = file2:match("b([^%[%]]+)%[") -- Removes everything except for the next map name
	file:close()
	return nextMap
end

function jankloader.loadMap()
	local file = io.open(jankloader.currentMap, "r")
	local file2 = file:read()
	-- print(file2)
	jankloader.mapInfo.et.x = file2:match("b[^%[]*%[([^,]+)")
	jankloader.mapInfo.et.y = file2:match("b[^%[]*%[[^,]+,([^%]]+)%]%$")
	jankloader.mapInfo.w1.t = file2:match("%$%[(.-),.-,.-,.-,.-%]g")
	jankloader.mapInfo.w1.b = file2:match("%$%[.-,(.-),.-,.-,.-%]g")
	jankloader.mapInfo.w1.l = file2:match("%$%[.-,.-,(.-),.-,.-%]g")
	jankloader.mapInfo.w1.r = file2:match("%$%[.-,.-,.-,(.-),.-%]g")
	jankloader.mapInfo.w1.s = file2:match("%$%[.-,.-,.-,.-,(.-)%]g")
	jankloader.mapInfo.w2.t = file2:match("g%[(.-),.-,.-,.-,.-%]%@")
	jankloader.mapInfo.w2.b = file2:match("g%[.-,(.-),.-,.-,.-%]%@")
	jankloader.mapInfo.w2.l = file2:match("g%[.-,.-,(.-),.-,.-%]%@")
	jankloader.mapInfo.w2.r = file2:match("g%[.-,.-,.-,(.-),.-%]%@")
	jankloader.mapInfo.w2.s = file2:match("g%[.-,.-,.-,.-,(.-)%]%@")
	jankloader.mapInfo.w3.t = file2:match("%@%[(.-),.-,.-,.-,.-%]k")
	jankloader.mapInfo.w3.b = file2:match("%@%[.-,(.-),.-,.-,.-%]k")
	jankloader.mapInfo.w3.l = file2:match("%@%[.-,.-,(.-),.-,.-%]k")
	jankloader.mapInfo.w3.r = file2:match("%@%[.-,.-,.-,(.-),.-%]k")
	jankloader.mapInfo.w3.s = file2:match("%@%[.-,.-,.-,.-,(.-)%]k")
	jankloader.mapInfo.w4.t = file2:match("k%[(.-),.-,.-,.-,.-%]v")
	jankloader.mapInfo.w4.b = file2:match("k%[.-,(.-),.-,.-,.-%]v")
	jankloader.mapInfo.w4.l = file2:match("k%[.-,.-,(.-),.-,.-%]v")
	jankloader.mapInfo.w4.r = file2:match("k%[.-,.-,.-,(.-),.-%]v")
	jankloader.mapInfo.w4.s = file2:match("k%[.-,.-,.-,.-,(.-)%]v")
	jankloader.mapInfo.w5.t = file2:match("v%[(.-),.-,.-,.-,.-%]2")
	jankloader.mapInfo.w5.b = file2:match("v%[.-,(.-),.-,.-,.-%]2")
	jankloader.mapInfo.w5.l = file2:match("v%[.-,.-,(.-),.-,.-%]2")
	jankloader.mapInfo.w5.r = file2:match("v%[.-,.-,.-,(.-),.-%]2")
	jankloader.mapInfo.w5.s = file2:match("v%[.-,.-,.-,.-,(.-)%]2")
	jankloader.mapInfo.w6.t = file2:match("2%[(.-),.-,.-,.-,.-%]c")
	jankloader.mapInfo.w6.b = file2:match("2%[.-,(.-),.-,.-,.-%]c")
	jankloader.mapInfo.w6.l = file2:match("2%[.-,.-,(.-),.-,.-%]c")
	jankloader.mapInfo.w6.r = file2:match("2%[.-,.-,.-,(.-),.-%]c")
	jankloader.mapInfo.w6.s = file2:match("2%[.-,.-,.-,.-,(.-)%]c")
	jankloader.mapInfo.w7.t = file2:match("c%[(.-),.-,.-,.-,.-%]:")
	jankloader.mapInfo.w7.b = file2:match("c%[.-,(.-),.-,.-,.-%]:")
	jankloader.mapInfo.w7.l = file2:match("c%[.-,.-,(.-),.-,.-%]:")
	jankloader.mapInfo.w7.r = file2:match("c%[.-,.-,.-,(.-),.-%]:")
	jankloader.mapInfo.w7.s = file2:match("c%[.-,.-,.-,.-,(.-)%]:")
	jankloader.mapInfo.w8.t = file2:match(":%[(.-),.-,.-,.-,.-%]v")
	jankloader.mapInfo.w8.b = file2:match(":%[.-,(.-),.-,.-,.-%]v")
	jankloader.mapInfo.w8.l = file2:match(":%[.-,.-,(.-),.-,.-%]v")
	jankloader.mapInfo.w8.r = file2:match(":%[.-,.-,.-,(.-),.-%]v")
	jankloader.mapInfo.w8.s = file2:match(":%[.-,.-,.-,.-,(.-)%]v")
	jankloader.mapInfo.w9.t = file2:match("v%[(.-),.-,.-,.-,.-%]_")
	jankloader.mapInfo.w9.b = file2:match("v%[.-,(.-),.-,.-,.-%]_")
	jankloader.mapInfo.w9.l = file2:match("v%[.-,.-,(.-),.-,.-%]_")
	jankloader.mapInfo.w9.r = file2:match("v%[.-,.-,.-,(.-),.-%]_")
	jankloader.mapInfo.w9.s = file2:match("v%[.-,.-,.-,.-,(.-)%]_")
	jankloader.mapInfo.w10.t = file2:match("_%[(.-),.-,.-,.-,.-%]P")
	jankloader.mapInfo.w10.b = file2:match("_%[.-,(.-),.-,.-,.-%]P")
	jankloader.mapInfo.w10.l = file2:match("_%[.-,.-,(.-),.-,.-%]P")
	jankloader.mapInfo.w10.r = file2:match("_%[.-,.-,.-,(.-),.-%]P")
	jankloader.mapInfo.w10.s = file2:match("_%[.-,.-,.-,.-,(.-)%]P")
	file:close()
end

return jankloader
