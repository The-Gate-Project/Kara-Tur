// A Slow Boat from Kara-Tur
//Monk gives quest dialog - KTDLG.d

//Contents
//First meeting, no quest
//Subsequent meetings, no quest
//Quest, first meeting
//Quest, subsequent meeting

BEGIN ~KTQDLG~

//First Meeting

APPEND ~KTQDLG~

IF ~NumTimesTalkedTo(0) !GlobalGT("KTQuest","%FriendlyArmInn%",1)~THEN BEGIN KTMonk1
SAY @100 /* A favor great indeed ... ask I would of you? */     
IF ~~ THEN REPLY @101 /* Yes, what is the favor you would ask of me? */ GOTO KT1_2
IF ~~ THEN REPLY @102 /* No, not right now. */ DO ~SetNumTimesTalkedTo(0)~ EXIT
END

IF ~~ THEN BEGIN KT1_2
SAY @103 /* Traveled far have we three ... many moons seen we have, across vast seas traveled far and long have we. Many a treasure collected, to sell our only wish ... to the port Baldur's we seek. Two moons ago trouble did come, sailing close to shore ... warned many times I did, much too close to shore said I ... songs of love and lingering ... in the souls of sailers strong, did happen a lust unnatural it was. Wake I did to trouble and dismay ... the ship is no wagon of land you see, and to shore the ship sailed, damaged greatly I fear ... chilled and bitter the water it was. Beauty and charm was upon all of our crew, friends now enemies all but we three. Forces greater than we could oppose, to this place flee we did, to rest ... and help we now seek. Help the three from Kara-Tur may thee? */
IF ~~ THEN REPLY @104 /* Yes, we will help as best we can. What can we do? */ DO ~SetGlobal("KTQuest","%FriendlyArmInn%",2)~ GOTO KT1_3
IF ~~ THEN REPLY @105 /* No, I am afraid you are too hard to understand, and we are too busy to attempt to make sense of all this ... good day */ DO ~SetNumTimesTalkedTo(0)~ EXIT
END

IF ~~ THEN BEGIN KT1_3
SAY @106 /* Bag of Red left I did ... haste you see needed we three ... magic and sealed this Bag of Red be, useful not but to only me. Frustrated the enemies will be, as no treasure exist but this Bag of Red. By fight or by stealth, perhaps parlay ... whatever may be, bring this Bag of Red to me, treasures of places far and wide, sell to you fair you'll see.

Ran we did fast and far, long it was not ago ... two moons for me ... where it is still remember I do. Travel to the south ... then west you'll go, to the shore and sandy coast. Ship you will see, abandoned with haste, gaurded presummed by the crew of we three, as still the songs linger doest believes me. Bag of Red you will find, if look hard and long you will try. Return to me as quick you can, Bag of Red you bring to me.

Bag of Red indeed has weight, lift cannot a giant with strength, need my crystal for the bag to carry ... give to you with trust I in you have. Little we have left, we meager three, defend your ears and heart will these, take them all free from me. Clarity of mind will need thee, as the songs are magical and will compell ... then all but yee strongest enemies will be. Potions I have, gaurd against songs they yet might ... if potions you want? */

IF ~~ THEN REPLY @107 /* Yes, any help you can give would be welcomed. */ DO ~GiveItemCreate("POTN21",Player1,6,0,0)~ DO ~GiveItemCreate("KTSnow",Player1,1,0,0)~
EXIT
END

IF ~!GlobalLT("KTQuest","%FriendlyArmInn%",2) !GlobalGT("KTQuest","%FriendlyArmInn%",3)~THEN BEGIN KTMonk1
SAY @100 /* A favor great indeed ... ask I would of you? */     
IF ~~ THEN EXIT
END

IF ~Global("KTQuest","%FriendlyArmInn%",4)~ THEN BEGIN KTMonk4
SAY @108 /* Bag of Red I sense with you! Toils and troubles you have seen, a gift from we three to bestow upon thee. Two there were but lost one did I, to Chaos I assume ... but seek each other they will. Sense to you it will make, as time and troubles pass. For now we trade our gifts to one another */
IF ~~ THEN REPLY @109 /* Yes ... here we have your Red Bag. */ DO ~TakePartyItem("KTSnow")~ DO ~TakePartyItem("KTRedB")~ DO ~GiveItemCreate("KTHlm01",Player1,0,0,0)~ DO ~SetNumTimesTalkedTo(4)~ DO ~SetGlobal("KTQuest","%FriendlyArmInn%",5)~ EXIT
END

IF ~Global("KTQuest","%FriendlyArmInn%",5)~THEN BEGIN KTMonk5
SAY @110 /* Promises made, promises kept ... now see gifts from afar? */
IF ~~ THEN REPLY @111 /* Yes, what can you show me today? */ DO ~StartStore("KTStore",LastTalkedToBy(Myself))~ DO ~SetNumTimesTalkedTo(4)~ EXIT
IF ~~ THEN REPLY @102 /* No, not right now. */ DO ~SetNumTimesTalkedTo(4)~ EXIT
END
END
