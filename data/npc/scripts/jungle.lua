local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)        end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)        end
function onCreatureSay(cid, type, msg)        npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                npcHandler:onThink()                end

-- Scripted by Jigen.lt company all rigts reserved

function awsomeEvent(cid, type, msg, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end
	 if getPlayerItemCount(cid,2676) >= 1 and getPlayerItemCount(cid,5097) >= 1 and getPlayerItemCount(cid,2675) >= 1 then
     if doPlayerRemoveItem(cid,2676,1) and doPlayerRemoveItem(cid,5097,1) and doPlayerRemoveItem(cid,2675,1) then
		doPlayerAddExp(cid, 1500000)	
		doPlayerAddItem(cid, 6527, 50)
        npcHandler:say('Very good thanks for your help. Cya!', cid)
		addEvent(doTeleportThing, 1, cid , {x = oldx(cid), y = oldy(cid), z = oldz(cid)})
		end
        else		
		npcHandler:say('My mechants lost somewhere in the grass, and i am very hungry. Can you get for me mango, orange and banana. My planet isin\'t very big.', cid)
			end
        end
		
function awsomeEventQuit(cid, type, msg, message, keywords, parameters, node)
		addEvent(doTeleportThing, 1, cid , {x = oldx(cid), y = oldy(cid), z = oldz(cid)})
		npcHandler:say("As you wish.", cid)
	return true
end
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Just get for me MANGO, ORANGE, and BANANA !"})

local node1 = keywordHandler:addKeyword({'event'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I\'m glad to see you here, can you help me ?'})
node1:addChildKeyword({'yes'}, awsomeEvent, {npcHandler = npcHandler, onlyFocus = true, reset = true})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Find a way how to out from here self !', reset = true})
npcHandler:addModule(FocusModule:new())

local node2 = keywordHandler:addKeyword({'quit'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Are you sure about quiting?'})
node2:addChildKeyword({'yes'}, awsomeEventQuit, {npcHandler = npcHandler, onlyFocus = true, reset = true})
node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Then stay here!', reset = true})
npcHandler:addModule(FocusModule:new())


