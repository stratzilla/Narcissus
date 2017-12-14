local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local t = {}
function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid)                        end
function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid)                     end
function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg)                end
function onThink()                                      npcHandler:onThink()                                    end

local storage = 98238

function creatureSayCallback(cid, type, msg)
	--[[
	REMEMBER TO SET YOUR STORAGE AS YOURSTORAGE!
	]]--
	if(msgcontains(msg, 'piece of draconian steel') or msgcontains(msg, 'obsidian knife')) then
		local s = getPlayerStorageValue(cid, storage)
		if(s == -1) then
			npcHandler:say("You bringing me draconian steel and obsidian lance in exchange for obsidian knife?", cid)
			setPlayerStorageValue(cid, storage, 1)
		elseif(s == 1) then
			npcHandler:say("Did you bring me the draconian steel and obsidian lance in exchange for obsidian knife?", cid)
			t[cid] = 1
		elseif(s == 2) then
			npcHandler:say("Sorry no more trade with you.", cid)
		end
	elseif t[cid] == 1 then
		if msgcontains(msg, 'yes') then
			if doPlayerRemoveItem(cid,2425,1) and doPlayerRemoveItem(cid,5889,1) and getPlayerStorageValue(cid, storage) == 1 then
				npcHandler:say("Here you have it.", cid)
				doPlayerAddItem(cid, 5908, 1)
				setPlayerStorageValue(cid, storage, 2)
			else
				npcHandler:say("You don't have the neccesary items.", cid)
			end
		else
			npcHandler:say("Then not.", cid)
		end
		t[cid] = nil
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())