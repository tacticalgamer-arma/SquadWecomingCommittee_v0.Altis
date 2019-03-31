//function by Unkl of www.TacticalGamer.com
//to watch if player logs in as admin and then give them Deck Commander
_run = true;
while {_run} do {
  if (serverCommandAvailable "#lock") then {
    handle = []execVM "FunctionalCarrier\scripts\initDeckCommander.sqf";
	systemChat "Admin detected, granting Deck Commander...";
	_run = false;
  };
  sleep 10;
};