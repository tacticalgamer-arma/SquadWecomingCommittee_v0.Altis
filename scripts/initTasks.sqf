
//[owner, taskID, description,title,marker], destination, state, priority, showNotification, type, visibleIn3D] call BIS_fnc_taskCreate;

//Zaros Bay east cache
[west, "unkTsk1", ["Destroy the weapons cache located on the eastern bank of Zaros Bay. Expect a platoon size strength of enemy infantry patrolling the area and a quick reaction force from the north of light armed vehicles.","Destroy Cache",""], aTargetOne_15, "CREATED", 50, false, "DESTROY", false] call BIS_fnc_taskCreate;

//Zaros Bay west artillery battery - will be created once this battery fires at the players the first time 
unk_zarosBayWestBatteryTask = {
  [west, "UnkTsk2", ["Destroy the artillery battery on the west coast of Zaros Bay.","Destroy Artillery",""], batteryOnePos, "ASSIGNED", 100, false, "DESTROY", false] call BIS_fnc_taskCreate;
};

//Vikos Outpost
[west, "unkTsk3", ["Eliminate all enemy at the hilltop outpost south of Vikos.","Clear Outpost",""], vikosOutpost, "CREATED", 50, false, "ATTACK", false] call BIS_fnc_taskCreate;

