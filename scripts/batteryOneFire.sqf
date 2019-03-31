systemChat "batteryOneFire.sqf has been triggered.";

_triggeredByUnits = _this select 0;
_targets = [aTargetOne, aTargetOne_1, aTargetOne_2, aTargetOne_3, aTargetOne_4, aTargetOne_5, aTargetOne_6, aTargetOne_7, aTargetOne_8, aTargetOne_9, aTargetOne_10, aTargetOne_11, aTargetOne_12, aTargetOne_13, aTargetOne_14, aTargetOne_15, aTargetOne_16, aTargetOne_17, aTargetOne_18, aTargetOne_19, aTargetOne_20, aTargetOne_21, aTargetOne_22, aTargetOne_23, aTargetOne_24, aTargetOne_25, aTargetOne_26, aTargetOne_27];

//systemChat format ["_triggeredByUnits = %1", _triggeredByUnits];
if (!batteryOneHasFired) then {
  batteryOneHasFired = true;
  [] spawn {
    sleep 30;
	"HQ: Artillery has fired from your west. You are the most likely target! Scramble!! Out." remoteExec ["Hint", 0 , false];
	sleep 15;
	[] call unk_zarosBayWestBatteryTask;
	cacheOneCounterAttackCommenced = true;
  };
};

_gunOneTarget = getPos (selectRandom _targets);
_gunTwoTarget = getPos (selectRandom _targets);
_gunThreeTarget = getPos (selectRandom _targets);
//systemChat format ["target 1: %1, target 2: %2, target 3: %3", _gunOneTarget, _gunTwoTarget, _gunThreeTarget];

//["rhs_mag_3of56_10","rhs_mag_d462_2","rhs_mag_s463_2","rhs_mag_3of69m_2"]

if (alive batteryOneGun1) then {
  [_gunOneTarget]spawn {
    _gunOneTarget = _this select 0;
	sleep ((random 5) + 2);
    (gunner batteryOneGun1) doArtilleryFire [_gunOneTarget, "rhs_mag_3of56_10", 1];
  };
};

if (alive batteryOneGun2) then {
  [_gunTwoTarget] spawn {
    _gunTwoTarget = _this select 0;
    sleep ((random 5) + 2);
    (gunner batteryOneGun2) doArtilleryFire [_gunTwoTarget, "rhs_mag_3of56_10", 1];
  };
};

if (alive batteryOneGun3) then {
  [_gunThreeTarget] spawn {
    _gunThreeTarget = _this select 0;
	sleep ((random 5) + 2);
    (gunner batteryOneGun3) doArtilleryFire [_gunThreeTarget, "rhs_mag_3of56_10", 1];
  };
};
