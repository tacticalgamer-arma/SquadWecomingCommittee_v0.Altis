//This script was orignally by Ghost, modified by hedgehog for modified Enemy Assault mission, and then Unkl for Functional Carrier
//[basebox, player, [["classname1", dataLink],["classname2", dataLink]], "mrk"] call ghst_fnc_spawnStuff;

_obj 		= _this select 0;
_caller 	= _this select 1;
_classNames = _this select 2;
_markerName = _this select 3;

private ["_i", "_price", "_veh", "_picture"];

for "_i" from 0 to (count _classNames)-1 do 
{
	_veh 	= (_classNames select _i) select 0; //classname
	_dataLink  = (_classNames select _i) select 1; //dataLink
	
	_veh_name = getText (configFile >> "cfgVehicles" >> (_veh) >> "displayName");	
	_picture = getText(configFile >> "CfgVehicles" >> (_veh) >> "picture");	
	
	_obj addAction 
	[
		format 
		[
			"<t size='1.5' shadow='2' color='#00ffff'>
				Raise %1
			</t>
			<img size='3' color='#00ffff' shadow='2' image='%2'/>", 
			_veh_name, 
			_picture
		],
		"call FC_fnc_spawnVehicleForDeckCommander;",
		[_veh,_dataLink,_markerName],
		5, 
		true, 
		true, 
		"",
		"alive _target"
	];	
};
