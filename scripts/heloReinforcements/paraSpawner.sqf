if !(isServer) exitWith {};
_helo = _this select 0;
_heloPos = getPos _helo;

//hint "Paradropping troops on Pyrgos";
sleep 7;
_group = [getPos infSafeSpawn, independent, selectRandom [4, 8, 10]] call BIS_fnc_spawnGroup;
sleep 2;
_units = units _group;

{
  _chute = createVehicle ["Steerable_Parachute_F", [(getPos _helo) select 0, (getPos _helo) select 1, ((getposATL _helo) select 2) + 1000], [], 0, "FLY"];
  
  sleep .5;
  _x attachTo [_chute,[0,0,0]];
  [_x, _chute] spawn {
    _unit = _this select 0;
	_chute = _this select 1;
	waitUntil {(getPosATL _unit) select 2 < 5};
	detach _unit;
	deleteVehicle _chute;
    if (_unit == leader _unit) then {
	  [group _unit, getPos pyrgosCenter, 400] call BIS_fnc_taskPatrol;
    };
  };
}forEach _units;
