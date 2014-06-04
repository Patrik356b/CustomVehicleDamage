#include <a_samp>
#include <YSI\y_hooks>
#include <YSI\y_timers>

public OnGameModeInit()
{
	CreateVehicleEx(600, 0, -20, 3, 75, 255, 222, -1); // Create a sample vehicle
	return 1;
}

#define TRAIN_COLOR_1 random(255)
#define TRAIN_COLOR_2 255

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