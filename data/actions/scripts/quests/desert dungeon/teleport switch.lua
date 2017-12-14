function onUse(cid, item, fromPosition, itemEx, toPosition)
	-- Positions/ID's/Vocations order: paladin, sorcerer, knight, druid.
	local playerpositions = {
			{x = 32673, y = 32085, z = 8, stackpos = 1},
			{x = 32669, y = 32089, z = 8, stackpos = 1},
			{x = 32673, y = 32093, z = 8, stackpos = 1},
			{x = 32677, y = 32089, z = 8, stackpos = 1}
		}
	local itempositions = {
			{x = 32673, y = 32083, z = 8, stackpos = 1},
			{x = 32667, y = 32089, z = 8, stackpos = 1},
			{x = 32673, y = 32094, z = 8, stackpos = 1},
			{x = 32679, y = 32089, z = 8, stackpos = 1}
		}
	local newpositions = {
			{x = 32672, y = 32069, z = 8},
			{x = 32671, y = 32069, z = 8},
			{x = 32671, y = 32070, z = 8},
			{x = 32672, y = 32070, z = 8}
		}

	local vocations = {3, 2, 4, 1}
	local items = {2455, 2674, 2376, 2175}

	-- don't touch below.
	local check = {
		players = true,
		vocations = true,
		items = true
	}

	if (item.itemid == 1945) then
		for i = 1, 4 do
			if (not isPlayer(getThingFromPos(playerpositions[i]).uid)) then
				doPlayerSendCancel(cid, "You need 4 players.")
				check.players = false
				break
			end
		end
		for i = 1, 4 do
			if (getPlayerVocation(getThingFromPos(playerpositions[i]).uid) ~= vocations[i]) then
				doPlayerSendCancel(cid, "Wrong vocations.")
				check.vocations = false
				break
			end
		end
		for i = 1, 4 do
			if (getThingFromPos(itempositions[i]).itemid ~= items[i]) then
				doPlayerSendCancel(cid, "Wrong items.")
				check.items = false
				break
			end
		end
		
		if (check.players and check.vocations) == false then
			doPlayerSendCancel(cid, "You need 4 players of the correct vocation.")
		end
		
		if (check.players and check.vocations and check.items) then
			for i = 1, 4 do
				doTeleportThing(getThingFromPos(playerpositions[i]).uid, newpositions[i])
				doSendMagicEffect(playerpositions[i], CONST_ME_POFF)
				doSendMagicEffect(newpositions[i], CONST_ME_TELEPORT)
				doTransformItem(item.uid, item.itemid + 1)
			end
		end
	elseif (item.itemid == 1946) then
		doTransformItem(item.uid, item.itemid - 1)
	end

	return TRUE
end