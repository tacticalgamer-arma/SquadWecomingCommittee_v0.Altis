class FC
{
	tag = "FC";	
	class client
	{
		file = "FunctionalCarrier\scripts\client";				
		class farpAction {};
		class addActionsForDeckCommanders {};
		class spawnVehicleForDeckCommander {};
		class stowAction {};
		class vehicleLists {};
		class admin {};
	};
	
	class server
	{
		file = "FunctionalCarrier\scripts\server";
		class farpProcessing {};
		class spawnAllCarrierObjects {};
	};
};