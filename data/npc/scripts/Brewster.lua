local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
local Topic = {}
 
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end
 
function creatureSayCallback(cid, type, msg)
	local n
	if not npcHandler:isFocused(cid) then
		if msgcontains(msg, 'hello') or msgcontains(msg, 'hi') then
			npcHandler:say('G...greetings <hicks>.', cid)
			npcHandler:addFocus(cid)
		else
			return false
		end
	elseif msgcontains(msg, 'bye') or msgcontains(msg, 'farewell') then
		npcHandler:say('Exactly! <hicks>', cid)
		npcHandler:releaseFocus(cid)
	elseif msgcontains(msg, 'divorce') and getPlayerPartner(cid) > 0 then
		npcHandler:say('<hicks> What, a divorce? Do you yearn for the joys of singledom? <hicks> I know it well, my marriage was a battleground... but less of that. Are you unhappily married?', cid)
		n = 1
	elseif Topic[cid] == 1 and msgcontains(msg, 'yes') then
		npcHandler:say('There\'s no justice in the world when a pretty lady like yourself is treated badly. <hicks> Not that I have a special connection to the Gods or anything <hicks> - but I can arrange your d... divorce, if that is what you wish. <hicks> Do you?', cid)
		n = 2
	elseif Topic[cid] == 2 and msgcontains(msg, 'yes') then
		npcHandler:say('Hm. You see, uh... I would do it for free, but <hicks> I could in fact use some cash. Do me a favour and \'donate\' 5000 gold coins so I can buy some, uhm... bibles. Then I\'ll do the rest. <hicks> What do you say? ', cid)
		n = 3
	elseif Topic[cid] == 3 and msgcontains(msg, 'yes') then
		npcHandler:say('No p... problem. And no turning back now! But, just to be certain, <hicks> - are you sure that you want to free yourself from the misery of being tied to the good-for-nothing person you married in a moment of madness? ', cid)
		n = 4
	elseif Topic[cid] == 4 and msgcontains(msg, 'yes') then
		if doPlayerRemoveMoney(cid, 5000) then
			npcHandler:say('Ehem. <hicks> By the Gods and b... beer and blah blah blah... let this unhappy and mistaken marriage come to an end. All b... <burp> bonds be broken and so on. Thanks for the beer - I mean bible money. <hicks> Don\'t make the same mistake again!', cid)
			local partner = getPlayerPartner(cid)
			if partner ~= 0 then
				local t = {cid}
				local player = getPlayerByGUID(partner)
				if player then
					table.insert(t, player)
				else
					db.executeQuery("UPDATE `players` SET `marriage` = 0 WHERE `id` = " .. partner)
					db.executeQuery("UPDATE `player_items` SET `itemtype` = 10510 WHERE `player_id` = " .. partner .. " AND `itemtype` = 10502")
				end
				for _, pid in ipairs(t) do
					doPlayerSetPartner(pid, 0)
					local v = getCreatureOutfit(pid)
					if isInArray({328, 329}, v.lookType) then
						v.lookType = getPlayerSex(pid) == 0 and 136 or 128
						doCreatureChangeOutfit(pid, v)
					end
					doPlayerRemoveOutfitId(pid, 34)
					while doPlayerRemoveItem(pid, 10502, 1) do
						doPlayerAddItem(pid, 10510, 1)
					end
				end
			end
		else
			npcHandler:say('Damn, I bet <hicks> your cheating spouse took all of your money <hicks> from you. You\'re as poor as a church mouse. <hicks>', cid)
		end
	end
	Topic[cid] = n
	return true
end
 
npcHandler:setMessage(MESSAGE_FAREWELL, "Bye ... and now I'll have a quick drink.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Bye ... and now I'll have a quick drink.")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)