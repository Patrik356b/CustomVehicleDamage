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
			case 400: CVDMG_OffRoad(cvdmg_adjust); // [400] Landstalker
			case 401: CVDMG_Saloons(cvdmg_adjust); // [401] Bravura
			case 402: CVDMG_Sports(cvdmg_adjust); // [402] Buffalo
			case 403: CVDMG_Industrial(cvdmg_adjust); // [403] Linerunner
			case 404: CVDMG_StationWagons(cvdmg_adjust); // [404] Pereniel

			case 405: CVDMG_Saloons(cvdmg_adjust); // [405] Sentinel
			case 406: CVDMG_Unique(cvdmg_adjust); // [406] Dumper
			case 407: CVDMG_PublicService(cvdmg_adjust); // [407] Firetruck
			case 408: CVDMG_Industrial(cvdmg_adjust); // [408] Trashmaster
			case 409: CVDMG_Unique(cvdmg_adjust); // [409] Stretch

			case 410: CVDMG_Saloons(cvdmg_adjust); // [410] Manana
			case 411: CVDMG_Sports(cvdmg_adjust); // [411] Infernus
			case 412: CVDMG_Lowriders(cvdmg_adjust); // [4] Voodoo
			case 413: CVDMG_Industrial(cvdmg_adjust); // [413] Pony
			case 414: CVDMG_Industrial(cvdmg_adjust); // [414] Mule

			case 415: CVDMG_Sports(cvdmg_adjust); // [415] Cheetah
			case 416: CVDMG_PublicService(cvdmg_adjust); // [416] Ambulance
			case 417: CVDMG_Helicopters(cvdmg_adjust); // [417] Leviathan
			case 418: CVDMG_StationWagons(cvdmg_adjust); // [418] Moonbeam
			case 419: CVDMG_Saloons(cvdmg_adjust); // [419] Esperanto

			case 420: CVDMG_PublicService(cvdmg_adjust); // [420] Taxi
			case 421: CVDMG_Saloons(cvdmg_adjust); // [421] Washington
			case 422: CVDMG_Industrial(cvdmg_adjust); // [422] Bobcat
			case 423: CVDMG_Unique(cvdmg_adjust); // [423] Mr Whoopee
			case 424: CVDMG_OffRoad(cvdmg_adjust); // [424] BF Injection

			case 425: CVDMG_Helicopters(cvdmg_adjust); // [425] Hunter
			case 426: CVDMG_Saloons(cvdmg_adjust); // [426] Premier
			case 427: CVDMG_PublicService(cvdmg_adjust); // [427] Enforcer
			case 428: CVDMG_Unique(cvdmg_adjust); // [428] Securicar
			case 429: CVDMG_Sports(cvdmg_adjust); // [429] Banshee

			case 430: CVDMG_Boats(cvdmg_adjust); // [430] Predator
			case 431: CVDMG_PublicService(cvdmg_adjust); // [431] Bus
			case 432: CVDMG_PublicService(cvdmg_adjust); // [432] Rhino
			case 433: CVDMG_PublicService(cvdmg_adjust); // [433] Barracks
			case 434: CVDMG_Unique(cvdmg_adjust); // [434] Hotknife

			case 435: CVDMG_Trailers(cvdmg_adjust); // [435] Trailer
			case 436: CVDMG_Saloons(cvdmg_adjust); // [436] Previon
			case 437: CVDMG_PublicService(cvdmg_adjust); // [437] Coach
			case 438: CVDMG_PublicService(cvdmg_adjust); // [438] Cabbie
			case 439: CVDMG_Convertibles(cvdmg_adjust); // [439] Stallion

			case 440: CVDMG_Industrial(cvdmg_adjust); // [440] Rumpo
			case 441: CVDMG_RC(cvdmg_adjust); // [441] RC Bandit
			case 442: CVDMG_Unique(cvdmg_adjust); // [442] Romero
			case 443: CVDMG_Industrial(cvdmg_adjust); // [443] Packer
			case 444: CVDMG_OffRoad(cvdmg_adjust); // [444] Monster

			case 445: CVDMG_Saloons(cvdmg_adjust); // [445] Admiral
			case 446: CVDMG_Boats(cvdmg_adjust); // [446] Squalo
			case 447: CVDMG_Helicopters(cvdmg_adjust); // [447] Seasparrow
			case 448: CVDMG_Bikes(cvdmg_adjust); // [448] Pizzaboy
			case 449: CVDMG_Train(cvdmg_adjust); // [449] Tram

			case 450: CVDMG_Trailers(cvdmg_adjust); // [450] Trailer
			case 451: CVDMG_Sports(cvdmg_adjust); // [451] Turismo
			case 452: CVDMG_Boats(cvdmg_adjust); // [452] Speeder
			case 453: CVDMG_Boats(cvdmg_adjust); // [453] Reefer
			case 454: CVDMG_Boats(cvdmg_adjust); // [454] Tropic

			case 455: CVDMG_Industrial(cvdmg_adjust); // [455] Flatbed
			case 456: CVDMG_Industrial(cvdmg_adjust); // [456] Yankee
			case 457: CVDMG_Unique(cvdmg_adjust); // [457] Caddy
			case 458: CVDMG_StationWagons(cvdmg_adjust); // [458] Solair
			case 459: CVDMG_Industrial(cvdmg_adjust); // [459] Berkley's RC Van

			case 460: CVDMG_Airplanes(cvdmg_adjust); // [460] Skimmer
			case 461: CVDMG_Bikes(cvdmg_adjust); // [461] PCJ-600
			case 462: CVDMG_Bikes(cvdmg_adjust); // [462] Faggio
			case 463: CVDMG_Bikes(cvdmg_adjust); // [463] Freeway
			case 464: CVDMG_RC(cvdmg_adjust); // [464] RC Baron

			case 465: CVDMG_RC(cvdmg_adjust); // [465] RC Raider
			case 466: CVDMG_Saloons(cvdmg_adjust); // [466] Glendale
			case 467: CVDMG_Saloons(cvdmg_adjust); // [467] Oceanic
			case 468: CVDMG_Bikes(cvdmg_adjust); // [468] Sanchez
			case 469: CVDMG_Helicopters(cvdmg_adjust); // [469] Sparrow

			case 470: CVDMG_OffRoad(cvdmg_adjust); // [470] Patriot
			case 471: CVDMG_Bikes(cvdmg_adjust); // [471] Quad
			case 472: CVDMG_Boats(cvdmg_adjust); // [472] Coastguard
			case 473: CVDMG_Boats(cvdmg_adjust); // [473] Dinghy
			case 474: CVDMG_Saloons(cvdmg_adjust); // [474] Hermes

			case 475: CVDMG_Sports(cvdmg_adjust); // [475] Sabre
			case 476: CVDMG_Airplanes(cvdmg_adjust); // [476] Rustler
			case 477: CVDMG_Sports(cvdmg_adjust); // [477] ZR 350
			case 478: CVDMG_Industrial(cvdmg_adjust); // [478] Walton
			case 479: CVDMG_StationWagons(cvdmg_adjust); // [479] Regina

			case 480: CVDMG_Convertibles(cvdmg_adjust); // [480] Comet
			case 481: CVDMG_Bikes(cvdmg_adjust); // [481] BMX
			case 482: CVDMG_Industrial(cvdmg_adjust); // [482] Burrito
			case 483: CVDMG_Unique(cvdmg_adjust); // [483] Camper
			case 484: CVDMG_Boats(cvdmg_adjust); // [484] Marquis

			case 485: CVDMG_Unique(cvdmg_adjust); // [485] Baggage
			case 486: CVDMG_Unique(cvdmg_adjust); // [486] Dozer
			case 487: CVDMG_Helicopters(cvdmg_adjust); // [487] Maverick
			case 488: CVDMG_Helicopters(cvdmg_adjust); // [488] News Chopper
			case 489: CVDMG_OffRoad(cvdmg_adjust); // [489] Rancher

			case 490: CVDMG_PublicService(cvdmg_adjust); // [490] FBI Rancher
			case 491: CVDMG_Saloons(cvdmg_adjust); // [491] Virgo
			case 492: CVDMG_Saloons(cvdmg_adjust); // [492] Greenwood
			case 493: CVDMG_Boats(cvdmg_adjust); // [493] Jetmax
			case 494: CVDMG_Sports(cvdmg_adjust); // [494] Hotring

			case 495: CVDMG_OffRoad(cvdmg_adjust); // [495] Sandking
			case 496: CVDMG_Sports(cvdmg_adjust); // [496] Blista Compact
			case 497: CVDMG_Helicopters(cvdmg_adjust); // [497] Police Maverick
			case 498: CVDMG_Industrial(cvdmg_adjust); // [498] Boxville
			case 499: CVDMG_Industrial(cvdmg_adjust); // [499] Benson

			case 500: CVDMG_OffRoad(cvdmg_adjust); // [500] Mesa
			case 501: CVDMG_RC(cvdmg_adjust); // [501] RC Goblin
			case 502: CVDMG_Sports(cvdmg_adjust); // [502] Hotring Racer A
			case 503: CVDMG_Sports(cvdmg_adjust); // [503] Hotring Racer B
			case 504: CVDMG_Saloons(cvdmg_adjust); // [504] Bloodring Banger

			case 505: CVDMG_OffRoad(cvdmg_adjust); // [505] Rancher
			case 506: CVDMG_Sports(cvdmg_adjust); // [506] Super GT
			case 507: CVDMG_Saloons(cvdmg_adjust); // [507] Elegant
			case 508: CVDMG_Unique(cvdmg_adjust); // [508] Journey
			case 509: CVDMG_Bikes(cvdmg_adjust); // [509] Bike

			case 510: CVDMG_Bikes(cvdmg_adjust); // [510] Mountain Bike
			case 511: CVDMG_Airplanes(cvdmg_adjust); // [511] Beagle
			case 512: CVDMG_Airplanes(cvdmg_adjust); // [512] Cropdust
			case 513: CVDMG_Airplanes(cvdmg_adjust); // [513] Stunt
			case 514: CVDMG_Industrial(cvdmg_adjust); // [514] Tanker

			case 515: CVDMG_Industrial(cvdmg_adjust); // [515] RoadTrain
			case 516: CVDMG_Saloons(cvdmg_adjust); // [516] Nebula
			case 517: CVDMG_Saloons(cvdmg_adjust); // [517] Majestic
			case 518: CVDMG_Saloons(cvdmg_adjust); // [518] Buccaneer
			case 519: CVDMG_Airplanes(cvdmg_adjust); // [519] Shamal

			case 520: CVDMG_Airplanes(cvdmg_adjust); // [520] Hydra
			case 521: CVDMG_Bikes(cvdmg_adjust); // [521] FCR-900
			case 522: CVDMG_Bikes(cvdmg_adjust); // [522] NRG-500
			case 523: CVDMG_Bikes(cvdmg_adjust); // [523] HPV1000
			case 524: CVDMG_Industrial(cvdmg_adjust); // [524] Cement Truck

			case 525: CVDMG_Unique(cvdmg_adjust); // [525] Tow Truck
			case 526: CVDMG_Saloons(cvdmg_adjust); // [526] Fortune
			case 527: CVDMG_Saloons(cvdmg_adjust); // [527] Cadrona
			case 528: CVDMG_PublicService(cvdmg_adjust); // [528] FBI Truck
			case 529: CVDMG_Saloons(cvdmg_adjust); // [529] Willard

			case 530: CVDMG_Unique(cvdmg_adjust); // [530] Forklift
			case 531: CVDMG_Industrial(cvdmg_adjust); // [531] Tractor
			case 532: CVDMG_Unique(cvdmg_adjust); // [532] Combine
			case 533: CVDMG_Convertibles(cvdmg_adjust); // [533] Feltzer
			case 534: CVDMG_Lowriders(cvdmg_adjust); // [534] Remington

			case 535: CVDMG_Lowriders(cvdmg_adjust); // [535] Slamvan
			case 536: CVDMG_Lowriders(cvdmg_adjust); // [536] Blade
			case 537: CVDMG_Train(cvdmg_adjust); // [537] Freight
			case 538: CVDMG_Train(cvdmg_adjust); // [538] Streak
			case 539: CVDMG_Unique(cvdmg_adjust); // [539] Vortex

			case 540: CVDMG_Saloons(cvdmg_adjust); // [540] Vincent
			case 541: CVDMG_Sports(cvdmg_adjust); // [541] Bullet
			case 542: CVDMG_Saloons(cvdmg_adjust); // [542] Clover
			case 543: CVDMG_Industrial(cvdmg_adjust); // [543] Sadler
			case 544: CVDMG_PublicService(cvdmg_adjust); // [544] Firetruck

			case 545: CVDMG_Unique(cvdmg_adjust); // [545] Hustler
			case 546: CVDMG_Saloons(cvdmg_adjust); // [546] Intruder
			case 547: CVDMG_Saloons(cvdmg_adjust); // [547] Primo
			case 548: CVDMG_Helicopters(cvdmg_adjust); // [548] Cargobob
			case 549: CVDMG_Saloons(cvdmg_adjust); // [549] Tampa

			case 550: CVDMG_Saloons(cvdmg_adjust); // [550] Sunrise
			case 551: CVDMG_Saloons(cvdmg_adjust); // [551] Merit
			case 552: CVDMG_Industrial(cvdmg_adjust); // [552] Utility
			case 553: CVDMG_Airplanes(cvdmg_adjust); // [553] Nevada
			case 554: CVDMG_Industrial(cvdmg_adjust); // [554] Yosemite

			case 555: CVDMG_Convertibles(cvdmg_adjust); // [555] Windsor
			case 556: CVDMG_OffRoad(cvdmg_adjust); // [556] Monster A
			case 557: CVDMG_OffRoad(cvdmg_adjust); // [557] Monster B
			case 558: CVDMG_Sports(cvdmg_adjust); // [558] Uranus
			case 559: CVDMG_Sports(cvdmg_adjust); // [559] Jester

			case 560: CVDMG_Saloons(cvdmg_adjust); // [560] Sultan
			case 561: CVDMG_StationWagons(cvdmg_adjust); // [561] Stratum
			case 562: CVDMG_Saloons(cvdmg_adjust); // [562] Elegy
			case 563: CVDMG_Helicopters(cvdmg_adjust); // [563] Raindance
			case 564: CVDMG_RC(cvdmg_adjust); // [564] RC Tiger

			case 565: CVDMG_Sports(cvdmg_adjust); // [565] Flash
			case 566: CVDMG_Lowriders(cvdmg_adjust); // [566] Tahoma
			case 567: CVDMG_Lowriders(cvdmg_adjust); // [567] Savanna
			case 568: CVDMG_OffRoad(cvdmg_adjust); // [568] Bandito
			case 569: CVDMG_Train(cvdmg_adjust); // [569] Freight

			case 570: CVDMG_Train(cvdmg_adjust); // [570] Trailer
			case 571: CVDMG_Unique(cvdmg_adjust); // [571] Kart
			case 572: CVDMG_Unique(cvdmg_adjust); // [572] Mower
			case 573: CVDMG_OffRoad(cvdmg_adjust); // [573] Duneride
			case 574: CVDMG_Unique(cvdmg_adjust); // [574] Sweeper

			case 575: CVDMG_Lowriders(cvdmg_adjust); // [575] Broadway
			case 576: CVDMG_Lowriders(cvdmg_adjust); // [576] Tornado
			case 577: CVDMG_Airplanes(cvdmg_adjust); // [577] AT-400
			case 578: CVDMG_Industrial(cvdmg_adjust); // [578] DFT-30
			case 579: CVDMG_OffRoad(cvdmg_adjust); // [579] Huntley

			case 580: CVDMG_Saloons(cvdmg_adjust); // [580] Stafford
			case 581: CVDMG_Bikes(cvdmg_adjust); // [581] BF-400
			case 582: CVDMG_Industrial(cvdmg_adjust); // [582] Newsvan
			case 583: CVDMG_Unique(cvdmg_adjust); // [583] Tug
			case 584: CVDMG_Trailers(cvdmg_adjust); // [584] Trailer A

			case 585: CVDMG_Saloons(cvdmg_adjust); // [585] Emperor
			case 586: CVDMG_Bikes(cvdmg_adjust); // [586] Wayfarer
			case 587: CVDMG_Sports(cvdmg_adjust); // [587] Euros
			case 588: CVDMG_Unique(cvdmg_adjust); // [588] Hotdog
			case 589: CVDMG_Sports(cvdmg_adjust); // [589] Club

			case 590: CVDMG_Train(cvdmg_adjust); // [590] Trailer B
			case 591: CVDMG_Trailers(cvdmg_adjust); // [591] Trailer C
			case 592: CVDMG_Airplanes(cvdmg_adjust); // [592] Andromada
			case 593: CVDMG_Airplanes(cvdmg_adjust); // [593] Dodo
			case 594: CVDMG_RC(cvdmg_adjust); // [594] RC Cam

			case 595: CVDMG_Boats(cvdmg_adjust); // [595] Launch
			case 596: CVDMG_PublicService(cvdmg_adjust); // [596] Police Car (LSPD)
			case 597: CVDMG_PublicService(cvdmg_adjust); // [597] Police Car (SFPD)
			case 598: CVDMG_PublicService(cvdmg_adjust); // [598] Police Car (LVPD)
			case 599: CVDMG_PublicService(cvdmg_adjust); // [599] Police Ranger

			case 600: CVDMG_Industrial(cvdmg_adjust); // [600] Picador
			case 601: CVDMG_PublicService(cvdmg_adjust); // [601] S.W.A.T. Van
			case 602: CVDMG_Sports(cvdmg_adjust); // [602] Alpha
			case 603: CVDMG_Sports(cvdmg_adjust); // [603] Phoenix
			case 604: CVDMG_Saloons(cvdmg_adjust); // [604] Glendale

			case 605: CVDMG_Industrial(cvdmg_adjust); // [605] Sadler
			case 606: CVDMG_Trailers(cvdmg_adjust); // [606] Luggage Trailer A
			case 607: CVDMG_Trailers(cvdmg_adjust); // [607] Luggage Trailer B
			case 608: CVDMG_Trailers(cvdmg_adjust); // [608] Stair Trailer
			case 609: CVDMG_Industrial(cvdmg_adjust); // [609] Boxville

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
	// WEAPON_FIST
	// WEAPON_BRASSKNUCKLE
	// WEAPON_GOLFCLUB
	// WEAPON_NITESTICK
	// WEAPON_KNIFE
	// WEAPON_BAT
	// WEAPON_SHOVEL
	// WEAPON_POOLSTICK
	// WEAPON_KATANA
	// WEAPON_CHAINSAW
	// WEAPON_DILDO
	// WEAPON_DILDO2
	// WEAPON_VIBRATOR
	// WEAPON_VIBRATOR2
	// WEAPON_FLOWER
	// WEAPON_CANE
	
	VEHICLE_DAMAGE_PISTOL
	// WEAPON_COLT45
	// WEAPON_SILENCED 
	// WEAPON_DEAGLE

	VEHICLE_DAMAGE_SMG
	// WEAPON_UZI
	// WEAPON_MP5
	// WEAPON_TEC9

	VEHICLE_DAMAGE_SHOTGUN
	// WEAPON_VEHICLE_DAMAGE_SHOTGUN
	// WEAPON_SAWEDOFF
	// WEAPON_SHOTGSPA

	VEHICLE_DAMAGE_ASSAULT
	// WEAPON_AK47
	// WEAPON_M4

	VEHICLE_DAMAGE_RIFLE
	// WEAPON_VEHICLE_DAMAGE_RIFLE
	// WEAPON_SNIPER
	*/

