//This script will spawn all the spawn points and signs used to spawn in vehicles on the carrier 
//it will also check and spawn in the AA guns and artillery if selected in the init.sqf options
//This is by |TG189| Unkl from www.TacticalGamer.com - The Premiere Mature Online Gaming Community 

if !(isServer) exitWith {};

spawnedObjects = [];
if (isNil {ac}) then {
  ac = Freedom_new;
};


//MAP AT SPAWN
spawnMap = "SignAd_Sponsor_F" createVehicle (getPosASL ac);
spawnMap setObjectTexture [0,"functionalcarrier\pics\functionalInGame_map.paa"];
spawnMap attachTo [ac, [-26.6, 106, 24.2]]; 
spawnmap setdir 90;

boatTerminal = "Land_DataTerminal_01_F" createVehicle (getPosASL ac);
boatTerminal attachTo [ac, [-29, 108.6, 23.6]];
boatTerminal setDir 180;
[boatTerminal, 1] call BIS_fnc_DataTerminalAnimate;
publicVariable "boatTerminal";




//BOAT AREA************************************************************************************
//        PIER LADDER to get out of water
pierLadder = "Land_PierLadder_F" createVehicle (getposASL ac);

pierLadder attachTo [ac, [0, 189, .72]];
pierLadder setDir 180;
spawnedObjects pushBack pierLadder;
publicVariable "pierLadder";
//          LOWER BACK DECK TELEPORTER
boatDeckTeleporter = "Land_InfoStand_V2_F" createVehicle (getPosASL ac);
boatDeckTeleporter setObjectTextureGlobal [0, "FunctionalCarrier\Pics\backToDeck.paa"];
boatDeckTeleporter attachTo [ac, [3, 186, 4.0]];
boatDeckTeleporter setDir 180;
publicVariable "boatDeckTeleporter";
[boatDeckTeleporter, [format ["<t size='1.5' shadow='2' color='#00ffff'>Go To Main Deck</t>"], {(_this select 1) setPosASL (getPosASL boatDeckDoorTeleportTo);}]] remoteExec ["addAction", 0, true];
//              LOWER BACK DECK TELEPORT LOCATION PLAYERS
boatDeckTeleportTo = "Land_HelipadEmpty_F" createVehicle (getPosASL ac);
boatDeckTeleportTo attachTo [ac, [-2, 187.5, 3.6]];
publicVariable "boatDeckTeleportTo";


//          BOAT PLACEMENT POINT
boatSpawnPoint = "Land_HelipadEmpty_F" createVehicle (getPosASL ac);
boatSpawnPoint attachTo [ac, [0, 206, 1]];
publicVariable "boatSpawnPoint";


//BOAT DECK DOOR
boatDeckDoorTeleporter = "Land_InfoStand_V2_F" createVehicle (getPosASL ac);
boatDeckDoorTeleporter setObjectTextureGlobal [0, "FunctionalCarrier\Pics\toLowerPlatform.paa"];
boatDeckDoorTeleporter attachTo [ac, [-28, 178.5, 20.6]];
boatDeckDoorTeleporter setDir 90;
publicVariable "boatDeckDoorTeleporter";

[boatDeckDoorTeleporter, [format ["<t size='1.5' shadow='2' color='#00ffff'>Go To Boat Deck</t>"], {(_this select 1) setPosASL (getPosASL boatDeckTeleportTo);}]] remoteExec ["addAction", 0, true];
boatDeckDoorTeleportTo = "Land_HelipadEmpty_F" createVehicle (getPosASL ac);
boatDeckDoorTeleportTo attachTo [ac, [-30, 178.5, 20.4]];
publicVariable "boatDeckDoorTeleportTo";

//*****************************************************************************************************************************
//BRIDGE ITEMS
//
//           LOWER PLATFORM TELEPORTER TO UPPER PLATFORM
lowerPlatformTeleporter = "Land_InfoStand_V2_F" createVehicle (getPosASL ac);
lowerPlatformTeleporter setObjectTextureGlobal [0, "FunctionalCarrier\Pics\bridge.paa"];
lowerPlatformTeleporter attachTo [ac, [-22.8, 108, 32.85]];
publicVariable "lowerPlatformTeleporter";
[lowerPlatformTeleporter, [format ["<t size='1.5' shadow='2' color='#00ffff'>Go To Bridge</t>"], {(_this select 1) setPosASL (getPosASL bridgePlatformTeleportTo);}]] remoteExec ["addAction", 0, true];
lowerPlatformTeleportTo = "Land_HelipadEmpty_F" createVehicle (getPosASL ac);
lowerPlatformTeleportTo attachTo [ac, [-22.8, 107, 32.9]];
publicVariable "lowerPlatformTeleportTo";

