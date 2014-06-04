/*======================================================================================================//
	Custom Vehicle Damage - Script functions

	Credits:
		Patrik356b
			https://github.com/Patrik356b
//======================================================================================================*/

#include <YSI\y_hooks>

#if !defined VEHICLE_RESPAWN_TIME
	#define VEHICLE_RESPAWN_TIME 40*(60*1000) // 40 Minutes for trains to respawn
#endif

new Float:CVDMG_DATA_ARRAY[MAX_VEHICLES]; // this is where we store the vehicle health

#define VEHICLE_DAMAGE_VERSION	1
#define VEHICLE_DAMAGE_RCVER	3

// Use this to directly invoke the custom damage system
CreateVehicleEx(vehicletype, Float:x, Float:y, Float:z, Float:rotation, color1, color2, respawn_delay)
{
	new vehicleid=CreateVehicle(vehicletype, x, y, z, rotation, color1, color2, respawn_delay);
	CVDMG_DATA_ARRAY[vehicleid]=1000.01;
	return vehicleid;
}

hook OnVehicleSpawn(vehicleid)
{
	CVDMG_DATA_ARRAY[vehicleid]=1000.01;
	return 1;
}

timer CreateTrainExplosion[800](vehicleid, type, radius, distance)
{
	// Kill onboard players
	foreach(Player, i)
	{
		if(GetPlayerVehicleID(i) == vehicleid) SetPlayerHealth(i, -1.1);
	}
	
	CVDMG_DATA_ARRAY[vehicleid]=-1.01;

	// calculate angular offset (inaccurate)
	new Float:Tx, Float: Ty, Float:Tz, Float:Ta;
    GetVehiclePos(vehicleid, Tx, Ty, Tz);
    GetVehicleZAngle(vehicleid, Ta);

    Tx-=1.0;

    Tx += (distance * floatsin(-Ta, degrees));
    Ty += (distance * floatcos(-Ta, degrees));

    // Explosion
	CreateExplosion(Tx, Ty, Tz, type, radius);
	ChangeVehicleColor(vehicleid, 0, 0);
	SetVehicleParamsEx(vehicleid, 0, 0, 0 ,1, 0, 0, 0); // train is dead, you shall not enter it...
}

timer RespawnTrain[VEHICLE_RESPAWN_TIME](vehicleid)
{
	ChangeVehicleColor(vehicleid, TRAIN_COLOR_1, TRAIN_COLOR_2);
	SetVehicleParamsEx(vehicleid, 0, 0, 0, 0, 0, 0, 0); // train is not dead, you shall be able to enter it...
	SetVehicleToRespawn(vehicleid);
}

ptask VehicleDamageCheck[300](playerid)
{
	#if defined HALF_VEHICLE_COLLISION_DAMAGE
	new vv = GetPlayerVehicleID(playerid);
	if((vv) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
	{
		// Lower vehicle collision damage by roughly half
		new Float:vhptmp, Float:vhp=VehicleData[vv][VehicleHealth];
		GetVehicleHealth(vv, vhptmp);
		new Float:tmpvhp=vhp-(vhp-vhptmp)/2;
		SetVehicleHealth(vv, tmpvhp);
		VehicleData[vv][VehicleHealth] = tmpvhp;
		return 1; // Update vehicle health
	}
	#endif

	new keys, weaponid=GetPlayerWeapon(playerid);
	GetPlayerKeys(playerid, keys, weaponid, weaponid);
	if(keys & KEY_FIRE && (weaponid >= 0 && weaponid <= 15))
	{
		new animlib[32], animname[32];
		new animidx=GetPlayerAnimationIndex(playerid);

		if(animidx) // Check for damage by melee weapons
	    {
    		GetAnimationName(animidx,animlib,sizeof(animlib),animname,sizeof(animname));

	    	if((strfind(animname, "fight", true) != -1)		||	(strfind(animname, "bat", true) != -1)
	    	|| (strfind(animname, "csaw", true) != -1)		||	(strfind(animname, "dildo", true) != -1)
	    	|| (strfind(animname, "sword", true) != -1)		||	(strfind(animname, "knife", true) != -1))
	    	{
	    		new v=FindVehicleNearPlayer(playerid);
	    		if(v)
	    		{
			    	new Float:vhp=CVDMG_DATA_ARRAY[v];
			    	switch(weaponid)
			    	{
			    		// VEHICLE_DAMAGE_MELEE
			    		case 0..15:
			    		{
			    			new vm2=GetVehicleModel(v)-400; // Adjust for array lookup
			    			vhp=floatsub(vhp, VehicleDamage[vm2][VEHICLE_DAMAGE_MELEE]);
			    		}
			    	}
			    	CVDMG_DATA_ARRAY[v]=vhp;
			    	SetVehicleHealth(v, vhp);
			    }
    		}
    	}
    }
    return 1;
}

OnBulletHitVehicle(weaponid, hitid)
{
	new hitmodel=(GetVehicleModel(hitid));
	new Float:vhp=CVDMG_DATA_ARRAY[hitid];
	
	switch(weaponid)
	{
		// VEHICLE_DAMAGE_PISTOL
		case 22..24:
		{
			vhp=floatsub(vhp, VehicleDamage[hitid][VEHICLE_DAMAGE_PISTOL]);
		}
		// VEHICLE_DAMAGE_SMG
		case 28,29,32:
		{
			vhp=floatsub(vhp, VehicleDamage[hitid][VEHICLE_DAMAGE_SMG]);
		}
		// VEHICLE_DAMAGE_SHOTGUN
		case 25..27:
		{
			vhp=floatsub(vhp, VehicleDamage[hitid][VEHICLE_DAMAGE_SHOTGUN]);
		}
		// VEHICLE_DAMAGE_ASSAULT
		case 30,31:
		{
			vhp=floatsub(vhp, VehicleDamage[hitid][VEHICLE_DAMAGE_ASSAULT]);
		}
		// VEHICLE_DAMAGE_RIFLE
		case 33,34:
		{
			vhp=floatsub(vhp, VehicleDamage[hitid][VEHICLE_DAMAGE_RIFLE]);
		}
	}
	CVDMG_DATA_ARRAY[hitid]=vhp;

	// Trains
	if(vhp <= 0) return 0; // Prevent train to be exploded again before respawn

	switch(hitmodel)
	{
		case 449:
		{
			if(vhp <= 250)
			{
				defer CreateTrainExplosion(hitid, 6, 24, 1);
				defer RespawnTrain(hitid);
			}
		}
		case 537:
		{
			if(vhp <= 250)
			{
				defer CreateTrainExplosion(hitid, 6, 42, 1);
				defer RespawnTrain(hitid);
			}
		}
		case 538:
		{
			if(vhp <= 250)
			{
				defer CreateTrainExplosion(hitid, 6, 64, 1);
				defer RespawnTrain(hitid);
			}
		}
		case 569, 570: return 0; // Trams may not be damaged
		default: SetVehicleHealth(hitid, vhp);
	}
    return 1;
}
