local POTIONS = {7588, 7589}

function onUse(cid, item, fromPosition, itemEx, toPosition)
if item.itemid == itemEx.itemid then
	doTransformItem(item.uid, POTIONS[math.random(1, table.maxn(POTIONS))])
	doSendMagicEffect(fromPosition, CONST_ME_MAGIC_RED)
	return true
else
	return false
end
end