//          BRIDGE PLATFORM OBJECTS
bridgePlatformTeleporterToLower = "Land_InfoStand_V2_F" createVehicle (getPosASL ac);
bridgePlatformTeleporterToLower setObjectTextureGlobal [0, "FunctionalCarrier\Pics\toLowerPlatform.paa"];
bridgePlatformTeleporterToLower attachTo [ac, [-23.4, 108, 41.57]];
bridgePlatformTeleporterToLower setDir -20;
publicVariable "bridgePlatformTeleporterToLower";
[bridgePlatformTeleporterToLower, [format ["<t size='1.5' shadow='2' color='#00ffff'>Go To Lower Platform</t>"], {(_this select 1) setPosASL (getPosASL lowerPlatformTeleportTo);}]] remoteExec ["addAction", 0, true];
bridgePlatformTeleportTo = "Land_HelipadEmpty_F" createVehicle (getPosASL ac);
bridgePlatformTeleportTo attachTo [ac, [-22.8, 107, 41.4]];
publicVariable "bridgePlatformTeleportTo";
bridgePlatformTeleporterToDeckCommand = "Land_InfoStand_V2_F" createVehicle (getPosASL ac);
bridgePlatformTeleporterToDeckCommand setObjectTextureGlobal [0, "FunctionalCarrier\Pics\deckCommanderStation.paa"];
bridgePlatformTeleporterToDeckCommand attachTo [ac, [-23.4, 105, 41.57]];
bridgePlatformTeleporterToDeckCommand setDir 270;
publicVariable "bridgePlatformTeleporterToDeckCommand";
[bridgePlatformTeleporterToDeckCommand, [format ["<t size='1.5' shadow='2' color='#00ffff'>Go To Deck Command</t>"], {(_this select 1) setPosASL (getPosASL deckCommandTeleportTo);}]] remoteExec ["addAction", 0, true];
deckCommandTeleportTo = "Land_HelipadEmpty_F" createVehicle (getPosASL ac);
deckCommandTeleportTo attachTo [ac, [-22.8, 99, 44.4]];
publicVariable "deckCommandTeleportTo";
//   GLITCH OBJECTS ON BRIDGE
glitch1 = "Land_InfoStand_V2_F" createVehicle (getPosASL ac);
glitch1 setObjectTextureGlobal [0, "FunctionalCarrier\Pics\movePastGlitch.paa"];
glitch1 attachTo [ac, [-22.4, 102.4, 41.57]];
glitch1 setDir 160;
publicVariable "glitch1";
glitch2 = "Land_InfoStand_V2_F" createVehicle (getPosASL ac);
glitch2 setObjectTextureGlobal [0, "FunctionalCarrier\Pics\movePastGlitch.paa"];
glitch2 attachTo [ac, [-21.53, 101.4, 41.57]];
glitch2 setDir 300;
publicVariable "glitch2";
[glitch1, [format ["<t size='1.5' shadow='2' color='#00ffff'>Move Past Glitch</t>"], {(_this select 1) setPosASL (getPosASL glitch2);}]] remoteExec ["addAction", 0, true];
[glitch2, [format ["<t size='1.5' shadow='2' color='#00ffff'>Move Past Glitch</t>"], {(_this select 1) setPosASL (getPosASL glitch1);}]] remoteExec ["addAction", 0, true];

//   DECK COMMAND OBJECTS
deckCommandTeleporter = "Land_InfoStand_V2_F" createVehicle (getPosASL ac);
deckCommandTeleporter setObjectTextureGlobal [0, "FunctionalCarrier\Pics\bridge.paa"];
deckCommandTeleporter attachTo [ac, [-25.5, 100, 44.55]];
deckCommandTeleporter setDir -36;
publicVariable "deckCommandTeleporter";
[deckCommandTeleporter, [format ["<t size='1.5' shadow='2' color='#00ffff'>Go To Bridge</t>"], {(_this select 1) setPosASL (getPosASL bridgePlatformTeleportTo);}]] remoteExec ["addAction", 0, true];
heliSpawnSign = "Land_InfoStand_V2_F" createVehicle (getPosASL ac);
heliSpawnSign setObjectTextureGlobal [0, "FunctionalCarrier\Pics\helos.paa"];
heliSpawnSign attachTo [ac, [-22.33, 94.16, 44.55]];
heliSpawnSign setDir 180;
publicVariable "heliSpawnSign";

