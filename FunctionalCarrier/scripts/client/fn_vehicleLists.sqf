// Each vehicle is listed by it's class name and then whether or not it should have data
// link turned on.

_vicList =  [
				["B_Quadbike_01_F",0],
				["B_G_Offroad_01_repair_F",0],
				["B_Truck_01_Repair_F",0],
				["B_APC_Wheeled_01_cannon_F", 0],
				["B_APC_Tracked_01_rcws_F", 1],
				["B_APC_Tracked_01_CRV_F", 1],
				["B_AFV_Wheeled_01_cannon_F", 1],
				["B_AFV_Wheeled_01_up_cannon_F", 1],
				["rhsusf_m113_usarmy_supply", 1],
				["rhsusf_m113_usarmy", 1],
				["rhsusf_m113_usarmy_M2_90", 1],
				["rhsusf_m113_usarmy_M240", 1],
				["rhsusf_m113_usarmy_medical", 1],
				["rhsusf_m113_usarmy_MK19", 1],
				["rhsusf_m113_usarmy_MK19_90", 1],
				["rhsusf_m113_usarmy_unarmed", 1],
				["rhsusf_M1117_W", 0],
				["rhsusf_mrzr4_d", 0],
				["rhsusf_m1025_w_s_m2", 0],
				["rhsusf_m1025_w_s_Mk19", 0],
				["rhsusf_m1025_w_s", 0],
				["rhsusf_m1043_w_s_m2", 0],
				["rhsusf_m1043_w_s_mk19", 0],
				["rhsusf_m1043_w_s", 0],
				["rhsusf_m1045_w_s", 0],
				["rhsusf_m998_w_s_2dr_halftop", 0],
				["rhsusf_m998_w_s_2dr", 0],
				["rhsusf_m998_w_s_2dr_fulltop", 0],
				["rhsusf_m998_w_s_4dr_halftop", 0],
				["rhsusf_m998_w_s_4dr", 0],
				["rhsusf_m998_w_s_4dr_fulltop", 0],
				["rhsusf_CGRCAT1A2_usmc_wd", 0],
				["rhsusf_CGRCAT1A2_M2_usmc_wd", 0],
				["rhsusf_CGRCAT1A2_Mk19_usmc_wd", 0],
				["rhsusf_M1232_MC_M2_usmc_wd", 0],
				["rhsusf_M1232_MC_MK19_usmc_wd", 0],
				["B_CTRG_LSV_01_light_F", 0],
				["B_MRAP_01_F", 0],
				["B_MRAP_01_gmg_F", 0],
				["B_MRAP_01_hmg_F", 0],
				["B_LSV_01_unarmed_F", 0],
				["B_LSV_01_AT_F", 0],
				["B_LSV_01_armed_F", 0],
				["rhsusf_M1078A1P2_B_WD_fmtv_usarmy", 0],
				["rhsusf_M1078A1P2_B_WD_flatbed_fmtv_usarmy", 0],
				["rhsusf_M1078A1P2_B_M2_WD_fmtv_usarmy", 0],
				["rhsusf_M1083A1P2_B_WD_fmtv_usarmy", 0],
				["rhsusf_M1083A1P2_B_WD_flatbed_fmtv_usarmy", 0],
				["rhsusf_M1083A1P2_B_M2_WD_fmtv_usarmy", 0],
				["rhsusf_M1085A1P2_B_WD_Medical_fmtv_usarmy", 0]
			];

_planeList = [			
				["B_Plane_Fighter_01_F", 1],
				["B_Plane_Fighter_01_Stealth_F", 1],
				["B_T_VTOL_01_armed_F", 1],
				["B_T_VTOL_01_infantry_F", 1],
				["B_T_VTOL_01_vehicle_F", 1],
				["B_UAV_05_F", 1]
			];

_heloList = [
				["B_Heli_Attack_01_dynamicLoadout_F", 1],
				["RHS_MELB_MH6M",0],
				["RHS_MELB_AH6M_L",0],
				["RHS_MELB_AH6M_M",1],
				["RHS_MELB_AH6M_H",0],				
				
				["RHS_UH60M",1],
				["RHS_UH60M_ESSS",1],
				["RHS_UH60M_ESSS2",1],
				["RHS_UH60M2",1],
				["RHS_UH60M_MEV2",1],
				["RHS_UH60M_MEV",1],
				
				["RHS_CH_47F_light",1],
				["RHS_CH_47F_10",1],
				
				["RHS_AH64D",1],		
				["RHS_AH64DGrey",1],
				
				["B_UGV_01_F",1],
				["B_UGV_01_rcws_F",1],
				
				["B_T_UAV_03_F", 1]
			];
			
_boatList = [
				["B_Boat_Armed_01_minigun_F", 0],
				["rhsusf_mkvsoc", 0],
				["B_Boat_Transport_01_F", 0]
			];

///********************************DO NOT EDIT BELOW HERE ***************************************************			
[jetSpawnSign, player, _planeList, jetsSpawnPoint] call FC_fnc_addActionsForDeckCommanders;
[heliSpawnSign, player, _heloList, heloSpawnPoint] call FC_fnc_addActionsForDeckCommanders;
[landSpawnSign, player, _boatList, boatSpawnPoint] call FC_fnc_addActionsForDeckCommanders;
[landSpawnSign, player, _vicList, landSpawnPoint] call FC_fnc_addActionsForDeckCommanders;

