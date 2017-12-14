local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)                  npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)               npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)          npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                              npcHandler:onThink() end

-- Buff Config beginning --

-- configs
local storage = 77700
local item = 6527
local count = 5

local invisibleseconds = 1200
local magicshieldseconds = 1200
local regeseconds = 1200
local speedseconds = 1200
local skillsseconds = 1200

local skillsupgrade = {}
skillsupgrade['fist'] = 20
skillsupgrade['club'] = 20
skillsupgrade['sword'] = 20
skillsupgrade['axe'] = 20
skillsupgrade['distance'] = 20
skillsupgrade['shield'] = 20
skillsupgrade['ml'] = 10
-- end configs

-- Configs of buffs

local conditionMagic = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(conditionMagic, CONDITION_PARAM_BUFF, true)
setConditionParam(conditionMagic, CONDITION_PARAM_TICKS, skillsseconds * 1000)
setConditionParam(conditionMagic, CONDITION_PARAM_STAT_MAGICLEVEL, skillsupgrade['ml'])

local combatInvisible = createConditionObject(CONDITION_INVISIBLE)
setConditionParam(combatInvisible, CONDITION_PARAM_BUFF, true)
setConditionParam(combatInvisible, CONDITION_PARAM_TICKS, invisibleseconds*1000)

local conditionMelee = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(conditionMelee, CONDITION_PARAM_BUFF, true)
setConditionParam(conditionMelee, CONDITION_PARAM_TICKS, skillsseconds*1000)
setConditionParam(conditionMelee, CONDITION_PARAM_SKILL_FIST, skillsupgrade['fist'])
setConditionParam(conditionMelee, CONDITION_PARAM_SKILL_CLUB, skillsupgrade['club'])
setConditionParam(conditionMelee, CONDITION_PARAM_SKILL_SWORD, skillsupgrade['sword'])
setConditionParam(conditionMelee, CONDITION_PARAM_SKILL_AXE, skillsupgrade['axe'])

local conditionDistance = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(conditionDistance, CONDITION_PARAM_BUFF, true)
setConditionParam(conditionDistance, CONDITION_PARAM_TICKS, skillsseconds*1000)
setConditionParam(conditionDistance, CONDITION_PARAM_SKILL_DISTANCE, skillsupgrade['distance'])

local conditionShield = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(conditionShield, CONDITION_PARAM_BUFF, true)
setConditionParam(conditionShield, CONDITION_PARAM_TICKS, skillsseconds*1000)
setConditionParam(conditionShield, CONDITION_PARAM_SKILL_SHIELD, skillsupgrade['shield'])

local combatUtamo = createConditionObject(CONDITION_MANASHIELD)
setConditionParam(combatUtamo, CONDITION_PARAM_BUFF, true)
setConditionParam(combatUtamo, CONDITION_PARAM_TICKS, magicshieldseconds*1000)

local conditionRege = createConditionObject(CONDITION_REGENERATION)
setConditionParam(conditionRege, CONDITION_PARAM_BUFF, true)
setConditionParam(conditionRege, CONDITION_PARAM_TICKS, regeseconds*1000)
setConditionParam(conditionRege, CONDITION_PARAM_HEALTHGAIN, 20)
setConditionParam(conditionRege, CONDITION_PARAM_HEALTHTICKS, 2000)

local conditionspeed = createConditionObject(CONDITION_HASTE)
setConditionParam(conditionspeed, CONDITION_PARAM_BUFF, true)
setConditionParam(conditionspeed, CONDITION_PARAM_TICKS, speedseconds*1000)
setConditionFormula(conditionspeed, 1.0, -86, 1.0, -86)

-- Configs of buffs

-- Set how many minutes delay you want the NPC to broadcast. --
local delayminutes = 120

-- Set the messages that you want to be broadcasted. --
local broadcastmessage = {'Buffer: Free regenation buff for everyone! Come to temple, free buff in 1 minute!' }

-- Main Code --
local messagecounter = 1
local timer = os.time()

