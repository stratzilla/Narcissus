local holes = {468, 481, 483, 7932}
function onUse(cid, item, fromPosition, itemEx, toPosition)

	if isInArray(holes, itemEx.itemid) == TRUE then
		doTransformItem(itemEx.uid, itemEx.itemid + 1)
		doDecayItem(itemEx.uid)
	elseif itemEx.actionid == 1345 then
		doTransformItem(itemEx.uid, 482)
		doSendMagicEffect(toPosition, CONST_ME_POFF)
		addEvent(changeBack, 300000, {position = toPosition})
	elseif (itemEx.itemid == 231 or itemEx.itemid == 9059 and itemEx.actionid ~= 1345) then
		local rand = math.random(1, 100)
		if rand == 1 then
			doCreateItem(2159, 1, toPosition)
		elseif rand > 95 then
			doSummonCreature("Scarab", toPosition)
		end
		doSendMagicEffect(toPosition, CONST_ME_POFF)
	elseif itemEx.itemid >= 8319 or itemEx.itemid <= 8322 then
		local rand2 = math.random(1, 100)
		if rand2 <= 2 then
			doCreateItem(2159, 1, toPosition)
		elseif rand2 > 90 then
			doSummonCreature("Scarab", toPosition)
		end
		doSendMagicEffect(toPosition, CONST_ME_POFF)
	else
		return FALSE
	end
	return TRUE
end

function changeBack(parameters)
	doTransformItem(getThingfromPos(parameters.position).uid, 231)
	return true
end