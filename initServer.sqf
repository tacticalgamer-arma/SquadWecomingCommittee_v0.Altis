/********************************************************************************
**  initServer.sqf                                                             **
**Simply edit the variables you need to enable the options as documented below.**
**There is more detailed information on how to do this in initPlayerLocal.sqf  **
*********************************************************************************/


//*CREATE ACE ARSENAL FROM fn_ACEarsenal.sqf	***********************************************
//add all the objects you want to have ACE arsenals on them into the following array         **
//                                                                                           **
_enableACEarsenals = true;              //BOOLEAN
                                                                                           //**
//if _enableACEarsenals is FALSE then _boxesToLoad = [];                                     **
_boxesToLoad = [ammoBox, ammoBox_1, ammoBox_2, ammoBox_3, ammoboxSlingable];   //edit this line
/**********************************************************************************************/


//PLACE MARKERS ON IMPORTANT VEHICLES OR OTHER ITEMS  ********************************************************
//vehicles and their markers are placed in the editor and given the same name                               **
//                                                                                                          **
_useAssetMarkers = true;            //BOOLEAN, set to FALSE to turn off or TRUE to turn on                        //**
                                                                                                          //**
/*************************************************************************************************************/


//POPULATE TOWNS WITH CIVILIANS ******************************************************
//TRUE will use the Civilian Occupation Script (COS) - and FALSE will not use it    **
//********SPECIAL NOTE: COS is older and doesn't work well on Malden & Lythium      **
//********              Be wary and test to ensure it works well on your terrain.   **
//                                                                                  **
_useCivPopulation = true;                         //BOOLEAN
//                                                                                  **
/*************************************************************************************/


//USE MISSION TIMER ********************************************************************
//should always be set to TRUE for www.TacticalGamer.com mission requirements         **
//Contact An Admin (CAA) via our forums should be used for any variations             **
//https://www.tacticalgamer.com/forum/simulation/armed-assault/arma-contact-an-admin  **
//                                                                                    **
_useMissionTimer = false;
/***************************************************************************************/

//SET REFUEL VEHICLES THAT WILL BE REFILLABLE FROM THE FARP *************************************
//this is only necessary because ACE doesn't store a vehicles capacity easily that I've found  **
//                                                                                             **
_enableRefillingRefuelVics = false;
//array of arrays in the following format: [units OBJECT, fuelCapacityInLitres NUMBER]       //**
//                                                                                           //**
//if you set _enableRefillingRefuelVics to be false then make _refuelVicsAndCapacities to be = [];
_refuelVicsAndCapacities =  [];                                                               //**
                             // [supplyRepairTruck, 300]      //edit these lines
                            //];                                                               //**
/************************************************************************************************/


//TOGGLE AMBIENT AIR TRAFFIC *********************************************************************
//this is to spawn ambient air traffic as per functions/server/fn_ambientAirTraffic.sqf	        **
//You may need to edit this file if you are not using Altis to change the _maxCoordinate size   **
//                                                                                              **
_enableAmbientAirTraffic = false;                                          //                    **
/*************************************************************************************************/


//END OF USER ADJUSTED VARIABLES ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

//ENTER ANY ADDITIONAL CODE YOU NEED BELOW HERE*****************************************************************************

createCenter independent;
batteryOneAlive = true;
batteryOne = [batteryOneGun1,batteryOneGun2,batteryOneGun3];
batteryOneHasFired = false;
cacheOneCounterAttackCommenced = false;

_initTasks = []execVM "scripts\initTasks.sqf";


createunits = execVM "RTG_Custom_Scripts\CreateUnits.sqf";
WinCondition = execVM "RTG_Custom_Scripts\WinCondition.sqf";
AllReadyPlayers = [];
publicVariable "AllReadyPlayers";


//***************************************************************************************************************************
//DO NOT EDIT BELOW THIS LINE unless you know what your doing ;)
//***************************************************************************************************************************


["Initialize",[true]] call BIS_fnc_dynamicGroups;
[] spawn TG_fnc_ifAllPlayersDead;

//ACE Arsenals
if (_enableACEarsenals) then {
	{[_x] call TG_fnc_TgAceArsenal;} forEach _boxesToLoad;
};

//assetMarkers
if (_useAssetMarkers) then {
	[] call TG_fnc_assetMarkers;
};

//**************Unkl added Civilian Occupation System
if (_useCivPopulation) then {
	null=[] execVM "cos\cosInit.sqf";
	if (isServer) then {killedMarkers = []; publicVariable "killedMarkers";};
};

if (_useMissionTimer) then {
	[] spawn TG_fnc_missionTimer;
};

if (_enableRefillingRefuelVics) then {
	{
		(_x select 0) setVariable ["isAceRefuelVic", true, true];
		(_x select 0) setVariable ["aceRefuelCapacity", (_x select 1), true];
	} forEach _refuelVicsAndCapacities;
};

//DEFAULT TFR RADIOS
//setting this ensures that regardless of initial respawn settings, players will get the right radio
TF_defaultWestPersonalRadio = "tf_anprc152";
TF_defaultWestRiflemanRadio = "tf_anprc152";
TF_defaultGuerPersonalRadio = "tf_anprc148jem";
TF_defaultGuerRiflemanRadio = "tf_anprc148jem";
TF_defaultEastPersonalRadio = "tf_fadak";
TF_defaultEastRiflemanRadio = "tf_fadak";
TF_defaultWestBackpack = "tf_rt1523g_green";
TF_defaultEastBackpack = "tf_mr3000_rhs";
TF_defaultGuerBackpack = "tf_anprc155_coyote";


//AMBIENT AIR TRAFFIC
if (_enableAmbientAirTraffic) then {
	[] spawn TG_fnc_ambientAirTraffic;
};

//ADD OBJECTS TO ZEUS
//Add all objects to all curators - Code inspired by 3den Enhanced
if (!is3DEN && isServer && (count allCurators > 0)) then {
	[] spawn {
		while {true} do	{
			{_x addCuratorEditableObjects [entities [[], ['Logic'], true], true];} count allCurators;
			sleep 60;
		};
	};
};

//*****************************************
_initParadrops = []execVM "scripts\heloReinforcements\monitorPyrgos.sqf";
