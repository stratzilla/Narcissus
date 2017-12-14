local exhaust = createConditionObject(CONDITION_EXHAUST)
setConditionParam(exhaust, CONDITION_PARAM_TICKS, (getConfigInfo('timeBetweenExActions') - 100))

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(not doAddCondition(cid, exhaust)) then
		return true
	end

	doCreatureAddHealth(cid, getCreatureMaxHealth(cid) - getCreatureHealth(cid))
	doRemoveItem(item.uid, 1)

	doCreatureSay(cid, "Gulp.", TALKTYPE_MONSTER)
	return true
end
