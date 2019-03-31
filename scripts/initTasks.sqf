
//[owner, taskID, description,title,marker], destination, state, priority, showNotification, type, visibleIn3D] call BIS_fnc_taskCreate;

//Zaros Bay east cache
[west, "tsk1", ["Destroy the weapons cache located on the eastern bank of Zaros Bay. Expect a platoon size strength of enemy infantry patrolling the area and a quick reaction force from the north of light armed vehicles.","Destroy Cache",""], aTargetOne_15, "CREATED", 50, false, "DESTROY", false] call BIS_fnc_taskCreate;

//Zaros Bay west artillery battery - will be created once this battery fires at the players the first time 
unk_zarosBayWestBatteryTask = {[west, "tsk2", ["Destroy the artillery battery on the west coast of Zaros Bay.","Destroy Artillery",""], batteryOnePos, "ASSIGNED", 100, false, "DESTROY", false] call BIS_fnc_taskCreate;};

//Sagoshi Radar
[west, "tskRadar", ["Disable the enemy Radar that is spotting our air assets.","Disable Radar",""], RadarObjective, "CREATED", 0, false, "interect", false] call BIS_fnc_taskCreate;