landSpawnSign = "Land_InfoStand_V2_F" createVehicle (getPosASL ac);
landSpawnSign setObjectTextureGlobal [0, "FunctionalCarrier\Pics\landSea.paa"];
landSpawnSign attachTo [ac, [-21.44, 94.14, 44.55]];
landSpawnSign setDir 180;
publicVariable "landSpawnSign";

jetSpawnSign = "Land_InfoStand_V2_F" createVehicle (getPosASL ac);
jetSpawnSign setObjectTextureGlobal [0, "FunctionalCarrier\Pics\jets.paa"];
jetSpawnSign attachTo [ac, [-18.66, 97.3, 44.55]];
jetSpawnSign setDir 86;
publicVariable "jetSpawnSign";

dataTerminal = "Land_DataTerminal_01_F" createVehicle (getPosASL ac);
dataTerminal attachTo [ac, [-19.65, 95.2, 44]];
dataTerminal setDir 135;
[dataTerminal, 1] call BIS_fnc_DataTerminalAnimate;
publicVariable "dataTerminal";



boatDeckCameraPos = "Land_HelipadEmpty_F" createVehicle (getPosASL ac);
boatDeckCameraPos attachTo [ac, [0, 187.3, 5.72]];
publicVariable "boatDeckCameraPos";

[[], {
  if (isDedicated) exitWith {};
  boatTerminal setObjectTexture [0, "#(argb,256,256,1)r2t(boatCamera,1.0)"];
  boatTerminal setObjectMaterial [1, "\a3\data_f\default.rvmat"];
  boatTerminal setObjectTexture [1, "pics\tgBanner.paa"];
  boatDeckCamera = "camera" camCreate (getPosASL boatDeckCameraPos);
  boatDeckCamera cameraeffect ["internal","back","boatCamera"]; 
  boatDeckCamera camSetTarget [getPos pierLadder select 0, getPos pierLadder select 1, (getPos pierLadder select 2) + 4];
  boatDeckCamera camSetFOV 2.3;
  
  
  boatTerminal addAction ["Reset Camera", {boatDeckCamera cameraeffect ["internal","back","boatCamera"];}];
}] remoteExec ["spawn", 0, true];

[[], {
  if (isDedicated) exitWith {};
  dataTerminal setObjectTexture [0, "#(argb,256,256,1)r2t(boatCamera,1.0)"];
  dataTerminal setObjectMaterial [1, "\a3\data_f\default.rvmat"];
  dataTerminal setObjectTexture [1, "functionalCarrier\pics\deckCommanderStation.paa"];
  boatDeckCamera = "camera" camCreate (getPosASL boatDeckCameraPos);
  boatDeckCamera cameraeffect ["internal","back","boatCamera"]; 
  boatDeckCamera camSetTarget [getPos pierLadder select 0, getPos pierLadder select 1, (getPos pierLadder select 2) + 4];
  boatDeckCamera camSetFOV 2.3;
  
  
  dataTerminal addAction ["Reset Camera", {boatDeckCamera cameraeffect ["internal","back","boatCamera"];}];
}] remoteExec ["spawn", 0, true];


//*******************************************************************************************************************
//  DECK SPAWN POINTS
//
jetsSpawnPoint = "Land_HelipadEmpty_F" createVehicle (getPosASL ac);
jetsSpawnPoint attachTo [ac, [35.5, 126, 24]];
jetsSpawnPoint setDir 180;
spawnedObjects pushBack jetsSpawnPoint;
publicVariable "jetsSpawnPoint";

landSpawnPoint = "Land_HelipadEmpty_F" createVehicle (getPosASL ac);
//sleep .2;
landSpawnPoint attachTo [ac, [-31, -11.5, 24]];
landSpawnPoint setDir 180;
spawnedObjects pushBack landSpawnPoint;
publicVariable "landSpawnPoint";

heloSpawnPoint = "Land_HelipadEmpty_F" createVehicle (getPosASL ac);
heloSpawnPoint attachTo [ac, [-31, 74, 24]];
//heloSpawnPoint setDir 180;
publicVariable "heloSpawnPoint";

