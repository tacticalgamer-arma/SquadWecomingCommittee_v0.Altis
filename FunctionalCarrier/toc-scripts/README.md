# In this folder you will find the development features for the TOC functions.
// if isServer then {[group this, getPos this, 700] call bis_fnc_taskPatrol}; "PATROL" // WIP (Patrols around HALO drop area?)
// // Set one terminal up to control deck guns and drones in carrier in object init

this addAction ["Use Drone Station","toc-scripts\terminal.sqf"]; // Drone Station Init

// ACE Advanced Medics - Perhaps force Alpha on player slots? That should force group them. Put this in the init for the "Medics" if we used them.

dummy = [this, units (group this)] execVM "toc-scripts\automedic.sqf"; // Medic Init

// HALO's from 10km

0 = [this,10000,90,true] execVM "toc-scripts\halo.sqf" // Sign Init
