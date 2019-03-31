player addAction 
	[
		"<t size='1.5' shadow='2' color='#00ffff'>
				Stow Nearby Vehicle
		</t>",
		{
			_closeEntities = player nearEntities 20;
			_vicsToStow = [];
			{
				if (_x getVariable "fromFunctionalCarrier") exitWith {_vicsToStow pushBack _x;};
			}forEach _closeEntities;
			deleteVehicle (_vicsToStow select 0);
		},
		nil,
		-10, 
		true, 
		true, 
		"",
		"_target == player && player distance ac <= 210",
		-1,
		false
	];