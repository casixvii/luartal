local cl = require("jankloader")
local sleep = require("usleep")
local playerInfo = {
	x = 1, 		   -- Player position
	y = 1,
	vx = 0, 	   -- Player velocity
	vy = 0,
	pgun = 0,	   -- Portal gun state [0 = No portalgun; 1 = Single portalgun (Blue); 2 = Single portalgun (Orange); 3 = Dual portalgun]
	gstate = true, -- Ground state
	map = "na.jma" -- Map file to load from
}

local stype = { -- Surface types; you can find the documentation at github.com/casixvii/luartal/blob/main/README.md
	s0 = "\27[107;37m░\27[100m",
	s1 = "\27[90;30m░\27[100m",
	s2 = "\27[107;37m■\27[100m",
	s3 = "\27[107;37m▒\27[100m",
	s4 = "\27[47m\27[38;5;214m░\27[100m",
	s5 = "\27[47m \27[100m",
	s6 = "\27[100;37m░\27[100m",
	s7 = "\27[107m\27[38;5;153m░\27[100m",
	s8 = "\27[107m\27[38;5;153m■\27[100m",
	s9 = " ",
	sA = "\27[107;96m░\27[100m"
}

print("IF YOU ARE ON WINDOWS, OPEN THE GAME WITH WINDOWS TERMINAL")
sleep(1)
print("This game was made by Casix\nYoutube >> @casixviiСЛЛСЛСЛСЛ")
sleep(1)
print("This game uses a modified version of jankLoader\n")
sleep(1)

function getUserInput() -- Input listener
	os.execute("cmd /c inpipe.bat")
	local file = io.open(".\\uinp.bin", "r")
	return file:read()
end

function drawStatic()
	io.write("\27[2J\27[1;1H")
	cl.currentMap = playerInfo.map
	cl.loadMap()
	print("\27[2J")
	for i = 1, 10 do
		local w = cl.mapInfo["w".. i]
		if w then
		else
			print("w".. i ..": nil")
		end
	end
	
	for wall = 1, 10 do
		local w = cl.mapInfo["w".. wall]
		if not w then
			break
		end
		if not (w.t and w.b and w.l and w.r and w.s) then
			goto continue -- i have just learned that goto exists in lua
		end
		
		local t, b, l, r, s = tonumber(w.t), tonumber(w.b), tonumber(w.l), tonumber(w.r), w.s
		
		if not (t and b and l and r) then
			goto continue
		end
		local surfaceChar = stype["s".. s]
		if not surfaceChar then
			goto continue
		end
		if l <= r-1 then
			for x = l, r-1 do
				if t >= 1 and t <= 24 and x >= 1 and x <= 80 then
					io.write("\27[".. t ..";".. x .."H".. surfaceChar)
				end
				if b >= 1 and b <= 24 and x >= 1 and x <= 80 then
					io.write("\27[".. b ..";".. x .."H".. surfaceChar)
				end
			end
		end
		if t <= b then
			for y = t, b do
				if y >= 1 and y <= 24 and l >= 1 and l <= 80 then
					io.write("\27[".. y ..";".. l .."H".. surfaceChar)
				end
				if y >= 1 and y <= 24 and r >= 1 and r <= 80 then
					io.write("\27[".. y ..";"..r  .."H".. surfaceChar)
				end
			end
		end
		
		::continue::
	end
	
	io.flush()
end

function game(map, x, y)

	-- validation stuff if someone decides to mod this
	if not map then
		print("\27[2J\27[1;1HCannot find map variable! (game(\27[1mmap\27[0m, x, y) Closing in 3 seconds...")
		sleep(3)
		return nil
	end

	if not x then
		print("\27[2J\27[1;1HCannot find x variable! (game(map, \27[1mx\27[0m, y) Closing in 3 seconds...")
		sleep(3)
		return nil
	end

	if not y then
		print("\27[2J\27[1;1HCannot find y variable! (game(map, x, \27[1my\27[0m) Closing in 3 seconds...")
		sleep(3)
		return nil
	end

	playerInfo.map = ".\\maps\\".. map
	playerInfo.x = x
	playerInfo.y = y
	
	drawStatic()
	while true do
		io.write("\27[".. playerInfo.y ..";".. playerInfo.x .."8") -- draw player
		
		-- Velocity handlers
		playerInfo.x = math.floor(playerInfo.x + playerInfo.vx / 4)
		playerInfo.y = math.floor(playerInfo.y + playerInfo.vy / 4)
		
		-- gravity
		if playerInfo.gstate == false then
			playerInfo.vy = math.min(playerInfo.vy + 3, 28)
		else
			playerInfo.vy = 0
		end
		
		local input = getUserInput():upper()
		if input == "A" then
			playerInfo.vx = playerInfo.vx - 4
		elseif input == "D" then
			playerInfo.vx = playerInfo.vx + 4
		elseif input == " " then
			playerInfo.vy = playerInfo.vy - 6
			playerInfo.gstate = false
		end
	end
end

while true do -- Menu
	print("\27[2J\27[1;1HPORTAL")
	print("[N] New Game")
	print("[L] Load Game")
	print("[B] Bonus Maps")
	print("[A] Achievements")
	print("[Q] Quit")
	local input = getUserInput():upper()
	if input == "N" then
		game("test1.jma", 5, 15)
	elseif input == "Q" then
		break
	elseif input == "G" then
	else
		print("\27[2J\27[1;1HSeems that you typed something wrong, or what you're trying to do doesn't work right now. Try something else ")
		sleep(3)
	end
end
