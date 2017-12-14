local bossCreatures =
{
	["frostfur"] = {bossStorage = 42300},
	["bloodpaw"] = {bossStorage = 42301},
	["bovinus"] = {bossStorage = 42302},
	["achad"] = {bossStorage = 42303},
	["colerian the barbarian"] = {bossStorage = 42304},
	["the hairy one"] = {bossStorage = 42305},
	["axeitus headbanger"] = {bossStorage = 42306},
	["rocky"] = {bossStorage = 42307},
	["cursed gladiator"] = {bossStorage = 42308},
	["orcus the cruel"] = {bossStorage = 42309},
	["avalanche"] = {bossStorage = 42310},
	["kreebosh the exile"] = {bossStorage = 42311},
	["the dark dancer"] = {bossStorage = 42312},
	["the hag"] = {bossStorage = 42313},
	["slim"] = {bossStorage = 42314},
	["grimgor guteater"] = {bossStorage = 42315},
	["drasilla"] = {bossStorage = 42316},
	["spirit of earth"] = {bossStorage = 42317},
	["spirit of water"] = {bossStorage = 42318},
	["spirit of fire"] = {bossStorage = 42319},
	["webster"] = {bossStorage = 42320},
	["darakan the executioner"] = {bossStorage = 42321},
	["norgle glacierbeard"] = {bossStorage = 42322},
	["the pit lord"] = {bossStorage = 42323},
	["svoren the mad"] = {bossStorage = 42324},
	["the masked marauder"] = {bossStorage = 42325},
	["gnorre chyllson"] = {bossStorage = 42326},
	["fallen mooh'tah master ghar"] = {bossStorage = 42327},
	["deathbringer"] = {bossStorage = 42328},
	["the obliverator"] = {bossStorage = 42329}
}
 
local msgType = MESSAGE_STATUS_CONSOLE_ORANGE
 
function onKill(cid, target, lastHit)
 
local creature = bossCreatures[getCreatureName(target):lower()]
 
	if creature then
		if isPlayer(target) then 
			return true 
		end
		
		if getPlayerStorageValue(cid,42352) == 1 then
			setPlayerStorageValue(cid,creature.bossStorage, 1)
		end
		
		if getPlayerStorageValue(cid,42309) == 1 and getPlayerStorageValue(cid,42355) == -1 then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Congraulations, you have slain Orcus the Cruel and completed the greenhorn tier challenges!")
			setPlayerStorageValue(cid,42355, 1)
			setPlayerStorageValue(cid,42366, 1) -- can open reward door
			setPlayerStorageValue(cid,42111, -1)
		elseif getPlayerStorageValue (cid,42319) == 1 and getPlayerStorageValue(cid,42355) == 1 then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Congraulations, you have slain the Spirit of Fire and have completed the scrapper tier challenges")
			setPlayerStorageValue(cid,42355, 2)
			setPlayerStorageValue(cid,42376, 1) -- can open reward door
			setPlayerStorageValue(cid,42111, -1)
		elseif getPlayerStorageValue (cid,42329) == 1 and getPlayerStorageValue(cid,42355) == 2 then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Congraulations, you have slain The Obliverator and have completed the arena!")
			setPlayerStorageValue(cid,42355, 3)
			setPlayerStorageValue(cid,42386, 1) -- can open reward door
			setPlayerStorageValue(cid,42111, -1)
		end
	return true
	end
	return true
end