
CreateCivilianWoundedObjective = {
_Arrow = _this select 0;
sleep (random 5);
_class = selectrandom [
"LOP_CHR_Civ_Citizen_03",
"LOP_CHR_Civ_Citizen_04",
"LOP_CHR_Civ_Citizen_01",
"LOP_CHR_Civ_Citizen_02",
"LOP_CHR_Civ_Profiteer_03",
"LOP_CHR_Civ_Random",
"LOP_CHR_Civ_Worker_03",
"LOP_CHR_Civ_Worker_04",
"LOP_CHR_Civ_Worker_02",
"LOP_CHR_Civ_Profiteer_04"
];
_agent = createAgent [_class, position _Arrow, [], 0, "CAN_COLLIDE"];
_agent disableAI "move";
_agent setPosATL (getPosATL _Arrow);
removeAllItems _agent;
_agent setDamage 0.5;
[_agent, true, 99999,true] call ace_medical_fnc_setUnconscious;
[_agent] spawn {
_agent = (_this select 0);
sleep 3;
[_agent,(selectrandom ["UnconsciousReviveBody_A","UnconsciousReviveBody_B","UnconsciousReviveLegs_A"])] remoteExec ["switchmove",0];
};
_agent addEventHandler ["AnimChanged", { 
 params ["_unit", "_anim"]; 
[_unit, true, 99999,true] call ace_medical_fnc_setUnconscious;
}];

_agent addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	[] spawn ServerPlayCutLossCivDed;
}];


myAgents = myAgents + [_agent];
_newstring = ("Name"+ str(random 1000));
[_agent, _newstring] remoteExec ["setVehicleVarName",0,true];
[west,[(str _agent),"RecueCivs"],["Rescue this civilian to the UN field hospital","Civilian",""],_agent,"CREATED",2,false,"heal",true] call BIS_fnc_taskCreate;

};

[west,["RecueCivs"],["Find and rescue all civilians","Rescue all civilians",""],objNull,"CREATED" ,2,false,"help"] call BIS_fnc_taskCreate;

[west,["RescueArea"],["Bring the civilians to this helipad","Rescue Point",""],rescuepoint,"CREATED" ,2,false,"move"] call BIS_fnc_taskCreate;



createAssautVehicle = {
_placetospawn = (selectrandom [Enemy_APCspawn_1,Enemy_APCspawn_2]);
_Vehicle = (selectrandom ["I_APC_Wheeled_03_cannon_F", "I_MRAP_03_hmg_F", "I_LT_01_cannon_F", "I_MBT_03_cannon_F"]) createVehicle position _placetospawn;

createvehiclecrew _Vehicle;

_Vehicle allowCrewInImmobile true;

_Vehicle setVehicleLock "LOCKED";

group (driver _Vehicle) allowFleeing 0;

_Vehicle addEventHandler ["HandleDamage",{
	if ((_this select 1) find "wheel" != -1) then
	{
		0;
	}else
	{
		(_this select 2);
	};
}];

_Vehicle addEventHandler ["Hit", {
	params ["_unit", "_source", "_damage", "_instigator"];
	if (!canMove _unit or (count crew _unit == 0)) then {
	_unit setDamage 0.9;
	};
}];

_Vehicle setDir (getDir _placetospawn);

_Vehicle addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	systemChat "new vehicle assault started";
	_unit removeAllEventHandlers "Killed";
	call createAssautVehicle;
}];

_Vehicle addEventHandler ["GetOut", {
	params ["_vehicle", "_role", "_unit", "_turret"];
	_vehicle setDamage 0.9;
	if (typeof _vehicle == "") exitwith {"LOP_ChDKZ_UAZ_DshKM"};
	_source01 = "#particlesource" createVehicle getpos _unit; 
	_source01 setParticleClass "MediumDestructionFire"; 
	_source01 setParticleFire [0.3,1.0,0.8];
	[_unit, "ApanPknlMsprSnonWnonDf"] remoteExec ["switchMove",0];
	[_source01] spawn {sleep 30; ((attachedto (_this select 0)) setDamage 1); deleteVehicle (_this select 0);};
	_source01 attachTo [_unit, [0,0,0], "Spine3"];
}];

_Group = group (driver _Vehicle);
_Group selectLeader (driver _Vehicle);

_wp =(_Group) addWaypoint [(getpos Waypoint_1), 0];
_wp setWaypointCompletionRadius 30;
_wp setWaypointType "MOVE";
_wp =(_Group) addWaypoint [(getpos Waypoint_2), 1];
_wp setWaypointCompletionRadius 30;
_wp setWaypointType "MOVE";
_wp =(_Group) addWaypoint [(getpos Waypoint_3), 2];
_wp setWaypointCompletionRadius 30;
_wp setWaypointType "MOVE";
_wp =(_Group) addWaypoint [(getpos Waypoint_4), 3];
_wp setWaypointCompletionRadius 30;
_wp setWaypointType "MOVE";
_wp =(_Group) addWaypoint [(getpos Waypoint_5), 4];
_wp setWaypointCompletionRadius 30;
_wp setWaypointType "MOVE";
_wp =(_Group) addWaypoint [(getpos Waypoint_6), 5];
_wp setWaypointCompletionRadius 30;
_wp setWaypointType "MOVE";
_wp =(_Group) addWaypoint [(getpos Waypoint_7), 6];
_wp setWaypointCompletionRadius 30;
_wp setWaypointType "CYCLE";

{

	_x addEventHandler ["Killed", {
		params ["_unit", "_killer", "_instigator", "_useEffects"];
		if (count (units group _unit select {alive _x}) == 1) then {
		vehicle _unit setDamage 0.9;
		};
	}];


	_x setUnitPos 'UP';
	_x getSpeed "SLOW";
	_x setSkill ['aimingAccuracy', 0.1];
	_x setSkill ['aimingShake', 0.1];
	_x setSkill ['aimingSpeed', 0.1];
	_x setSkill ['spotTime', 0.1];
	_x removeAllEventHandlers "Hit";
	_x removeAllEventHandlers "HitPart";
	_x removeAllEventHandlers "HandleDamage";
	_x removeAllEventHandlers "Dammaged";
	_x removeAllEventHandlers "Explosion";
	_x addEventHandler ["Reloaded",{
		_unit = _this select 0 ;
		_mag = _this select 4 select 0 ;
		_unit addMagazine _mag ;
	}] ;


} forEach crew _Vehicle;

_Vehicle addEventHandler ["Engine", {
	params ["_vehicle", "_engineState"];
	if (_engineState) exitwith {};
	_waypointIndex = (currentWaypoint (group driver _vehicle) + 1);
	(group driver _vehicle) setCurrentWaypoint [(group driver _vehicle),_waypointIndex];
}];

};


call createAssautVehicle;
call createAssautVehicle;


