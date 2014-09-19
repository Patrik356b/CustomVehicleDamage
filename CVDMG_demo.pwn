#include <a_samp>
#include <YSI\y_hooks>
#include <YSI\y_timers>

public OnGameModeInit()
{
	CVDMG_override();
	CreateVehicleEx(600, 0, -20, 3, 75, 255, 222, -1); // Create a sample vehicle
	return 1;
}

enum eTrain
{
	col1, col2
};

new vTrain[MAX_VEHICLES][eTrain];

// Rename the array to hold vehicle health
#define CVDMG_DATA_ARRAY CVDMG_Health

#define TRAIN_COLOR_1 vTrain[vehicleid][col1]
#define TRAIN_COLOR_2 vTrain[vehicleid][col2]
#include "CVDMG\area"
#include "CVDMG\GetVehicleSize"
#include "CVDMG\FindVehicleNearPlayer"
#include "CVDMG\VehicleDamage.inc"
#include "CVDMG\VehicleDamage.pwn"

public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
	if(hittype == BULLET_HIT_TYPE_VEHICLE)
    {
    	OnBulletHitVehicle(weaponid, hitid);
    	return 0; // Have to return 0 or custom damage will not be applied
    }
	return 1;    
}

CVDMG_override() // To be used once only, like under OnGameModeInit
{
	printf("\tOverriding settings for CVDMG...");

	for(new cvdmg_adjust=400; cvdmg_adjust < sizeof(VehicleDamage); cvdmg_adjust++)
	{
		switch(cvdmg_adjust)
		{
			case 409, 415: // [409] Stretch and [415] Cheetah
			{
                VehicleDamage[cvdmg_adjust][VEHICLE_DAMAGE_MELEE]   = 3  ;
      	        VehicleDamage[cvdmg_adjust][VEHICLE_DAMAGE_PISTOL]  = 8  ;
                VehicleDamage[cvdmg_adjust][VEHICLE_DAMAGE_SMG]     = 14  ;
                VehicleDamage[cvdmg_adjust][VEHICLE_DAMAGE_SHOTGUN] = 26  ;
                VehicleDamage[cvdmg_adjust][VEHICLE_DAMAGE_ASSAULT] = 32  ;
                VehicleDamage[cvdmg_adjust][VEHICLE_DAMAGE_RIFLE]   = 16  ;
			}

			case 435: CVDMG_Trailers(cvdmg_adjust); // [435] Trailer
			
			case 450: CVDMG_Trailers(cvdmg_adjust); // [450] Trailer

			case 570: CVDMG_Train(cvdmg_adjust); // [570] Trailer

			case 584: CVDMG_Trailers(cvdmg_adjust); // [584] Trailer A

			case 591: CVDMG_Trailers(cvdmg_adjust); // [591] Trailer C
			
			case 606: CVDMG_Trailers(cvdmg_adjust); // [606] Luggage Trailer A
			case 607: CVDMG_Trailers(cvdmg_adjust); // [607] Luggage Trailer B
			case 608: CVDMG_Trailers(cvdmg_adjust); // [608] Stair Trailer

			case 610: CVDMG_Trailers(cvdmg_adjust); // [610] Farm Plow
			case 611: CVDMG_Trailers(cvdmg_adjust); // [611] Utility Trailer
		}
	}

	printf("\tSettings for CVDMG successfully updated!\n");
	return 1;
}

// 	Damage Multiplier - Per bullet/hit
// VEHICLE_DAMAGE_MELEE, VEHICLE_DAMAGE_PISTOL, VEHICLE_DAMAGE_SMG, VEHICLE_DAMAGE_SHOTGUN, VEHICLE_DAMAGE_ASSAULT, VEHICLE_DAMAGE_RIFLE

	/*
	Weapon Catergories:

	VEHICLE_DAMAGE_MELEE
	// WEAPON_FIST           // WEAPON_BRASSKNUCKLE     // WEAPON_GOLFCLUB
	// WEAPON_NITESTICK      // WEAPON_KNIFE            // WEAPON_BAT
	// WEAPON_SHOVEL         // WEAPON_POOLSTICK       	// WEAPON_KATANA
	// WEAPON_CHAINSAW       // WEAPON_DILDO            // WEAPON_DILDO2
	// WEAPON_VIBRATOR       // WEAPON_VIBRATOR2       	// WEAPON_FLOWER
	// WEAPON_CANE
	
	VEHICLE_DAMAGE_PISTOL
	// WEAPON_COLT45         // WEAPON_SILENCED         // WEAPON_DEAGLE

	VEHICLE_DAMAGE_SMG
	// WEAPON_UZI            // WEAPON_MP5              // WEAPON_TEC9

	VEHICLE_DAMAGE_SHOTGUN
	// WEAPON_VEHICLE_DAMAGE_SHOTGUN   // WEAPON_SAWEDOFF  // WEAPON_SHOTGSPA

	VEHICLE_DAMAGE_ASSAULT
	// WEAPON_AK47           // WEAPON_M4

	VEHICLE_DAMAGE_RIFLE
	// WEAPON_VEHICLE_DAMAGE_RIFLE     // WEAPON_SNIPER
	*/

CVDMG_Trailers(modelid)
{
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_MELEE]   = 13  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_PISTOL]  = 18  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_SMG]     = 22  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_SHOTGUN] = 36  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_ASSAULT] = 41  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_RIFLE]   = 13  ;
	return 1;
}
