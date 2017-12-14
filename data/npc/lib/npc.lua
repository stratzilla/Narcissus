-- Include the Advanced NPC System
dofile(getDataDir() .. 'npc/lib/npcsystem/npcsystem.lua')

function selfIdle()
	following = false
	attacking = false

	selfAttackCreature(0)
	target = 0
end

function selfSayChannel(cid, message)
	return selfSay(message, cid, false)
end

function selfMoveToCreature(id)
	if(not id or id == 0) then
		return
	end

	local t = getCreaturePosition(id)
	if(not t.x or t.x == nil) then
		return
	end

	selfMoveTo(t.x, t.y, t.z)
	return
end

function getNpcDistanceToCreature(id)
	if(not id or id == 0) then
		selfIdle()
		return nil
	end

	local c = getCreaturePosition(id)
	if(not c.x or c.x == 0) then
		return nil
	end

	local s = getCreaturePosition(getNpcId())
	if(not s.x or s.x == 0 or s.z ~= c.z) then
		return nil
	end

	return math.max(math.abs(s.x - c.x), math.abs(s.y - c.y))
end

function doMessageCheck(message, keyword)
	if(type(keyword) == "table") then
		return table.isStrIn(keyword, message)
	end

	local a, b = message:lower():find(keyword:lower())
	if(a ~= nil and b ~= nil) then
		return true
	end

	return false
end

function doNpcSellItem(cid, itemid, amount, subType, ignoreCap, inBackpacks, backpack)
	amount = amount or 1
	subType = subType or 1
	ignoreCap = false

	local item = 0
	if(isItemStackable(itemid)) then
		if(inBackpacks) then
			item = doCreateItemEx(backpack)
			for i = 1, 20 do
				doAddContainerItem(item, itemid, amount)
			end
			amount = amount * 20
		else
			item = doCreateItemEx(itemid, amount)
		end
		if(doPlayerAddItemEx(cid, item, ignoreCap) ~= RETURNVALUE_NOERROR) then
			return 0, 0
		end

		return amount, 0
	end

	local a = 0
	if(inBackpacks) then
		local container = doCreateItemEx(backpack)
		local b = 1
		for i = 1, amount do
			item = doAddContainerItem(container, itemid, subType)

			if(isInArray({(getContainerCapById(backpack) * b), amount}, i)) then
				if(doPlayerAddItemEx(cid, container, ignoreCap) ~= RETURNVALUE_NOERROR) then
					b = b - 1
					break
				end

				a = i
				if(amount > i) then
					container = doCreateItemEx(backpack)
					b = b + 1
				end
			end
		end

		return a, b
	end

	for i = 1, amount do
		item = doCreateItemEx(itemid, subType)

		if(doPlayerAddItemEx(cid, item, ignoreCap) ~= RETURNVALUE_NOERROR) then
			break
		end

		a = i
	end

	return a, 0
end

function doRemoveItemIdFromPos (id, n, position)
	local thing = getThingFromPos({x = position.x, y = position.y, z = position.z, stackpos = 1})
	if(thing.itemid == id) then
		doRemoveItem(thing.uid, n)
		return true
	end

	return false
end

function getNpcName()
	return getCreatureName(getNpcId())
end

function getNpcPos()
	return getCreaturePosition(getNpcId())
end

function selfGetPosition()
	local t = getNpcPos()
	return t.x, t.y, t.z
end

msgcontains = doMessageCheck
moveToPosition = selfMoveTo
moveToCreature = selfMoveToCreature
selfMoveToPosition = selfMoveTo
selfGotoIdle = selfIdle
isPlayerPremiumCallback = isPremium
doPosRemoveItem = doRemoveItemIdFromPos
doNpcBuyItem = doPlayerRemoveItem
doNpcSetCreatureFocus = selfFocus
getNpcCid = getNpcId
getDistanceTo = getNpcDistanceTo
getDistanceToCreature = getNpcDistanceToCreature