function onThink()
	if os.time() - timer > delayminutes * 60 then
		broadcastMessage(broadcastmessage[messagecounter], 19)
		if messagecounter == #broadcastmessage then
			messagecounter = 1
		else
			messagecounter = messagecounter + 1
		end
		timer = os.time()
	end
end

function magicl(cid, message, keywords, parameters, node)
	if not npcHandler:isFocused(cid) then
		return false
	end

	if (isDruid(cid) or isSorcerer(cid)) and os.time() >= getCreatureStorage(cid, storage) then
		if doPlayerRemoveItem(cid,item,count) then
			doAddCondition(cid, conditionMagic)
			npcHandler:say('Your magic level has increased for 20 minutes!', cid)
			doCreatureSetStorage(cid, storage, os.time() + skillsseconds)
		else
			npcHandler:say('You don\'t have enough ' ..getItemNameById(item) .. '.', cid)
		end
	else
		npcHandler:say('You must be a druid or a sorcerer to receive this increment.', cid)
	end
end

function invisible(cid, message, keywords, parameters, node)
	if not npcHandler:isFocused(cid) then
		return false
	end

	if (isDruid(cid) or isSorcerer(cid)) and os.time() >= getCreatureStorage(cid, storage) then
		if doPlayerRemoveItem(cid,item,count) then
			npcHandler:say('You received invisibility for 20 minutes!', cid)
			doAddCondition(cid, combatInvisible)
			doCreatureSetStorage(cid, storage, os.time() + invisibleseconds)
		else
			npcHandler:say('You don\'t have enough ' ..getItemNameById(item) .. '.', cid)
		end
	else
		npcHandler:say('You must be a druid or a sorcerer to receive this increment.', cid)
	end
end

function melee(cid, message, keywords, parameters, node)
	if not npcHandler:isFocused(cid) then
		return false
	end

	if isKnight(cid) and os.time() >= getCreatureStorage(cid, storage) then
		if doPlayerRemoveItem(cid,item,count) then
			doAddCondition(cid, conditionMelee)
			npcHandler:say('Your Melee Skills has increased for 20 minutes!', cid)
			doCreatureSetStorage(cid, storage, os.time() + skillsseconds)
		else
			npcHandler:say('You don\'t have enough ' ..getItemNameById(item) .. '.', cid)
		end
	else
		npcHandler:say('You must be a knight to receive this increment.', cid)
	end
end

function distance(cid, message, keywords, parameters, node)
	if not npcHandler:isFocused(cid) then
		return false
	end

	if isPaladin(cid) and os.time() >= getCreatureStorage(cid, storage) then
		if doPlayerRemoveItem(cid,item,count) then
			doAddCondition(cid, conditionDistance)
			npcHandler:say('Your Distance Skill has increased for 20 minutes!', cid)
			doCreatureSetStorage(cid, storage, os.time() + skillsseconds)
		else
			npcHandler:say('You don\'t have enough ' ..getItemNameById(item) .. '.', cid)
		end
	else
		npcHandler:say('You must be a Paladin to receive this increment.', cid)
	end
end


function shield(cid, message, keywords, parameters, node)
	if not npcHandler:isFocused(cid) then
		return false
	end

	if (isPaladin(cid) or isKnight(cid)) and os.time() >= getCreatureStorage(cid, storage) then
		if doPlayerRemoveItem(cid,item,count) then
				doAddCondition(cid, conditionShield)
			npcHandler:say('Your Shielding Skill has increased for 20 minutes!', cid)
			doCreatureSetStorage(cid, storage, os.time() + skillsseconds)
		else
			npcHandler:say('You don\'t have enough ' ..getItemNameById(item) .. '.', cid)
		end
	else
		npcHandler:say('You must be a Paladin or a Knight to receive this increment.', cid)
	end
end


function magicshield(cid, message, keywords, parameters, node)
	if not npcHandler:isFocused(cid) then
		return false
	end

	if (isPaladin(cid) or isDruid(cid) or isSorcerer(cid)) and os.time() >= getCreatureStorage(cid, storage) then
		if doPlayerRemoveItem(cid,item,count) then
			doAddCondition(cid, combatUtamo)
			npcHandler:say('You received a Magic Shield for 20 minutes!', cid)
			doCreatureSetStorage(cid, storage, os.time() + magicshieldseconds)
		else
			npcHandler:say('You don\'t have enough ' ..getItemNameById(item) .. '.', cid)
		end
	else
		npcHandler:say('Knights can\'t receive this increment.', cid)
	end