CVDMG_Airplanes(modelid)
{
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_MELEE]   = 3   ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_PISTOL]  = 8   ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_SMG]     = 13  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_SHOTGUN] = 19  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_ASSAULT] = 17  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_RIFLE]   = 25  ;
	return 1;
}

CVDMG_Helicopters(modelid)
{
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_MELEE]   = 8   ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_PISTOL]  = 13  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_SMG]     = 15  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_SHOTGUN] = 21  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_ASSAULT] = 23  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_RIFLE]   = 20  ;
	return 1;
}

CVDMG_Bikes(modelid)
{
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_MELEE]   = 13  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_PISTOL]  = 19  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_SMG]     = 25  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_SHOTGUN] = 36  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_ASSAULT] = 32  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_RIFLE]   = 40  ;
	return 1;
}

CVDMG_Convertibles(modelid)
{
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_MELEE]   = 13  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_PISTOL]  = 43  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_SMG]     = 45  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_SHOTGUN] = 66  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_ASSAULT] = 52  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_RIFLE]   = 80  ;
	return 1;
}

CVDMG_Industrial(modelid)
{
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_MELEE]   = 3  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_PISTOL]  = 9  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_SMG]     = 15  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_SHOTGUN] = 26  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_ASSAULT] = 35  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_RIFLE]   = 60  ;
	return 1;
}

