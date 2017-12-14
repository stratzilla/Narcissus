function onDeath(cid, corpse, deathlist)

	if getPlayerStorageValue(cid, 42309) < 1 then --arena shit
	for i = 42300, 42309 do
			setPlayerStorageValue(cid, i, 0)
		end
	end
	if getPlayerStorageValue(cid, 42319) < 1 then
		for i = 42310, 42319 do
			setPlayerStorageValue(cid, i, 0)
		end
	end
	if getPlayerStorageValue(cid, 42329) < 1 then
		for i = 42320, 42329 do
			setPlayerStorageValue(cid, i, 0)
		end
	end
	if getPlayerStorageValue(cid, 42355) == -1 then
		setPlayerStorageValue(cid,42111, -1)
	end
	setPlayerStorageValue(cid, 42309, 0) -- reset final boss kill
	setPlayerStorageValue(cid, 42319, 0) -- reset final boss kill
	setPlayerStorageValue(cid, 42329, 0) -- reset final boss kill end arena shit

	if getPlayerSlotItem(cid, 2).itemid == 2173 then 
				doCreatureSetDropLoot(cid, false)
                doPlayerRemoveItem(cid, 2173, 1)
	else
	doCreatureSetDropLoot(cid, true)
	return true
	end
	return true
end