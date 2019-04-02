["tskRadar","SUCCEEDED"] call BIS_fnc_taskSetState;

[radarObjective] remoteExec ["createVehicleCrew", 2, false];
{
  [_x, true] remoteExec ["setVehicleReceiveRemoteTargets", 2, false];
}forEach freedomGuns;
[radarObjective, true] remoteExec ["setVehicleReportRemoteTargets", 2, false];
[radarObjective, true] remoteExec ["setVehicleReportRemoteTargets", 2, false];
[radarObjective, 1] remoteExec ["setVehicleRadar", 2, false];