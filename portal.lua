local cl = require("jankloader")
local sleep = require("usleep")
local playerInfo = {
	x = 1, 		   -- Player position
	y = 1,
	vx = 0, 	   -- Player velocity
	vy = 0,
	pgun = 0,      -- Portal gun state [0 = No portalgun; 1 = Single portalgun (Blue); 2 = Single portalgun (Orange); 3 = Dual portalgun]
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
	s9 = "",
	s10 = "\27[107;96m░\27[100m"
}

print("IF YOU ARE ON WINDOWS, OPEN THE GAME WITH WINDOWS TERMINAL")
sleep(1)
print("This game was made by Casix\nYoutube >> @casixvii")
sleep(1)
print("This game uses a modified version of jankLoader\n")
sleep(1)

function getUserInput() -- Input listener
	os.execute("cmd /c inpipe.bat")
	local file = io.open(".\\uinp.bin", "r")
	return file:read()
end

function drawStatic()
	io.write("\27\2JJ\27\1;1H")
	cl.currentMap = playerInfo.map
	cl.loadMap()
	for wall = 1, 10 do
		for v = cl["w".. wall].l, cl["w".. wall].r do
			io.write("\27[".. cl["w".. wall].t ..";".. v .."H".. stype["s".. cl["w".. wall].s])
			io.write("\27[".. cl["w".. wall].b ..";".. v .."H".. stype["s".. cl["w".. wall].s])
		end
		for h = cl["w".. wall].t, cl["w".. wall].b do
			io.write("\27[".. cl["w".. wall].l ..";".. v .."H".. stype["s".. cl["w".. wall].s])
			io.write("\27[".. cl["w".. wall].r ..";".. v .."H".. stype["s".. cl["w".. wall].s])
		end
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


	while true do
		print("NOT FINISHED")
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
		game("a1-intro.jma", 5, 15)
	elseif input == "Q" then
		break
	elseif input == "G" then
	else
		print("\27[2J\27[1;1HSeems that you typed something wrong, or what you're trying to do doesn't work right now. Try something else ")
		sleep(3)
	end
end
