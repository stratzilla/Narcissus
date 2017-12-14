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
	 if getPlayerStorageValue(cid, 65410) == -1 then
		npcHandler:say('Now listen carefully, find for me blue stone. I have no clue wich of them could be!', cid)
        setPlayerStorageValue(cid,65411,1)
        else
			setPlayerStorageValue(cid,65411)
			setPlayerStorageValue(cid,65410)			
			doPlayerAddItem(cid, 6527, 50)
			doPlayerAddExp(cid, 15000000)
            npcHandler:say('Very good thanks for your help. Cya!', cid)
			addEvent(doTeleportThing, 2000, cid , {x = 32369, y = 32241, z = 7})
			end
        end

keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Don\'t worry, everything will be fine, lets speak about {event} part."})

local node1 = keywordHandler:addKeyword({'event'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I\'m glad to see you here, can you help me ?'})
    node1:addChildKeyword({'yes'}, awsomeEvent, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Find a way how to out from here self !', reset = true})
npcHandler:addModule(FocusModule:new())

local travelNode1 = keywordHandler:addKeyword({'quit'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Are you sure?'})
	travelNode1:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, level = 1, cost = 0, destination = {x=1000, y=1000, z=7} })
	travelNode1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Good to know.'})