CVDMG_Lowriders(modelid)
{
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_MELEE]   = 33  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_PISTOL]  = 21  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_SMG]     = 24  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_SHOTGUN] = 46  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_ASSAULT] = 39  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_RIFLE]   = 100 ;
	return 1;
}

CVDMG_OffRoad(modelid)
{
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_MELEE]   = 13  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_PISTOL]  = 31  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_SMG]     = 39  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_SHOTGUN] = 46  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_ASSAULT] = 59  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_RIFLE]   = 47  ;
	return 1;
}

CVDMG_PublicService(modelid)
{
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_MELEE]   = 3   ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_PISTOL]  = 11  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_SMG]     = 31  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_SHOTGUN] = 46  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_ASSAULT] = 49  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_RIFLE]   = 27  ;
	return 1;
}

CVDMG_Saloons(modelid)
{
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_MELEE]   = 33  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_PISTOL]  = 40  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_SMG]     = 61  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_SHOTGUN] = 76  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_ASSAULT] = 89  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_RIFLE]   = 107 ;
	return 1;
}

CVDMG_Sports(modelid)
{
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_MELEE]   = 53  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_PISTOL]  = 30  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_SMG]     = 41  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_SHOTGUN] = 56  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_ASSAULT] = 69  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_RIFLE]   = 77  ;
	return 1;
}

