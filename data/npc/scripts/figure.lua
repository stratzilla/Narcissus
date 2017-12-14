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
	 if getPlayerStorageValue(cid, 65430) == -1 then
		npcHandler:say('Now listen carefully, in wich house ground is square. Push lever wich of them is in your opinion!', cid)
        setPlayerStorageValue(cid,65432,1)
        else
			setPlayerStorageValue(cid,65432,-1)
			setPlayerStorageValue(cid,65430,-1)			
			doPlayerAddItem(cid, 6527, 50)
		doPlayerAddExp(cid, 1500000)	
            npcHandler:say('Very good thanks for your time. Cya!', cid)
			addEvent(doTeleportThing, 1, cid , {x = oldx(cid), y = oldy(cid), z = oldz(cid)})
			end
        end
		
function awsomeEventQuit(cid, type, msg, message, keywords, parameters, node)
		addEvent(doTeleportThing, 1, cid , {x = oldx(cid), y = oldy(cid), z = oldz(cid)})
		npcHandler:say("As you wish.", cid)
	return true
end
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Don\'t worry, everything will be fine, lets speak about {event} part."})

local node1 = keywordHandler:addKeyword({'event'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I\'m glad to see you here, can you help me ?'})
node1:addChildKeyword({'yes'}, awsomeEvent, {npcHandler = npcHandler, onlyFocus = true, reset = true})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Find a way how to out from here self !', reset = true})
npcHandler:addModule(FocusModule:new())

local node2 = keywordHandler:addKeyword({'quit'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Are you sure about quiting?'})
node2:addChildKeyword({'yes'}, awsomeEventQuit, {npcHandler = npcHandler, onlyFocus = true, reset = true})
node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Then stay here!', reset = true})
npcHandler:addModule(FocusModule:new())


