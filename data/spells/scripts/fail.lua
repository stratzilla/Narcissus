local function isWalkable(cid,pos)
    return getTileInfo(pos).protection == false and doTileQueryAdd(cid, pos) == RETURNVALUE_NOERROR
end


local combatcrash1 = createCombatObject()
setCombatParam(combatcrash1, COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
setCombatParam(combatcrash1, COMBAT_PARAM_EFFECT, CONST_ME_HITBYPOISON)
--setAttackFormula(combatcrash1, COMBAT_FORMULA_LEVELMAGIC, 5, 5, 22, 30)
setAttackFormula(combatcrash1, COMBAT_FORMULA_DAMAGE, 0, -2500, 0, -3500)

local combatcrash2 = createCombatObject()
setCombatParam(combatcrash2, COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
setCombatParam(combatcrash2, COMBAT_PARAM_EFFECT, CONST_ME_POISONAREA)
--setAttackFormula(combatcrash2, COMBAT_FORMULA_LEVELMAGIC, 5, 5, 22, 30)
setAttackFormula(combatcrash2, COMBAT_FORMULA_DAMAGE, 0, -2500, 0, -3500)

local combatcrash3 = createCombatObject()
setCombatParam(combatcrash3, COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
setCombatParam(combatcrash3, COMBAT_PARAM_EFFECT, CONST_ME_GREEN_RINGS)
--setAttackFormula(combatcrash3, COMBAT_FORMULA_LEVELMAGIC, 5, 5, 22, 30)
setCombatFormula(combatcrash3, COMBAT_FORMULA_DAMAGE, 0, -2500, 0, -3500)



local crasharr1 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 3, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}

local crasharr2 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 0, 2, 0, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}


local area1 = createCombatArea(crasharr1)

local area2 = createCombatArea(crasharr2)

setCombatArea(combatcrash1, area1)
setCombatArea(combatcrash3, area2)

local function chargeBolt(cid, pos)
	for i = 1,6 do
	addEvent(doSendDistanceShoot, 45 * i, { x = pos.x - 7, y = pos.y - 7, z = pos.z}, pos, math.random(2) == 1 and CONST_ANI_EARTH or CONST_ANI_SMALLEARTH)
	end
	addEvent(doCombat, 380, cid, combatcrash1, positionToVariant(pos))
	addEvent(doCombat, 380, cid, combatcrash2, positionToVariant(pos))
	addEvent(doCombat, 380, cid, combatcrash3, positionToVariant(pos))
end

local function onThunderStrike(parameters)
	local amount = parameters.amount - 1

	parameters.atkPos = { x = parameters.targetPos.x + math.random(-2, 1), y = parameters.targetPos.y + math.random(-1, 2), z = parameters.targetPos.z}

	if isWalkable(parameters.cid, parameters.atkPos) then
		chargeBolt(parameters.cid, parameters.atkPos)
	end
	
	parameters.amount = parameters.amount - 1
	
	if parameters.amount > 0 then
		addEvent(onThunderStrike, 75, parameters)
	end
end



function onCastSpell(cid, var)
	local parameters = { cid = cid, var = var, amount = 5, maxamount = 10, cidPos = getCreaturePosition(cid), cidDir = getCreatureLookDirection(cid), targetPos = getCreaturePosition(getCreatureTarget(cid)), atkPos = getCreaturePosition(cid)}
	onThunderStrike(parameters)

	return true
end