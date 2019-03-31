if (isDedicated) exitWith {};
if (!isNil {imADeckCommanderAlready}) exitWith {systemChat "initDeckCommander.sqf prevented from running a second time.";};
imADeckCommanderAlready = true;
player sideChat "I'm a Deck Commander and I'm ok...";


waitUntil {!isNil {functionalCarrierServerInitialized}};
waitUntil {functionalCarrierServerInitialized == "completed"};  //must wait until the server script actually creates the signs for the addActions


[] call FC_fnc_vehicleLists; //processes available vehicles and creates addActions on the signs
[] call FC_fnc_stowAction; //creates addActions for stowing spawned vehicles that are on the deck
//Respawn event handler will ensure that the stow action is restored if player respawns
player addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];
	[] call FC_fnc_stowAction;
}];
