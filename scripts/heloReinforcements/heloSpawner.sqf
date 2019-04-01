if !(isServer) exitWith {};

_spawnLocation = selectRandom [unkHeloSpawn, unkHeloSpawn_1, unkHeloSpawn_2, unkHeloSpawn_3, unkHeloSpawn_4];

//_returnedInfo = [vehicle, [crew,crew], group];
_returnedInfo = [getPosASL _spawnLocation,180,"I_Heli_Transport_02_F",independent] call BIS_fnc_spawnVehicle;
_group = _returnedInfo select 2;
_helo = _returnedInfo select 0;

_wpZero = _group addWaypoint [pyrgosHover, 600, 0, "home"];
_wpZero setWaypointBehaviour "AWARE";
_wpZero setWaypointTimeout [40, 40, 40];
_group setCurrentWaypoint _wpZero;
_wpOne = _group addWaypoint [unkHeloExfil, 1000, 1, "exfil"];
_wpOne setWaypointBehaviour "CARELESS";

_helo flyInHeight 500;

//systemChat "Paradrops commencing...";
waitUntil {_helo distance pyrgosHover < 620};
[_returnedInfo select 0]execVM "scripts\heloReinforcements\paraSpawner.sqf";
 