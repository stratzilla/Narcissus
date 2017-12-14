--copyrigth flaven patent penting original code do not steal
function onLogin(cid)
	local timeLeft = (getPlayerStorageValue(cid, 1338) - os.time())
	local isInJail = getPlayerStorageValue(cid, 1339)
	local jailPos = { x = 32318, y = 32280, z =8 } 
	local unJailPos = { x = 32318, y = 32277, z =8 } 
	
	if timeLeft >= 1 and isInJail > 0 then
	doTeleportThing(cid, jailPos, false)
	return true
	elseif isInJail > 0 and timeLeft <=0 and getPlayerGhostAccess(cid) < 1 then
	doTeleportThing(cid, unJailPos, false)
	setPlayerStorageValue(cid, 1339, 0)
	setPlayerStorageValue(cid, 1338, 0)
	end
	
return true
end