//********************************** ARTILLERY AND REPAIR POINT ***************************
artillerySpawnPoint = "Land_HelipadEmpty_F" createVehicle (getPosASL ac);
artillerySpawnPoint attachTo [ac, [-33, 164.5, 24]];
artillerySpawnPoint setDir 270;
publicVariable "artillerySpawnPoint";
if (artilleryOnDeck) then {
	artyGun = 	"RHS_M119_WD" createVehicle (getPos safeVehicleSpawnPoint);
	artyGun setDir (getDir artillerySpawnPoint);
	artyGun setPosASL (getPosASL artillerySpawnPoint);
	publicVariable "artyGun";
};
if (farpOnDeck) then {
	repairSpawnPoint = "Land_HelipadEmpty_F" createVehicle (getPosASL ac);
	repairSpawnPoint attachTo [ac, [-30.2, -81.0, 24]];
	repairSpawnPoint setDir 150;
	deckRepairObject = "Land_RepairDepot_01_green_F" createVehicle (getPos safeVehicleSpawnPoint);
	deckRepairObject setDir (getDir repairSpawnPoint);
	deckRepairObject setPosASL (getPosASL repairSpawnPoint);
	publicVariable "deckRepairObject";

	[deckRepairObject, 
	[
		"<t size='1.5' shadow='2' color='#00ffff'>
				Repair All
		</t>",
		{
			params ["_target", "_caller", "_actionId", "_arguments"];
			[_target] spawn FC_fnc_farpAction;
		},
		[],
		1, 
		true, 
		true, 
		"",
		"true",
		3,
		false,
		"",
		""
	]] remoteExec ["addAction", 0, true];
}; //if farpOnDeck


//********************** AI AA GUNS ON CARRIER ****************************************
if (carrierHasAA) then {
  gunOne = "B_SAM_System_01_F" createVehicle (getPos safeVehicleSpawnPoint);
  //sleep .2;
  gunOne attachTo [ac, [-39.3, 179.0, 20.6]];
  gunOne setDir 0;
  
  gunTwo = "B_AAA_System_01_F" createVehicle (getPos safeVehicleSpawnPoint);
  //sleep .2;
  gunTwo attachTo [ac, [-16.7, 189.5, 12]];
  gunTwo setDir 0;
  
  gunThree = "B_SAM_System_02_F" createVehicle (getPos safeVehicleSpawnPoint);
  //sleep .2;
  gunThree attachTo [ac, [30.2, 174.7, 20.2]];
  gunThree setDir 0;
  
  gunFour = "B_SAM_System_02_F" createVehicle (getPos safeVehicleSpawnPoint);
  //sleep .2;
  gunFour attachTo [ac, [-29.3, -100.8, 19.6]];
  gunFour setDir 270;
  
  gunFive = "B_AAA_System_01_F" createVehicle (getPos safeVehicleSpawnPoint);
  //sleep .2;
  gunFive attachTo [ac, [-29.8, -105.4, 17.9]];
  gunFive setDir 270;
  
  gunSix = "B_SAM_System_01_F" createVehicle (getPos safeVehicleSpawnPoint);
  //sleep .2;
  gunSix attachTo [ac, [24.7, -115.0, 16.8]];
  gunSix setDir 90;
  
  gunSeven = "B_AAA_System_01_F" createVehicle (getPos safeVehicleSpawnPoint);
  //sleep .2;
  gunSeven attachTo [ac, [47.6, .2, 18.4]];
  gunSeven setDir 90;
  
  _guns = [gunOne, gunTwo, gunThree, gunFour, gunFive, gunSix, gunSeven];
  freedomGuns = _guns;
  publicVariable "freedomGuns";
  //THESE JUMP AROUND SO MUCH WHEN YOU DETATCH THEM THIS NEXT CODE BLOCK TRIES TO STABILIZE THEM - IF THEY BLOW UP THEY SHOULD BE DELETED
  {[_x]spawn {
			_unit = _this select 0; 
			_posWorld = getPosWorld _unit; 
			_unit allowDamage false; 
			detach _unit; sleep 1; 
			_unit setVectorUp [0,0,1]; 
			_unit setPosASL _posWorld; 
			sleep 1; 
			createVehicleCrew _unit; 
			sleep 2; 
			_unit setVectorUp [0,0,1]; 
			_unit setPosASL [(_posWorld select 0), _posWorld select 1, (_posWorld select 2) + .5]; 
			sleep 1; 
			_unit setVectorUp [0,0,1]; 
			_unit allowDamage true; 
			_unit setVehicleReceiveRemoteTargets false; 
			sleep 4; 
			if (!alive _unit) then {deleteVehicle _unit;};
		};
	}forEach _guns;
};


functionalCarrierServerInitialized = "completed";
publicVariable "functionalCarrierServerInitialized";