local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, 60 * 60 * 1000)
setConditionParam(condition, CONDITION_PARAM_SKILL_MELEEPERCENT, 150)

local exhaust = createConditionObject(CONDITION_EXHAUST)
setConditionParam(exhaust, CONDITION_PARAM_TICKS, (getConfigInfo('timeBetweenExActions') - 100))

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(not doAddCondition(cid, condition) or not doAddCondition(cid, exhaust)) then
		return true
	end

	doRemoveItem(item.uid, 1)
	doCreatureSay(cid, "Yum.", TALKTYPE_MONSTER)
	return true
end
