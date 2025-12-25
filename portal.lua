local cl = require("jankloader")
local sleep = require("usleep")
local playerInfo = {
	x = 1,
	y = 1,
	pgun = 0,
	map = "00.cm"
}
print("This game was made by Casix\nYoutube >> @casixvii")
sleep(1)
print("This game uses jankLoader\n")
sleep(1)


while true do
	print("\27[2J\27[1;1HPORTAL")
	print("[N] New Game")
	print("[L] Load Game")
	print("[B] Bonus Maps")
	print("[A] Achievements")
	print("[Q] Quit")
	local input = io.read():upper()
	if input == "N" then
		game("00.cm", 5, 15)
	elseif input == "Q" then
		break
	else
		print("\27[2J\27[1;1HSeems that you typed something wrong, or what you're trying to do doesn't work right now. Try something else ")
		sleep(3)
	end
end

function draw()

end

function game(map, x, y)
	
end

