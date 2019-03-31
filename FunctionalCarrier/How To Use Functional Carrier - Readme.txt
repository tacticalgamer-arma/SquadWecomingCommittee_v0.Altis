FUNCTIONAL CARRIER
******************
By |TG189| Unkl from www.TacticalGamer.com - The Premiere Mature Online Community
Additional credits:
	I pulled some of the scripts for creating lists of vehicles to spawn and the add action pictures from a
	heavily modified Enemy Assault that hedgehog had built for TG.
	FARP script is largely by Roque_THE_GAMER with a little input from Unkl and is adapted from the TG template.

WHAT IS THE FUNCTIONAL CARRIER
******************************
At the time of writing, the USS Freedom aircraft carrier in ArmA 3 is difficult to set up and can easily take a mission maker
an hour to set up a respawn point, get players to land on the deck (not fall through) and so forth. It is also difficult for Zues 
to add assets.

Solution: This script will allow a Deck Commander to create vehicles as needed. Land vehicles, helicopters, planes and boats can
all be created by the Deck Commanders. You can allow all players to be deck commanders or only specific playable units.

To restrict to specific playable units just add the following line into the init of the playable unit in the editor:

//UPDATED
handle = []execVM "FunctionalCarrier\scripts\initDeckCommander.sqf";

***********************************************************************************************************************************************
REQUIRED CONTENT
 - A3
 - RHS US Armed Forces

***********************************************************************************************************************************************
SETTING UP THE SCRIPTS ***updated***
**********************
There are some prerequisites for using the Functional Carrier.
	1. You must have "Repawn On Custom Position" and "Select Respawn Position" AND A RESPAWN DELAY set in the Multiplayer Attributes within the editor or...
		...the following lines in your description.ext...
			respawn = "BASE"; 
			respawnTemplates[] = {"MenuPosition"}; //TG users, "MenuPosition" needs to be added to the existing list
			respawnOnStart = 1;
			
	2. You must add the following into your description.ext...
			class CfgFunctions
			{
				#include "FunctionalCarrier\scripts\cfgfunctions.hpp"	
			}
	
	3. You must copy the lines from the init.sqf into your init.sqf and they must be at the top of your file!!! No sleep or waitUntil command
		can be before these lines.
	
	4. You must have an object placed in a flat and clear area that is outside of your playable zone named, "safeVehicleSpawnPoint". This
		is where vehicles will first spawn before they are moved to their proper position on the carrier. It is essential.
		
	5. Place the aircraft carrier in the editor - Find it under: empty, Structures(Altis), Static Ships, Aircraft Carrier (USS Freedom)
		- name it and put it's name into the init.sqf file (or just name it "freedom_new")
	
	6. Edit your options using the TRUE/FALSE switches for AA guns, Artillery on Deck, Farp on Deck, All players are Deck Commanders and to use
		medical vehicles as respawn points.
		
************************************************************************************************************************************************
EDITING AVAILABLE VEHICLES
**************************
These lists are created in FunctionalCarrier\scripts\client\fn_vehicleLists.sqf

Each list can have class names added or removed from it to determine which vehicles you want available. Each vehicle also has an additional 
parameter to turn data link sharing of target information from the sensor systems. Setting this to 0 will be off. Setting this to 1 will 
turn of sending and receiving of targeting information to other receiving units.

Here is an example of a list of planes that will all have data link turned on except for the VTOL craft.

	_planeList = [			
					["B_Plane_Fighter_01_Stealth_F", 1],  	//1 = data link is on
					["B_T_VTOL_01_infantry_F", 0],			//0 = data link is off
					["B_T_VTOL_01_vehicle_F", 0],
					["B_UAV_02_dynamicLoadout_F", 1]
				];
				
You can place a vehicle in the editor then right click on it and log classnames to get the class names easily.

Autonomous vehicles will get AI crew placed in automatically.