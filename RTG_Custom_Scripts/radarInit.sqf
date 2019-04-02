/*
if (isServer) then {
this addEventHandler ["Deleted", {
 params ["_entity"];
 ["tskRadar","SUCCEEDED"] call BIS_fnc_taskSetState;
}];
};
*/

RadarObjective addAction 
[
    "Hack Radar", 
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
  _hackedRadar = [_target]execVM "RTG_Custom_Scripts\hackedRadar.sqf"
    },
    [],
    1.5, 
    true, 
    true, 
    "",
    "true",
    5,
    false,
    "",
    ""
];