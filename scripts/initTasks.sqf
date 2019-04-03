
//[owner, taskID, description,title,marker], destination, state, priority, showNotification, type, visibleIn3D] call BIS_fnc_taskCreate;

//Zaros Bay east cache
[west, "unkTsk1", ["Destroy the weapons cache located on the eastern bank of Zaros Bay. Expect a platoon size strength of enemy infantry patrolling the area and a quick reaction force from the north of light armed vehicles.","Destroy Cache",""], aTargetOne_15, "CREATED", 50, false, "DESTROY", false] call BIS_fnc_taskCreate;

//Zaros Bay west artillery battery - will be created once this battery fires at the players the first time 
unk_zarosBayWestBatteryTask = {
  [west, "UnkTsk2", ["Destroy the artillery battery on the west coast of Zaros Bay.","Destroy Artillery",""], batteryOnePos, "ASSIGNED", 100, false, "DESTROY", false] call BIS_fnc_taskCreate;
};

//Vikos Outpost
[west, "unkTsk3", ["Eliminate all enemy at the hilltop outpost south of Vikos. Expect a large squad of enemy infantry with static weapons. No QRF is expected.","Clear Outpost",""], vikosOutpost, "CREATED", 50, false, "ATTACK", false] call BIS_fnc_taskCreate;

//Vikos Lookout
[west, "unkTsk4", ["Eliminate all enemy at the hilltop lookout at the ruins south of Vikos. Expect a small squad of enemy infantry. No QRF is expected.","Clear Lookout",""], vikosLookout, "CREATED", 50, false, "ATTACK", false] call BIS_fnc_taskCreate;


//Drimea Checkpoint
[west, "unkTsk5", ["Eliminate all enemy at the Drimea checkpoint. Expect a small squad of enemy infantry and static weapons. No QRF is expected.","Clear Checkpoint",""], drimeaCheckpoint, "CREATED", 50, false, "ATTACK", false] call BIS_fnc_taskCreate;

//PyrgosOutpost
[west, "unkTsk6", ["Eliminate all enemy at the outpost on the western shore of Pyrgos. Expect an APC, Fennek, Static Weapons and possible attack chopper plus support trucks.","Clear Outpost",""], pyrgosOutpost, "CREATED", 50, false, "ATTACK", false] call BIS_fnc_taskCreate;

//Makrynisi Island AAA
[west, "intTsk1", ["Eliminate all AAA emplacements on Makrynisi island. Expect a small patrol defending the guns. No QRF is expected.","Destroy AAA",""], intMakrynisiAAA, "CREATED", 50, false, "DESTROY", false] call BIS_fnc_taskCreate;

//Sagoshi Radar
[west, "tskRadar", ["Hack the enemy Radar that is spotting our air assets so we can use it to spot theirs!","Hack Radar",""], RadarObjective, "CREATED", 0, false, "interect", false] call BIS_fnc_taskCreate;

//=============================Hedgehog tasks========================
[
    west,
    "hogTsk1",
    [
        "Kill an enemy officer surveying the town of Selekano.",
        "Assasinate officer",
        ""
    ],
    hedgehog_officer,
    "CREATED",
    0,
    false,
    "kill",
    false
] call BIS_fnc_taskCreate;
