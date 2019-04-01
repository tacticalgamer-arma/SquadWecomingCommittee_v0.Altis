if !(isServer) exitWith {};

//to monitor the number of enemy Independent infantry in Pyrgos and send reinforcements very 10 minutes if less than 20
_run = true;

while {_run} do {
  _numberOfEiInPyrgos = 0;
  {
    if (alive _x && _x distance2d pyrgosCenter < 700 && vehicle _x == _x) then {
	  _numberOfEiInPyrgos = _numberOfEiInPyrgos + 1;
	};
  }forEach allUnits;
  
  if (_numberOfEiInPyrgos < 20) then {
    //systemChat "Spawning reinforcements via paradrop";
	//run helo spawning script
	_heloSpawn = []execVM "scripts\heloReinforcements\heloSpawner.sqf";
  };
  
  //systemChat format ["There are %1 enemy infantry units within Pyrgos.", _numberOfEiInPyrgos];
  sleep 600;
};