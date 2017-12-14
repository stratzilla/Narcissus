local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local t = {}

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)  npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                      npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
    end

	local b

	if not t[cid]  then
		if msgcontains(msg,'infested area') or msgcontains(msg,'demon oak') or msgcontains(msg,'icon') then
			if msgcontains(msg,'infested area') or msgcontains(msg,'demon oak') then
				if getCreatureStorage(cid, 35700) == -1 then
					npcHandler:say('How do you know? Did you go into the infested area?', cid)
					b = 1
				else
					npcHandler:say('Did you really defeat it?', cid)
					b = 2
				end
			else
				npcHandler:say('Do you seek for the holy icon?', cid)
				b = 3
			end
		end
	elseif t[cid] == 1 then
		if msgcontains(msg,'yes') then
			if getPlayerLevel(cid) >= 120 then
				npcHandler:say('I have searched for dareful heroes like you. ...', cid)
				npcHandler:say('Take this axe and bring that damn demon oak down, report back to me when you are done. The world depends on you now, kid. ...', cid)
				npcHandler:say('Good luck, I mean it.', cid)
				doCreatureSetStorage(cid, 35700, 0)
				doPlayerAddItem(cid,8293,1)
				doPlayerAddItem(cid,10305,1)
			else
				npcHandler:say('Sorry young adventurer, you must be level 120 or higher!',cid)
			end
		end
	elseif t[cid] == 2 then
		if msgcontains(msg,'yes') then
			local s = getCreatureStorage(cid,35700)
			if s == 1 then
				npcHandler:say('You chopped down the demon oak?!? Unbelievable!! Let\'s hope it doesn\'t come back. As long as evil is still existent in the soil of the plains, it won\'t be over. Still, the demons suffered a setback, that\'s for sure. ...', cid)
				npcHandler:say('For your brave action, I tell you a secret which has been kept for many many years. There is an old house south of the location where you found the demon oak. There should be a grave with the name \'Yesim Adeit\' somewhere close by. ...', cid)
				npcHandler:say('It belongs to a Daramian nobleman named \'Teme Saiyid\'. I knew him well and he told me -almost augured- that someone will come who is worthy to obtain his treasure. I\'m sure this \'someone\' is you. Good luck in finding it!', cid)
				doCreatureSetStorage(cid, 35700, 2)
			else
				npcHandler:say(s == 0 and 'You haven\'t killed it yet, you liar!' or 'I know it already.',cid)
			end
		end
	elseif t[cid] == 3 then
		if msgcontains(msg,'yes') then
			if getPlayerItemCount(cid,10305) == 0 then
				doPlayerAddItem(cid,10305,1)
				npcHandler:say('Here you go, better luck this time!',cid)
			else
				npcHandler:say('Be gone, filthy liar!',cid)
			end
		end
	end
	t[cid] = b
	return true
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())