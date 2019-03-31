enableSaving [false,false];

/******* FUNCTIONAL CARRIER SCRIPT *************************************************************************************
Copy these lines to your init.sqf file and replace "freedom_new" with the name you put on your carrier in the editor
****REQUIRES an object placed out of the way on flat ground and clear of obstacles named "safeVehicleSpawnPoint" for
****vehicles to be spawned at then moved from
****VERY IMPORTANT - do not place any "sleep" or "waitUntil" before this code executes!!!

CONTROL OF WHO HAS DECK COMMANDER
Set all players to have with the variable below - or - copy the code in the next line in specific player unit inits in the editor:
handle = []execVM "FunctionalCarrier\scripts\initDeckCommander.sqf";
*************************************************************/

//SET THE NAME OF THE CARRIER YOU PLACED IN THE EDITOR
//set the line below to be = to the name you assign the aircraft carrier in the editor
ac = freedom_new;

//OPTIONAL FEATURES TURN ON OR OFF WITH TRUE/FALSE
artilleryOnDeck = TRUE; 				//will place RHS m119 gun on the deck
carrierHasAA = TRUE; 					//will place AA guns on the carrier (will turn dataLink off so they are not over powered)
allPlayersAreDeckCommanders = FALSE;	//will allow all players to spawn in any assets and removed them from the deck
useRespawnVehicles = TRUE; 				//will make medical vehicles repawn positions
farpOnDeck = TRUE; 						//will place a Forward Ammunition and Repair Point on the deck for reloads, refuel and repairs


//*******************************************************DO NOT EDIT BELOW HERE****************************************************

if (isServer) then {[]execVM "FunctionalCarrier\scripts\initFunctionalCarrierServer.sqf"; publicVariable "useRespawnVehicles";};
if (allPlayersAreDeckCommanders) then {
  if (hasInterface) then {[]execVM "FunctionalCarrier\scripts\initDeckCommander.sqf";};
};
[]execVM "FunctionalCarrier\scripts\FCbriefing.sqf";
[]spawn FC_fnc_admin;
//*********************************END OF FUNCTIONAL CARRIER SCRIPT*******************************************************