end


function regener(cid, message, keywords, parameters, node)
	if not npcHandler:isFocused(cid) then
		return false
	end

	if isPlayer(cid) and os.time() >= getCreatureStorage(cid, storage) then
		if doPlayerRemoveItem(cid,item,count) then
			doAddCondition(cid, conditionRege)
			npcHandler:say('Your regeneration has increased for 20 minutes!', cid)
			doCreatureSetStorage(cid, storage, os.time() + regeseconds)
		else
			npcHandler:say('You don\'t have enough ' ..getItemNameById(item) .. '.', cid)
		end
	else
		npcHandler:say('You can\'t receive more increases.', cid)
	end
end


function speed(cid, message, keywords, parameters, node)
	if not npcHandler:isFocused(cid) then
		return false
	end

	if isPlayer(cid) and os.time() >= getCreatureStorage(cid, storage) then
		if doPlayerRemoveItem(cid,item,count) then
			doAddCondition(cid, conditionspeed)
			npcHandler:say('Your speed has increased for 20 minutes!', cid)
			doCreatureSetStorage(cid, storage, os.time() + speedseconds)
		else
			npcHandler:say('You don\'t have enough ' ..getItemNameById(item) .. '.', cid)
		end
	else
		npcHandler:say('You can\'t receive more increases.', cid)
	end
end
-- Buff Config End --

keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can increase your {melee}, {distance}, {shielding}, {magic level}, {regeneration}, {invisibility}, {magic shield} and {speed}"})

local node1 = keywordHandler:addKeyword({'magic level'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to increase your magic level for a certain time?'})
	node1:addChildKeyword({'yes'}, magicl, {npcHandler = npcHandler, onlyFocus = true, reset = true})
	node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back if you want an upgrade in your skills.', reset = true})

local node2 = keywordHandler:addKeyword({'invisibility'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to be invisible for a certain time?'})
	node2:addChildKeyword({'yes'}, invisible, {npcHandler = npcHandler, onlyFocus = true, reset = true})
	node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back if you want an upgrade in your skills.', reset = true})

local node3 = keywordHandler:addKeyword({'melee'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to increase your melee skills for a certain time?'})
	node3:addChildKeyword({'yes'}, melee, {npcHandler = npcHandler, onlyFocus = true, reset = true})
	node3:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back if you want an upgrade in your skills.', reset = true})

local node4 = keywordHandler:addKeyword({'distance'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to increase your distance skills for a certain time?'})
	node4:addChildKeyword({'yes'}, distance, {npcHandler = npcHandler, onlyFocus = true, reset = true})
	node4:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back if you want an upgrade in your skills.', reset = true})

local node5 = keywordHandler:addKeyword({'shielding'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to increase your shielding skill for a certain time?'})
	node5:addChildKeyword({'yes'}, shield, {npcHandler = npcHandler, onlyFocus = true, reset = true})
	node5:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back if you want an upgrade in your skills.', reset = true})

local node6 = keywordHandler:addKeyword({'magic shield'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to receive a magic shield for a certain time?'})
	node6:addChildKeyword({'yes'}, magicshield, {npcHandler = npcHandler, onlyFocus = true, reset = true})
	node6:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back if you want an upgrade in your skills.', reset = true})

local node7 = keywordHandler:addKeyword({'regeneration'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to increase your regeneration for a certain time?'})
	node7:addChildKeyword({'yes'}, regener, {npcHandler = npcHandler, onlyFocus = true, reset = true})
	node7:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back if you want an upgrade in your skills.', reset = true})

local node8 = keywordHandler:addKeyword({'speed'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to increase your speed for a certain time?'})
	node8:addChildKeyword({'yes'}, speed, {npcHandler = npcHandler, onlyFocus = true, reset = true})
	node8:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back if you want an upgrade in your skills.', reset = true})

npcHandler:addModule(FocusModule:new())