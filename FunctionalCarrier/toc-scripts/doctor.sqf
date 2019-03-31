// You can add more doctors...
basedoctor addAction ["Heal", {{if (_x distance basedoctor < 5) then {[_x, _x] remoteExecCall ["ACE_medical_fnc_treatmentAdvanced_fullHeal", 0];};} forEach allplayers;},[], 1.5, false, true, "","true", 3];
// basedoctor_1 addAction ["Heal", {{if (_x distance basedoctor < 5) then {[_x, _x] remoteExecCall ["ACE_medical_fnc_treatmentAdvanced_fullHeal", 0];};} forEach allplayers;},[], 1.5, false, true, "","true", 3];
// basedoctor_2 addAction ["Heal", {{if (_x distance basedoctor < 5) then {[_x, _x] remoteExecCall ["ACE_medical_fnc_treatmentAdvanced_fullHeal", 0];};} forEach allplayers;},[], 1.5, false, true, "","true", 3];
// basedoctor_3 addAction ["Heal", {{if (_x distance basedoctor < 5) then {[_x, _x] remoteExecCall ["ACE_medical_fnc_treatmentAdvanced_fullHeal", 0];};} forEach allplayers;},[], 1.5, false, true, "","true", 3];
