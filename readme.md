Custom Vehicle Damage
=====================

Finally we can customize the tollerance of different weapons to different vehicles

    The license in CVDMG states that CVDMG is free and provided as-is without any warranty.
	Please see the detailed license which can be found inside LICENSE.md

----

Installation
=====================

    Copy directory "CVDMG" to pawno/include (you may pick another path of course, adjust paths accordingly if so)

    Now you need to make sure you include the files correctly in your filterscript or gamemode
    (It's recommended to be included in the gamemode, not a filterscript)
    
    You may either take advantage of CVDMG.basic.pwn or follow the following guide to properly implement CVDMG:

    If you do not already have IsPointInPolygon by Ryder`
    #include <CVDMG\aera>
   
    If you do not already have GetVehicleSize by Ryder`
    #include <CVDMG\GetVehicleSize>
    
    If you would like to lower vehicle collision damage by roughly half, add this line:
    #define HALF_VEHICLE_COLLISION_DAMAGE
    
    Next, You need to configure the colors a train should have when it respawns
    Example:
    #define TRAIN_COLOR_1 1 // White
    #define TRAIN_COLOR_2 3 // Red

    The last step is to include the system itself by adding these 3 lines:
    #include <CVDMG\FindVehicleNearPlayer> // Checks if player is within range of hitting or operating a vehicle
    #include <CVDMG\VehicleDamage.inc> // Custom Vehicle Damage Script - Configuration
    #include <CVDMG\VehicleDamage.pwn> // Custom Vehicle Damage Script - Core

    To activate the system, you have to find your OnPlayerWeaponShot callback or add/merge it with the following content:
    if(hittype == BULLET_HIT_TYPE_VEHICLE)
    {
        OnBulletHitVehicle(weaponid, hitid); // Apply custom damage
    	return 0; // Have to return 0 or custom damage will not be applied
    }
----

Notes
=====================
    If you would like to change the toughness of a vehicle, go edit VehicleDamage.inc line 64-359
    Or you could take a look at how CVDMG.override.pwn is overriding the default values, it has every vehicle indexed like the vehicle list on wiki.sa-mp.com

    Train colors does not have to be static, they can use functions
    Example:
    #define TRAIN_COLOR_1 random(255)   // Random color 1
    #define TRAIN_COLOR_2 random(25)+70 // Random color 2

    Train colors can also be stored values
    Example:
    enum eTrain
    {
        col1, col2
    };

    new vTrain[MAX_VEHICLES][eTrain];

    #define TRAIN_COLOR_1 vTrain[vehicleid][col1]
    #define TRAIN_COLOR_2 vTrain[vehicleid][col2]

----

	Optional Feature
	===================
	
	See the TXT file inside CVDMG-overview.zip for how to easily generate a table of the current settings inside VehicleDamage.inc
	(PHP webhost required. You can set up a local webhost with php to run this if you want to)

----

	Versons & ChangeLog
	===================

	Current Version: v. 1.3.1
    Restore old feature that was never published (See Optional section)

----

	Older versions:

	Current Version: v. 1.3
    Bugfixes & API improvement

	Version v. 1.2
    Initial Release

	Version v. 1.1 and older
    Never released because proof-of-concept code needed optimizations and clean ups
