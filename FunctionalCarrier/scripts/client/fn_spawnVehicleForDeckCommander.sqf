_host 		= _this select 0;
_caller 	= _this select 1;
_id 		= _this select 2;
_params 	= _this select 3;
_className 	= _params select 0;
_dataLink		= _params select 1;
_markerName = _params select 2;

_position 		= getPosASL _markerName;
_direction 		= getDir _markerName;
_check_radius 	= 10;//radius for vehicle spawn pad check and delete

_padempty = nearestObjects [_position, ["LandVehicle","Air","Ship"], _check_radius];
if (count _padempty > 0) exitwith 
{
	titleText ["Spawn Pad not clear", "PLAIN DOWN"];
};

_veh_name = getText (configFile >> "cfgVehicles" >> (_className) >> "displayName");

_vehicle = _className createVehicle _position;
_vehicle allowDamage false;
_vehicle setDir _direction; //Set the vehicles direction the same as the marker.
_vehicle setPosASL _position; //Make sure it gets set onto the position.


//add custom actions and properties to vehicles
_vehicle setVariable ["fromFunctionalCarrier", true, true]; //for tracking for removal by Deck Commander
if (_dataLink > 0) then {
  _vehicle setVehicleReportRemoteTargets true;
  _vehicle setVehicleReportOwnPosition true;
  _vehicle setVehicleReceiveRemoteTargets true;
};


_vehicleClass = getText(configFile >> "CfgVehicles" >> _className >> "vehicleClass");

if(_vehicleClass == "Autonomous") then
{
	createVehicleCrew _vehicle;
};
_respawnVics = ["rhsusf_m113d_usarmy_medical","rhsusf_m113_usarmy_medical","rhsusf_M1085A1P2_B_D_Medical_fmtv_usarmy","RHS_UH60M_MEV2_d","RHS_UH60M_MEV_d","B_Truck_01_medical_F","B_T_Truck_01_medical_F","rhsusf_M1230a1_usarmy_d","rhsusf_M1230a1_usarmy_wd"];
if(safeVehicleSpawnPoint getVariable "useRespawnVehicles" && (_className in _respawnVics)) then
{
	"Creating respawn location on new vehicle..." remoteExec ["systemChat", 0, false];
	[[missionNamespace, _vehicle, "Medical"], BIS_fnc_addRespawnPosition] remoteExec ["call", 2, false];
};


_vehicle allowDamage true;

titleText [format ["%1 raised from stores.", _veh_name], "PLAIN DOWN"]; titleFadeOut 5;