function customCallbackOnBuy(cid, itemid, subType, amount, ignoreCap, inBackpacks, shopWindow)
	local shopItem, npcHandler = nil, NpcHandler
	for _, item in ipairs(shopWindow) do
		if not item.subType then
			item.subType = (isItemFluidContainer(item.id) == TRUE or isItemStackable(item.id) == TRUE) and 0 or 1
		end
		if(item.id == itemid and (item.subType == subType)) then
			shopItem = item
			break
		end
	end

	if(shopItem == nil) then
		error("[ShopModule.onBuy]", "Item not found on shopItems list")
		return false
	end

	if(shopItem.buy < 0) then
		error("[ShopModule.onSell]", "Attempt to purchase an item which is only sellable")
		return false
	end

	local backpack, totalCost = 1988, amount * shopItem.buy
	if(inBackpacks) then
		totalCost = isItemStackable(itemid) == TRUE and totalCost + 20 or totalCost + (math.max(1, math.floor(amount / getContainerCapById(backpack))) * 20)
	end

	if(getPlayerMoney(cid) < totalCost) then
		doPlayerSendCancel(cid, npcHandler:parseMessage(npcHandler:getMessage(MESSAGE_NEEDMONEY), {[TAG_PLAYERNAME] = getPlayerName(cid), [TAG_ITEMCOUNT] = amount, [TAG_TOTALCOST] = totalCost, [TAG_ITEMNAME] = shopItem.name}))
		return false
	end

	local subType = shopItem.subType or isItemFluidContainer(itemid) == TRUE and 0 or 1
	local a, b = doNpcSellItem(cid, itemid, amount, subType, ignoreCap, inBackpacks, backpack)
	if(a < amount) then
		local msgId = MESSAGE_NEEDMORESPACE
		if(a == 0) then
			msgId = MESSAGE_NEEDSPACE
		end

		doPlayerSendCancel(cid, npcHandler:parseMessage(npcHandler:getMessage(msgId), {[TAG_PLAYERNAME] = getPlayerName(cid), [TAG_ITEMCOUNT] = amount, [TAG_TOTALCOST] = totalCost, [TAG_ITEMNAME] = shopItem.name, [TAG_ITEMCOUNT] = a}))

		if(a > 0) then
			doPlayerRemoveMoney(cid, ((a * shopItem.buy) + (b * 20)))
			return true
		end

		return false
	end
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, npcHandler:parseMessage(npcHandler:getMessage(MESSAGE_BOUGHT), {[TAG_PLAYERNAME] = getPlayerName(cid), [TAG_ITEMCOUNT] = amount, [TAG_TOTALCOST] = totalCost, [TAG_ITEMNAME] = shopItem.name}))
	doPlayerRemoveMoney(cid, totalCost)

	return true
end

function customCallbackOnSell(cid, itemid, subType, amount, ignoreCap, inBackpacks, shopWindow)
	local shopItem, npcHandler = nil, NpcHandler
	for _, item in ipairs(shopWindow) do
		item.subType = not item.subType and 0 or item.subType
		if(item.id == itemid and (isItemFluidContainer(itemid) == FALSE or isItemFluidContainer(itemid) == TRUE and item.subType == subType)) then
			shopItem = item
			break
		end
	end

	if(shopItem == nil) then
		error("[ShopModule.onBuy]", "Item not found on shopItems list")
		return false
	end

	if(shopItem.sell < 0) then
		error("[ShopModule.onSell]", "Attempt to sell an item which is only buyable")
		return false
	end

	if(doPlayerRemoveItem(cid, itemid, amount, subType) == TRUE) then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, npcHandler:parseMessage(npcHandler:getMessage(MESSAGE_SOLD), {[TAG_PLAYERNAME] = getPlayerName(cid), [TAG_ITEMCOUNT] = amount, [TAG_TOTALCOST] = amount * shopItem.sell, [TAG_ITEMNAME] = shopItem.name}))
		doPlayerAddMoney(cid, amount * shopItem.sell)

		return true
	end
	doPlayerSendCancel(cid, npcHandler:parseMessage(npcHandler:getMessage(MESSAGE_NEEDITEM), {[TAG_PLAYERNAME] = getPlayerName(cid), [TAG_ITEMCOUNT] = amount, [TAG_TOTALCOST] = amount * shopItem.sell, [TAG_ITEMNAME] = shopItem.name}))

	return false
end