CVDMG_StationWagons(modelid)
{
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_MELEE]   = 69  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_PISTOL]  = 50  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_SMG]     = 69  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_SHOTGUN] = 69  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_ASSAULT] = 89  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_RIFLE]   = 88  ;
	return 1;
}

CVDMG_Boats(modelid)
{
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_MELEE]   = 99  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_PISTOL]  = 52  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_SMG]     = 59  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_SHOTGUN] = 69  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_ASSAULT] = 79  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_RIFLE]   = 99  ;
	return 1;
}

CVDMG_Unique(modelid)
{
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_MELEE]   = 31  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_PISTOL]  = 42  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_SMG]     = 49  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_SHOTGUN] = 53  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_ASSAULT] = 69  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_RIFLE]   = 111 ;
	return 1;
}

CVDMG_RC(modelid)
{
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_MELEE]   = 99  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_PISTOL]  = 72  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_SMG]     = 89  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_SHOTGUN] = 129 ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_ASSAULT] = 111 ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_RIFLE]   = 180 ;
	return 1;
}

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

CVDMG_Train(modelid)
{
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_MELEE]   = 3   ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_PISTOL]  = 8   ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_SMG]     = 12  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_SHOTGUN] = 17  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_ASSAULT] = 24  ;
	VehicleDamage[vehicleid][VEHICLE_DAMAGE_RIFLE]   = 33  ;
	return 1;
}
