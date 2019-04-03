myAgents = []; 
CanStartCount = 0;
["WinConditionCheck", "onEachFrame", {

//delete the agents when they come
_agentsToDelete = myAgents inAreaArray [getPosASL rescuepoint, 7, 7];
if (count _agentsToDelete > 0) then {
	{
		myAgents = myAgents - [_x];
		moveOut _x;  
		deleteVehicle _x;
		[(str _x),"SUCCEEDED",true] call BIS_fnc_taskSetState;
		_WoundedPlaces = (synchronizedObjects Bodybags);
		_WoundedPlaces sort true;
		_weretoputwounded = (_WoundedPlaces select 0);
		[_weretoputwounded,_x] call CreateWondedCivilianAgent;
		["Civilian Rescued"] remoteexec ["systemchat",0];
	} forEach _agentsToDelete;  
};

//win gg
if ((CanStartCount == 1) and (count myAgents) == 0) then {
//[] spawn SeverSetplayersPos;
["RecueCivs","SUCCEEDED"] call BIS_fnc_taskSetState;
["RescueArea","SUCCEEDED"] call BIS_fnc_taskSetState;
["WinConditionCheck", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
};
}] call BIS_fnc_addStackedEventHandler;

CreateWondedCivilianAgent = {
_PlaceToAttach = _this select 0;

_oldUnit = _this select 1;
_oldUnitClass = (typeOf _oldUnit);
_unit = createAgent [_oldUnitClass, (position _PlaceToAttach), [], 0, "FORM"];
_unit addHeadgear (selectrandom ["H_HeadBandage_clean_F","H_HeadBandage_stained_F","H_HeadBandage_bloody_F"]);
_unit attachto [_PlaceToAttach,[0,0,0]];
_unit disableAI "all";
_animation = selectrandom ["Acts_LyingWounded_loop1","Acts_LyingWounded_loop2","Acts_LyingWounded_loop3","Acts_CivilShocked_1","Acts_CivilShocked_2"];
[_unit, _animation] remoteExec ["switchMove",0,true];
Bodybags synchronizeObjectsRemove [_PlaceToAttach];

};
