local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -1, -1000, -1, -1200)
 
local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
 
local condition2 = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition2, CONDITION_PARAM_TICKS, 20000)
setConditionFormula(condition2, -0.9, 0, -0.9, 0)
setCombatCondition(combat2, condition2)
 
local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, CONST_ME_FIREATTACK)
setCombatParam(combat3, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -1, -1000, -1, -1200)
 
local combat4 = createCombatObject()
setCombatParam(combat4, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat4, COMBAT_PARAM_EFFECT, CONST_ME_ICEATTACK)
setCombatParam(combat4, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLICE)
setCombatFormula(combat4, COMBAT_FORMULA_LEVELMAGIC, -1, -1000, -1, -1200)
 
 
local function onCastSpell1(parameters)
    doCombat(parameters.cid, combat1, parameters.var)
end
 
local function onCastSpell2(parameters)
    doCombat(parameters.cid, combat2, parameters.var)
end
 
local function onCastSpell3(parameters)
    doCombat(parameters.cid, combat3, parameters.var)
end
 
local function onCastSpell4(parameters)
    doCombat(parameters.cid, combat4, parameters.var)
end
 
function onCastSpell(cid, var)
local parameters = { cid = cid, var = var}
addEvent(onCastSpell1, 350, parameters)
addEvent(onCastSpell2, 0, parameters)
addEvent(onCastSpell3, 700, parameters)
addEvent(onCastSpell4, 1000, parameters)
return TRUE
end