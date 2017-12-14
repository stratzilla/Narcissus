local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()							npcHandler:onThink()						end

local t = {}

function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	elseif msgcontains(msg, "teleport") then
		selfSay("Do you want to be teleported to your house door?", cid)
		t[cid] = true
	elseif msgcontains(msg, "yes") and t[cid] then
		local house = getHouseByPlayerGUID(getPlayerGUID(cid))
		t[cid] = nil
		if house then
			local h = getHouseInfo(house)
			if (h ~= 18 and h ~= 24) or isPremium(cid) then
				doTeleportThing(cid, h.entry, false)
				doSendMagicEffect(h.entry, CONST_ME_TELEPORT)
			else
				selfSay("You don't have VIP!", cid)
			end
		else
			selfSay("You don't own any houses!", cid)
		end
	end

	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())