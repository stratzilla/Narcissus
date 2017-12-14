local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

function chicken(cid, message, keywords, parameters, node)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
        if getPlayerItemCount(cid,2195) >= 1 then
			if doPlayerRemoveItem(cid,2195,1)  then
				npcHandler:say('Here you go!', cid)
				doPlayerAddItem(cid,5891,1)
			end
        else
            npcHandler:say('You don\'t have the necessary item!', cid)
    end
end	

function sweat(cid, message, keywords, parameters, node)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
        if getPlayerItemCount(cid,2475) >= 4 then
			if doPlayerRemoveItem(cid,2475,4)  then
				npcHandler:say('Here you go!', cid)
				doPlayerAddItem(cid,5885,1)
			end
        else
            npcHandler:say('You don\'t have the necessary items!', cid)
    end
end	

function sulphur(cid, message, keywords, parameters, node)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
        if getPlayerItemCount(cid,2392) >= 3 then
			if doPlayerRemoveItem(cid,2392,3)  then
				npcHandler:say('Here you go!', cid)
				doPlayerAddItem(cid,5904,1)
			end
        else
            npcHandler:say('You don\'t have the necessary items!', cid)
    end
end	

function spirit(cid, message, keywords, parameters, node)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
        if getPlayerItemCount(cid,2498) >= 2 then
			if doPlayerRemoveItem(cid,2498,2)  then
				npcHandler:say('Here you go!', cid)
				doPlayerAddItem(cid,5884,1)
			end
        else
            npcHandler:say('You don\'t have the necessary items!', cid)
    end
end	

local node1 = keywordHandler:addKeyword({'chicken'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to exchange a pair of boots of haste for an enchanted chicken wing?'})
    node1:addChildKeyword({'yes'}, chicken, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Okay.', reset = true})

local node2 = keywordHandler:addKeyword({'sweat'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to exchange 4 warrior helmets for a flask of warrior\'s sweat?'})
    node2:addChildKeyword({'yes'}, sweat, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Okay.', reset = true})
	
local node3 = keywordHandler:addKeyword({'sulphur'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to exchange 3 fire swords for some magic sulphur?'})
    node3:addChildKeyword({'yes'}, sulphur, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node3:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Okay.', reset = true})
	
local node4 = keywordHandler:addKeyword({'spirit'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to exchange 2 royal helmets for a spirit container?'})
    node4:addChildKeyword({'yes'}, spirit, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node4:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Okay.', reset = true})

npcHandler:addModule(FocusModule:new())