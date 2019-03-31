if !(isServer) exitWith {};
functionalCarrierServerInitialized = "inProgress";
publicVariable "functionalCarrierServerInitialized";

//create carrier spawn point
carrierSpawnPoint = "Land_HelipadEmpty_F" createVehicle (getPosASL ac);
carrierSpawnPoint attachTo [ac, [-31, 105, 24.2]];
carrierSpawnPoint setDir 180;
carrierRespawn = [missionNameSpace, carrierSpawnPoint, "USS Freedom"] call BIS_fnc_addRespawnPosition;

//initialize carrier spawn objects
[] spawn FC_fnc_spawnAllCarrierObjects;

//set variable to allow repawn vehicles
if (useRespawnVehicles) then {
  safeVehicleSpawnPoint setVariable ["useRespawnVehicles", true, true];
} else {
  safeVehicleSpawnPoint setVariable ["useRespawnVehicles", false, true];
};