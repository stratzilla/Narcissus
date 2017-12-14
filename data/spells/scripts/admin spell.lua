local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)

function onGetFormulaValues(cid, level, maglevel)
	local min = 100000
	local max = 100000
	return -min, -max
end

local area = createCombatArea(AREA_CROSS5X5)
setCombatArea(combat, area)

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")
function onCastSpell(cid, var)
	if getPlayerAccess(cid) >= 4 then
		return doCombat(cid, combat, var)
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Nice try.")
		return false
	end
end