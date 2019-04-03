Arrows = allMissionObjects "Sign_Arrow_Direction_Pink_F";
agentIncrementor = 0;


serverCutsceneStart = {
{[_x] spawn CreateCivilianWoundedObjective} forEach Arrows;
sleep 5;
CanStartCount = 1;
};

if (!isServer) exitWith {};
["Welcome TG Squad!!"] remoteExec ["systemChat",0];
waitUntil {!isNil "AllReadyPlayers"};
waitUntil {
((time > 10 and (count AllReadyPlayers) >= (count allplayers)) or time > 30);
};
["Thank you for playing - We hope you have fun!!"] remoteExec ["systemChat",0];
sleep 5;
[] spawn serverCutsceneStart;