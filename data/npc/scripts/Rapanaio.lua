--\ -- 97645-- /-
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local t = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg) end
function onThink()					npcHandler:onThink() end

local MonsterLoots = {
DocPerhaps = {xxxx, xxxx, xxxx, xxxx},
-------------{Mighty Helm Of Green Sparks, a Trousers Of The Ancients, a Meat Shield, or a Glutton's Mace.}
Dirbeard = {xxxx, xxxx, xxxx, xxxx},
-----------{an Odd Hat, The Shield Nevermourn, a Pointed Rabbitslayer or a Helmet Of Nature.}
Mephiles = {xxxx, xxxx, xxxx, xxxx},
-----------{a Stale Bread Of Ancientness, a Poet's Fencing Quill, The Rain Coat or a Shield Of The White Knight.}
Boogey = {xxxx, xxxx, xxxx},
--------{a Heavy Metal T-shirt, a Club Of The Fury or a Scythe Of The Reaper.}
Monstor = {xxxx, xxxx, xxxx, xxxx},
----------{a Helmet Of Ultimate Terror, a Farmer's Avenger, a Shield Of Care or an Incredible Mumpiz Slayer}
}

local items = {xxxx, xxxx, xxxx, xxxx, xxxx, xxxx, xxxx}
---------------Mechanichal Fishing Rod, Mechanichal Fish, Vial< of rum, Vial< of juice, Machine, Nautical Map, Fan club Membership Card
local storage = 97645

local IsleOfEvil = {x=EDIT, y=EDIT, z=EDIT}
local back = {x=EDIT, y=EDIT, z=EDIT}


function greetCallback(cid)
	t[cid] = nil
	return true
end

function creatureSayCallback(cid, type, msg)
	local n
	if msgcontains(msg, 'isle of evil') then
		if getCreatureStorage(cid, 97645) == -1 then
			npcHandler:say({"I KNOW it's out there! And I have proof! You see, I have constructed an evil-o-meter! It is an {invention} that locates places of great {evil}, such as the Ghostlands, the Plains of Havoc and the Edron Ruins. ...", "But then it registered another impulse. I tried my best to locate this impulse, believing it would probably point to another well known source of evil like the Hellgate. ...", "I was alarmed to realise that it was pointing to a remote isle that had been previously assumed to be uninhabited. I know that some horrendous evil lurks there. Some unspeakable horror, waiting to kill and devour unsuspecting travellers. ...", "I could not let that happen! So I did some research. Just as I was on the brink of giving up in desperation, I stumbled upon an ancient {text} that told of the Isle of Evil! ...", "Immediately, the nature of the threat I had discovered became alarmingly clear! All I needed was a hero and some transport. But would they listen?! NO! They {laughed} at me. Ignorance is Evil's helper! ...", "I still lack transport and a hero. Hmm .. seeing as I have no hero, you will have to do. What do you think? Are you willing to risk life and limb to save mankind? And womankind, of course?"}, cid)
			n = 1
		end
	elseif msgcontains(msg, 'mission') then
		local g = getCreatureStorage(cid, 97645)
		if g == -1 then
			npcHandler:say('You can\'t ask for missions yet.', cid)
		elseif g == 1 then
			npcHandler:say({"They say there's a positive side to everything! And in this case it is perfectly true! In order for you to reach the Isle of Evil and slay its unspeakable horrors we will first finish my latest invention! ...", "As you might have guessed I am a highly talented inventor. Still, even inventors sometimes need some kind of .. inspiration. I can't tell you too much about your next mission since our enemies might capture and torture you for information. ...", "I optimized my invention by studying fish. Suffice it to say, I need one further specimen to study to put the finishing touches on my machine. ...", "I am afraid I need a specific fish, of course, as an ordinary fish just won't do the trick. Actually it is not a real fish but a kind of machine with the likeness of a fish! ...", "Imagine what I could learn from such a fish! And imagine what harm could be done if this fish were to fall into the wrong hands! We must retrieve that fish! ...", "Apparently, the people in the city of Yalahar had a mechanical fish, fish which are essential for my research. ...", "Now those Yalahari are quite elusive and even if we could get in contact with one of them, buying a fish from them would surely cost a fortune which we don't posses. ...", "But my sources have informed me that some of these fish might have escaped into the local sewers! Based on my knowledge of the fish I have designed a mechanical fishing rod which you can use. ...", "You won't catch any other fish with it but without it you haven't a chance of catching a mechanical fish. You will need to use nails as bait. ...", "Well perhaps I should mention a minor, insignificant problem that might occur. ...", "Due to the metallic nature of the fishing rod there is the very remote possibility that you might get into contact with one of the electric eels that also live in the sewers. ...", "In which case you might feel a little tingle from a teency tiny electric shock. I can't tell what effect that might have on your health but you should probably be careful that you are not badly wounded while fishing. ...", "Hm, thinking about it, perhaps those eels are part of the evil plan to thwart our efforts, who knows? So are you ready for that mission?"}, cid)
			n = 2
		elseif g == 2 then
			npcHandler:say('Have you caught the mechanical fish?', cid)
			n = 3
		elseif g == 3 then
			npcHandler:say({"The machines of the .. uhm my inventions need a potent fuel. I have run hundreds of tests and found that only the most potent rum makes the most powerful fuel ...", "I did have enough rum to make the trip but .. well, you know .. the lads came over to celebrate my birthday and we ended up .. uhm testing the fuel .. Damn that tasty rum! Well its a risk of the job when the fuel tastes that good ...", "However, we will need some new fuel. 10 vials of rum exactly. ...", "Remember it has to be vials because after we got drunk one of the lads wandered of with my funnel thinking it was hat. Only vials will fit into my machine."}, cid)
			doCreatureSetStorage(cid, storage, 4)
		elseif g == 4 then
			npcHandler:say('Do you have the rum .. erm the fuel with you?', cid)
			n = 4
		elseif g == 5 then
			npcHandler:say('Now that we have the rum, I still desperately need a vial of fruit juice to keep things going. Just get me one so we can proceed.', cid)
			doCreatureSetStorage(cid,storage,6)
		elseif g == 6 then
				npcHandler:say('So you have brought me a vial of fruit juice?', cid)
				n = 5
		elseif g == 7 then
			npcHandler:say({"My invention is only as good as the engine that powers it. I need a high quality steam machine from the technomancers guild. You should ask my old mate Scutty about one. ...", "I have already sent him a request and some gold but chances are you will need to convince him somehow to lend us his precious machine."}, cid)
			doCreatureSetStorage(cid,storage,8)
		elseif g == 8 then
			npcHandler:say('Did you get the requested machine from Scutty?', cid)
			n = 6
		elseif g == 9 then
			npcHandler:say({"The evil we are fighting has not chosen the Isle of Evil on a mere whim. Quite the contrary, it has shown strategic genius by selecting an isle surrounded by hidden reefs and treacherous waters. ...", "This serves not only to conceal it from prying eyes, but it also poses a serious threat to anyone who wants to travel there. ...", "The sea around that isle is as dangerous as the isle and its inhabitants themselves. ...", "Without a proper map we are doomed! Doomed, I tell you! ...", "I have found out that a ship from the Explorers' Society charted the sea around the isle some years ago, so they should have some decent maps of that area ...", "According to my sources, the map is now being kept at one of their northern outposts. It is somewhere north east of Carlin, in a hamlet on the coast. Get that map and we'll soon be on our way to vanquish evil! ...", "And be warned: if the servants of evil have learned about the map it means not only the map and the Explorers' Society are in grave danger but also you and your mission could be in peril. Trust no one. ...", "Don't accept gifts from strangers and don't hitchhike in strangers' wagons. Don't sit with your back to the door in a tavern and what the heck would you be doing in a tavern while on an urgent mission anyway? ...", "Rest assured in the unfortunate case of your death, you will be avenged. Well, only in the unlikely case that you die while on this mission, of course."}, cid)
			doCreatureSetStorage(cid,storage,10)
		elseif g == 10 then
			npcHandler:say('So did you get that nautical map?', cid)
			n = 7
		elseif g == 11 then
			npcHandler:say({"While you were getting the map I put the finishing touches on our vessel. The machine works fine and with the improvements I have made, it should enable us to brave the seas to reach our destination. ...", "Meet me downstairs where you will learn more about our secret weapon."}, cid)
			doCreatureSetStorage(cid,97649,1)
			doCreatureSetStorage(cid,storage,12)
		elseif g == 12 then
			npcHandler:say({"Hello, my friend, what took you so long? Some sightseeing in my cavern, perhaps? You did not even notice me when I passed you in the cavern earlier. Tsk, you really should be more alert if you value your life. ...", "This here is my secret. An underwater boat! Evil will not even see us coming! I hope you are prepared for a big battle on that isle! If not, you had better go and get some additional resources and then return. So, do you feel ready for our trip?"}, cid)
			n = 8
		elseif g == 13 then
			npcHandler:say('Now that we have arrived you should waste no time and fight your way to the lair of evil and destroy its master before it\'s too late!', cid)
			doCreatureSetStorage(cid,storage,14)
		elseif g == 14 then
			if isInArray(MonsterLoots.DocPerhaps, getPlayerItemCount(cid)) > 0 and isInArray(MonsterLoots.Dirdbeard, getPlayerItemCount(cid)) > 0 and isInArray(MonsterLoots.Mephiles, getPlayerItemCount(cid)) > 0 and isInArray(MonsterLoots.Bogey, getPlayerItemCount(cid)) > 0 and isInArray(MonsterLoots.Monstor, getPlayerItemCount(cid)) > 0 and getPlayerItemCount(cid, items[7]) > 0 then
				npcHandler:say({"You made it?! Uhm, I mean of course you did! We did it! We have slain the master of all evil! The world will be a happier place from now on, thanks to our efforts. ...", "Concerning this membership card you have found, I think you should take it to King Tibianus, perhaps you will get a reward! Well, nothing stopping us going back, now, eh?"}, cid)
				n = 16
			else
				npcHandler:say('You have to loot at least 1 of each monster loot, to prove me what you did!', cid)
			end
		else
			npcHandler:say('There are no more missions available for you!', cid)
		end
	elseif t[cid] == 1 then
		if msgcontains(msg, 'yes') then
			npcHandler:say({"Although my instincts tell me to be wary of you, stranger, turning up so conveniently, I have no choice but to accept your help. ...", "Have a care! I have eyes like a hawk and am ever vigilant! If you even think about betraying me, I'll know! Well, I guess we had better talk about your first {mission}."}, cid)
			doCreatureSetStorage(cid,storage,1)
		else
			npcHandler:say('I better find someone brave then!', cid)
		end
	elseif t[cid] == 2 then
		if msgcontains(msg, 'yes') then
			npcHandler:say('Great. Here is your fishing rod. Happy fishing. Don\'t return without the mechanical fish. Make sure you are not followed!', cid)
			doCreatureSetStorage(cid,storage,2)
			doPlayerAddItem(cid, items[1], 1)
		else
			npcHandler:say('Next time maybe', cid)
		end
	elseif t[cid] == 3 then
		if msgcontains(msg, 'yes') then
			if doPlayerRemoveItem(cid, items[2], 1) then
				npcHandler:say('Interesting, a most interesting construction. A marvel of science. While I try to figure out how it works you might as well continue with your next mission.', cid)
				doCreatureSetStorage(cid,storage,3)
			else
				npcHandler:say('You have to bring me the mechanichal fish!', cid)
			end
		else
			npcHandler:say('Then go finish your mission!', cid)
		end
	elseif t[cid] == 4 then
		if msgcontains(msg, 'yes') then
			if doPlayerRemoveItem(cid, items[3], 10) then
				npcHandler:say({"You did it! Ye Gods, what a temptation! But I will not give in! I will put it into the machine as soon as possible. Oh and if you happen to see a dwarf wearing a funnel, please ask him to return it to me. ...", "But now let's talk about your next mission."}, cid)
				doCreatureSetStorage(cid,storage,5)
			else
				npcHandler:say('You have to bring me the rum!', cid)
			end
		else
			npcHandler:say('Then go finish your mission!', cid)
		end
	elseif t[cid] == 5 then
		if msgcontains(msg, 'yes') then
			if doPlayerRemoveItem(cid, items[4], 1) then
				npcHandler:say({"Ahhhh that juice was just what I needed. I haven't had any fruit juice for ages! You can't fight evil the whole day without allowing yourself a small treat! ...", "Though I bet it would have tasted better in a glass with one of those amusing umbrellas on top! But I don't blame you. ...", "I fear we hunters of evil must be content with the small pleasures life grants us. Now where were we? Oh, yes you are probably eager to learn about your next mission as part of our big plan!"}, cid)
				doCreatureSetStorage(cid,storage,7)
			else
				npcHandler:say('You have to bring me the juice!', cid)
			end
		else
			npcHandler:say('Then go finish your mission!', cid)
		end
	elseif t[cid] == 6 then
		if msgcontains(msg, 'yes') then
			if doPlayerRemoveItem(cid, items[5], 1) then
				npcHandler:say('Ah, marvellous. That\'s the little beauty I was looking for. It will fit perfectly into my invention. Not much longer and we can start on our journey. However, I have another mission for you.', cid)
				doCreatureSetStorage(cid,storage,9)
			else
				npcHandler:say('You have to bring me the machine!', cid)
			end
		else
			npcHandler:say('Then go finish your mission!', cid)
		end
	elseif t[cid] == 7 then
		if msgcontains(msg, 'yes') then
			if doPlayerRemoveItem(cid, items[6], 1) then
				npcHandler:say({"Hmm, what fine maps those explorers draw. Wouldn't it be a cunning idea to tattoo it on your back where evil would least expect to find it! I guess with a nail from my workshop and a bucket of old ship paint I could improvise that. ...", "On the other hand the forces of evil probably know all too well that I am cunning, so I have to surprise them with the unexpected! I'll just hide it in my beard! There we go. Now lets talk about our final mission."}, cid)
				doCreatureSetStorage(cid,storage,11)
			else
				npcHandler:say('You have to bring me the map!', cid)
			end
		else
			npcHandler:say('Then go finish your mission!', cid)
		end
	elseif t[cid] == 8 then
		if msgcontains(msg, 'yes') then
			npcHandler:say('You are aware that this could mean your death? I mean the evil is probably overpowering and .. and I will not be able to help you. I will have to stay with the boat to ensure the fight goes on even if you die. So, do you still think it is a good idea?', cid)
			n = 9
		else
			npcHandler:say('Next time maybe', cid)
		end
	elseif t[cid] == 9 then
		if msgcontains(msg, 'yes') then
			npcHandler:say({"Now seriously, we .. I mean, you don't have to do this! I would not blame you at all. You probably have plans for your future which don't contain being chained up in some madman's dungeon for the rest of your life, being cruelly tortured. ...", "Do you really want to take the risk upon yourself?"}, cid)
			n = 10
		else
			npcHandler:say('Next time maybe', cid)
		end
	elseif t[cid] == 10 then
		if msgcontains(msg, 'yes') then
			npcHandler:say('Are you absolutely sure?', cid)
			n = 11
		else
			npcHandler:say('Next time maybe', cid)
		end
	elseif t[cid] == 11 then
		if msgcontains(msg, 'yes') then
			npcHandler:say('Honestly?', cid)
			n = 12
		else
			npcHandler:say('Next time maybe', cid)
		end
	elseif t[cid] == 12 then
		if msgcontains(msg, 'yes') then
			npcHandler:say('This is your last chance - do you really want to do this?', cid)
			n = 13
		else
			npcHandler:say('Next time maybe', cid)
		end
	elseif t[cid] == 13 then
		if msgcontains(msg, 'yes') then
			npcHandler:say('Well .. I guess then it is time for us to depart, right?', cid)
			n = 14
		else
			npcHandler:say('Next time maybe', cid)
		end
	elseif t[cid] == 14 then
		if msgcontains(msg, 'yes') then
			npcHandler:say('I really hope I won\'t regret what you are doing here. Uhm, I mean I hope that we will not regret what we are doing, of course. We had better talk about your future mission when we arrive. So .. shall we really depart?', cid)
			n = 15
		else
			npcHandler:say('Next time maybe', cid)
		end
	elseif t[cid] == 15 then
		if msgcontains(msg, 'yes') then
			npcHandler:say('So be it!', cid)
			doCreatureSetStorage(cid,storage,13)
			doTeleportThing(cid, Isleofevil)
		else
			npcHandler:say('Next time maybe', cid)
		end
	elseif t[cid] == 16 then
		if msgcontains(msg, 'return') or msgcontains(msg, 'back') then
			npcHandler:say('Time to leave this unfriendly place, eh? So are you ready to depart?', cid)
			n = 17
		else
			npcHandler:say('Next time maybe', cid)
		end
	elseif t[cid] == 17 then
		if msgcontains(msg, 'yes') then
			npcHandler:say('I thought you were going to stay here forever. Let\'s go.', cid)
			doCreatureSetStorage(cid,storage,15)
			doTeleportThing(cid, back)
		else
			npcHandler:say('Next time maybe', cid)
		end
	end

	t[cid] = n
	return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())