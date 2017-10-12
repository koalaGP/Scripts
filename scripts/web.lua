-- "THE BEER-WARE LICENSE" (Revision 42):
-- <mail@michael-fitzmayer.de> wrote this file.  As long as you retain
-- this notice you can do whatever you want with this stuff. If we meet
-- some day, and you think this stuff is worth it, you can buy me a beer
-- in return.  Michael Fitzmayer


Methods = {}


-- Add [ web = require("web") ] to the top of server.lua
-- Find "myMod.OnPlayerConnect(pid, playerName)" and "myMod.OnPlayerDisconnect(pid)" inside server.lua and insert:
-- [ web.UpdateStatus() ]
-- directly underneath it.


Methods.UpdateStatus = function()
	 local playerList = "/srv/http/yourdomain.com/api/players_online.txt"
	 local lastPid = tes3mp.GetLastPlayerId()
	 local list = ""
	 local f = nil

	 for i = 0, lastPid do
			if Players[i] ~= nil then
				 list = list .. "<li class=\"green\">"
				 list = list .. tostring(Players[i].name)
				 list = list .. "</li>\n"
			end
	 end

	 f = io.open(playerList, "w+")
	 if f ~= nil then
			f:write(list)
	 end
	 f:close()
end


return Methods
