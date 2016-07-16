/*======================================================================================================//
	Custom Vehicle Damage - Damage Configuration

	Credits:
		Patrik356b
			https://github.com/Patrik356b
//======================================================================================================*/

enum VehicleDamageType
{
	VEHICLE_DAMAGE_MELEE,
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
	
	VEHICLE_DAMAGE_PISTOL,
	// WEAPON_COLT45
	// WEAPON_SILENCED 
	// WEAPON_DEAGLE

	VEHICLE_DAMAGE_SMG,
	// WEAPON_UZI
	// WEAPON_MP5
	// WEAPON_TEC9

	VEHICLE_DAMAGE_SHOTGUN,
	// WEAPON_SHOTGUN
	// WEAPON_SAWEDOFF
	// WEAPON_SHOTGSPA

	VEHICLE_DAMAGE_ASSAULT,
	// WEAPON_AK47
	// WEAPON_M4

	VEHICLE_DAMAGE_RIFLE
	// WEAPON_RIFLE
	// WEAPON_SNIPER

	//VEHICLE_DAMAGE_HEAVY // we can not detect flamethrower/rpg or other heavy weapons yet
}

  //=============================================================================================//
 // Configuration                                                                               //
//=============================================================================================//

// 	Damage Multiplier - Per bullet/hit
// Example: {   44,     66,  22,      36,      40, 100} // [533] Feltzer
//           MELEE, PISTOL, SMG, SHOTGUN, ASSAULT, RIFLE

new VehicleDamage[][VehicleDamageType] = {
	{40,  60, 50, 44,  40,  90}, // [400] Landstalker
	{84, 106, 80, 67,  48, 210}, // [401] Bravura
	{ 6,  17, 21, 27,  21,  31}, // [402] Buffalo
	{27,  44, 76, 88, 104, 101}, // [403] Linerunner
	{57,  64, 84, 98, 134, 150}, // [404] Pereniel
// MELEE, PISTOL, SMG, SHOTGUN, ASSAULT, RIFLE

	{57, 64, 86, 125, 119, 101}, // [405] Sentinel
	{13, 23, 45,  51,  67,  73}, // [406] Dumper
	{12, 24, 42,  49,  63,  71}, // [407] Firetruck
	{23, 33, 45,  51,  67, 143}, // [408] Trashmaster
	{12, 12, 24,  26,  23,  27}, // [409] Stretch
// MELEE, PISTOL, SMG, SHOTGUN, ASSAULT, RIFLE

	{44, 49, 52,  59,  62, 103}, // [410] Manana
	{10, 13, 24,  34,  47,  81}, // [411] Infernus
	{52, 61, 81, 105, 132, 191}, // [412] Voodoo
	{44, 49, 52,  59,  62, 103}, // [413] Pony
	{52, 61, 81, 105, 132, 191}, // [414] Mule
// MELEE, PISTOL, SMG, SHOTGUN, ASSAULT, RIFLE

	{ 6,  17, 21,  27,  21,  13}, // [415] Cheetah
	{12,  24, 42,  49,  63,  71}, // [416] Ambulance
	{ 4,   8, 17,  17,  28,  18}, // [417] Leviathan
	{69, 84, 104, 138, 174, 193}, // [418] Moonbeam
	{ 6,  17, 21,  27,  21,  13}, // [419] Esperanto
// MELEE, PISTOL, SMG, SHOTGUN, ASSAULT, RIFLE

	{57, 64,  86, 153, 103, 201}, // [420] Taxi
	{12, 12,  24,  26,  23,  27}, // [421] Washington
	{57, 64,  86, 125, 119, 101}, // [422] Bobcat
	{66, 98, 120, 145, 167, 153}, // [423] Mr Whoopee
	{10, 13,  24,  34,  47,  81}, // [424] BF Injection
// MELEE, PISTOL, SMG, SHOTGUN, ASSAULT, RIFLE

	{1,  5,   7,  9, 13,  17}, // [425] Hunter
	{32, 41, 51, 65, 72,  91}, // [426] Premier
	{1,   2,  4,  3,  5,   2}, // [427] Enforcer
	{1,   2,  3,  4,  5,   2}, // [428] Securicar
	{61, 68, 75, 88, 90, 141}, // [429] Banshee
// MELEE, PISTOL, SMG, SHOTGUN, ASSAULT, RIFLE

	{12, 21,  41,  55,  62,  81}, // [430] Predator
	{32, 41,  51,  65,  72,  91}, // [431] Bus
	{1,   5,   7,   9,  13,  17}, // [432] Rhino
	{12, 12,  24,  26,  23,  27}, // [433] Barracks
	{12, 12,  24,  26,  23,  27}, // [434] Hotknife
// MELEE, PISTOL, SMG, SHOTGUN, ASSAULT, RIFLE

	{ 9, 16, 27,  38,  34,  13}, // [435] Trailer
	{57, 64, 86, 153, 103, 201}, // [436] Previon
	{12, 18, 25,  34,  44,  15}, // [437] Coach
	{57, 64, 86, 153, 103, 201}, // [438] Cabbie
	{45, 62, 78,  99,  70, 121}, // [439] Stallion
// MELEE, PISTOL, SMG, SHOTGUN, ASSAULT, RIFLE

	{57, 64, 86, 73, 93, 201}, // [440] Rumpo
	{ 3,  9, 13, 17, 22,  31}, // [441] RC Bandit
	{13, 23, 44, 84, 34, 130}, // [442] Romero
	{12, 21, 41, 55, 62,  81}, // [443] Packer
	{13, 23, 44, 84, 34, 130}, // [444] Monster
// MELEE, PISTOL, SMG, SHOTGUN, ASSAULT, RIFLE

	{25, 37, 41, 47, 54,  91}, // [445] Admiral
	{12, 29, 41, 59, 69, 183}, // [446] Squalo
	{4,   8, 17, 17, 28,  18}, // [447] Seasparrow
	{30, 50, 35, 40, 65,  79}, // [448] Pizzaboy
	{ 9, 16, 27, 38, 34,  13}, // [449] Tram
// MELEE, PISTOL, SMG, SHOTGUN, ASSAULT, RIFLE

	{ 9, 16,  27,  38,  34,  13}, // [450] Trailer
	{ 3, 11,  19,  24,  27,  31}, // [451] Turismo
	{13, 39,  54,  81,  89, 183}, // [452] Speeder
	{13, 39,  54,  79,  89, 183}, // [453] Reefer
	{15, 43,  59,  82,  93, 283}, // [454] Tropic
// MELEE, PISTOL, SMG, SHOTGUN, ASSAULT, RIFLE

	{ 3, 11, 19, 24, 27,  31}, // [455] Flatbed
	{30, 50, 35, 40, 65,  79}, // [456] Yankee
	{15, 43, 59, 82, 93, 283}, // [457] Caddy
	{40, 64, 84, 87, 94, 100}, // [458] Solair
	{ 3, 11, 19, 24, 27,  31}, // [459] Berkley's RC Van
// MELEE, PISTOL, SMG, SHOTGUN, ASSAULT, RIFLE

	{ 4,  6, 20, 14, 40, 10}, // [460] Skimmer
	{ 8, 19, 27, 47, 42, 49}, // [461] PCJ-600
	{40, 60, 40, 42, 67, 83}, // [462] Faggio
	{11, 22, 31, 37, 42, 82}, // [463] Freeway
	{ 3,  9, 13, 17, 22, 31}, // [464] RC Baron
// MELEE, PISTOL, SMG, SHOTGUN, ASSAULT, RIFLE

	{ 3,  9, 13, 17, 22, 31}, // [465] RC Raider
	{21, 40, 60, 80, 82, 93}, // [466] Glendale
	{27, 40, 68, 84, 86, 93}, // [467] Oceanic
	{ 6, 10, 21, 24, 27,  9}, // [468] Sanchez
	{ 3, 11, 19, 24, 27, 31}, // [469] Sparrow
// MELEE, PISTOL, SMG, SHOTGUN, ASSAULT, RIFLE

	{ 4,  9, 17, 21, 24,   7}, // [470] Patriot
	{ 6, 10, 21, 24, 27,   9}, // [471] Quad
	{ 3,  9, 13, 17, 22,  31}, // [472] Coastguard
	{ 8, 13, 18, 24, 37, 209}, // [473] Dinghy
	{19, 26, 39, 31, 49, 152}, // [474] Hermes
// MELEE, PISTOL, SMG, SHOTGUN, ASSAULT, RIFLE

	{ 8, 12, 17, 29, 32, 38}, // [475] Sabre
	{27, 34, 46, 53, 64, 91}, // [476] Rustler
	{ 9, 15, 21, 27, 31, 36}, // [477] ZR 350
	{37, 44, 56, 63, 74, 99}, // [478] Walton
	{27, 54, 64, 82, 84, 90}, // [479] Regina
// MELEE, PISTOL, SMG, SHOTGUN, ASSAULT, RIFLE

	{46, 51, 64, 74, 87, 129}, // [480] Comet
	{ 1,  2,  2,  3,  3,   1}, // [481] BMX
	{14, 16, 30, 24, 30,   7}, // [482] Burrito
	{ 6, 11, 34, 39, 27, 129}, // [483] Camper
	{ 8, 12, 17, 29, 32,  38}, // [484] Marquis
// MELEE, PISTOL, SMG, SHOTGUN, ASSAULT, RIFLE

	{46, 75, 93, 104, 127, 229}, // [485] Baggage
	{ 8, 12, 17,  29,  32,  38}, // [486] Dozer
	{ 6, 10, 21,  24,  27,   9}, // [487] Maverick
	{ 6, 10, 21,  24,  27,   9}, // [488] News Chopper
	{12, 24, 49,  23,  20,  28}, // [489] Rancher
// MELEE, PISTOL, SMG, SHOTGUN, ASSAULT, RIFLE

	{3,   8, 13, 18, 22,  3}, // [490] FBI Rancher
	{12, 12, 24, 26, 23, 27}, // [491] Virgo
	{15, 17, 32, 26, 42, 52}, // [492] Greenwood
	{12, 18, 25, 34, 44,  1}, // [493] Jetmax
	{14, 16, 29, 24, 49, 71}, // [494] Hotring
// MELEE, PISTOL, SMG, SHOTGUN, ASSAULT, RIFLE

	{12, 14, 21, 25, 22,  29}, // [495] Sandking
	{12, 24, 31, 41, 32,  79}, // [496] Blista Compact
	{ 3,  8, 13, 18, 22,   3}, // [497] Police Maverick
	{14, 26, 32, 44, 54,  35}, // [498] Boxville
	{69, 91, 94, 82, 97, 283}, // [499] Benson
// MELEE, PISTOL, SMG, SHOTGUN, ASSAULT, RIFLE

	{129, 91, 94, 102, 127, 283}, // [500] Mesa
	{  3,  9, 13,  17,  22,  31}, // [501] RC Goblin
	{ 15, 17, 31,  27,  44,  61}, // [502] Hotring Racer A
	{ 15, 15, 27,  21,  54,  81}, // [503] Hotring Racer B
	{  6, 11, 23,  25,  21,  25}, // [504] Bloodring Banger
// MELEE, PISTOL, SMG, SHOTGUN, ASSAULT, RIFLE

	{ 8, 21, 29, 22,  19,  25}, // [505] Rancher
	{27, 44, 76, 88, 104, 101}, // [506] Super GT
	{27, 37, 62, 75,  84,  91}, // [507] Elegant
	{47, 61, 78, 87,  94,  87}, // [508] Journey
	{ 1,  2,  3,  4,   5,   2}, // [509] Bike
// MELEE, PISTOL, SMG, SHOTGUN, ASSAULT, RIFLE

	{ 1,  2,  3,   3,  3,   2}, // [510] Mountain Bike
	{ 9, 19, 24,  38, 49,  83}, // [511] Beagle
	{59, 69, 74, 108, 94, 130}, // [512] Cropdust
	{ 8, 18, 29,  43, 61,  43}, // [513] Stunt
	{27, 44, 76, 88, 104, 101}, // [514] Tanker
// MELEE, PISTOL, SMG, SHOTGUN, ASSAULT, RIFLE

	{ 8, 21, 29, 22, 19,  25}, // [515] RoadTrain
	{39, 44, 55, 63, 73, 148}, // [516] Nebula
	{15, 17, 32, 26, 42,  52}, // [517] Majestic
	{15, 17, 32, 26, 42,  52}, // [518] Buccaneer
	{ 8, 21, 29, 25, 22,  27}, // [519] Shamal
// MELEE, PISTOL, SMG, SHOTGUN, ASSAULT, RIFLE

	{ 1,  5,  7,   9, 13, 17}, // [520] Hydra
	{ 6, 12, 24,  27, 32, 12}, // [521] FCR-900
	{ 8, 18, 32,  36, 37, 43}, // [522] NRG-500
	{ 9, 13, 19,  23, 31, 14}, // [523] HPV1000
	{44, 66, 22, 141, 80, 99}, // [524] Cement Truck
// MELEE, PISTOL, SMG, SHOTGUN, ASSAULT, RIFLE

	{14, 16, 30, 24, 30,  70}, // [525] Tow Truck
	{70, 78, 86, 82, 98, 103}, // [526] Fortune
	{40, 60, 50, 44, 40,  90}, // [527] Cadrona
	{ 7, 13, 18, 21, 24,   3}, // [528] FBI Truck
	{18, 29, 43, 53, 67, 143}, // [529] Willard
// MELEE, PISTOL, SMG, SHOTGUN, ASSAULT, RIFLE

	{14, 16, 30, 24, 31, 70}, // [530] Forklift
	{11, 27, 43, 29, 39, 70}, // [531] Tractor
	{15, 24, 45, 28, 34, 70}, // [532] Combine
	{14, 16, 30, 24, 30,  7}, // [533] Feltzer
	{14, 16, 30, 24, 30,  7}, // [534] Remington
// MELEE, PISTOL, SMG, SHOTGUN, ASSAULT, RIFLE

	{ 5, 13, 12, 15, 17, 103}, // [535] Slamvan
	{ 3,  9, 19, 18, 17, 103}, // [536] Blade
	{ 9, 16, 27, 38, 34,  13}, // [537] Freight
	{ 9, 16, 27, 38, 34,  13}, // [538] Streak
	{19, 38, 61, 67, 72, 101}, // [539] Vortex
// MELEE, PISTOL, SMG, SHOTGUN, ASSAULT, RIFLE

	{31, 39, 53, 59, 76, 183}, // [540] Vincent
	{16, 36, 61, 68, 80, 111}, // [541] Bullet
	{15, 17, 32, 26, 42,  52}, // [542] Clover
	{21, 48, 59, 63, 74,  81}, // [543] Sadler
	{19, 38, 61, 67, 72, 101}, // [544] Firetruck
// MELEE, PISTOL, SMG, SHOTGUN, ASSAULT, RIFLE

	{19, 26, 39, 31, 49, 152}, // [545] Hustler
	{19, 26, 39, 31, 49, 152}, // [546] Intruder
	{41, 52, 57, 62, 69, 133}, // [547] Primo
	{33, 43, 49, 58, 71, 103}, // [548] Cargobob
	{26, 46, 79, 69, 81, 111}, // [549] Tampa
// MELEE, PISTOL, SMG, SHOTGUN, ASSAULT, RIFLE

	{23, 33, 45, 51, 67, 143}, // [550] Sunrise
	{33, 43, 49, 58, 71, 103}, // [551] Merit
	{23, 33, 45, 51, 67, 143}, // [552] Utility
	{31, 44, 52, 59, 64, 123}, // [553] Nevada
	{14, 16, 30, 24, 30,   7}, // [554] Yosemite
// MELEE, PISTOL, SMG, SHOTGUN, ASSAULT, RIFLE

	{14, 16, 30, 24, 30,   7}, // [555] Windsor
	{15, 21, 48, 89, 36, 130}, // [556] Monster A
	{11, 25, 40, 80, 32, 130}, // [557] Monster B
	{4,  8, 17,  17, 28,  18}, // [558] Uranus
	{6,  8, 16,  17, 29,  19}, // [559] Jester
// MELEE, PISTOL, SMG, SHOTGUN, ASSAULT, RIFLE

	{7,  12, 17, 21, 24,  7}, // [560] Sultan
	{9,  16, 19, 23, 25,  6}, // [561] Stratum
	{14, 16, 30, 24, 30,  7}, // [562] Elegy
	{4,   8, 17, 17, 28, 18}, // [563] Raindance
	{3,   9, 13, 17, 22, 31}, // [564] RC Tiger
// MELEE, PISTOL, SMG, SHOTGUN, ASSAULT, RIFLE

	{ 7, 10, 12,  16, 19,  14}, // [565] Flash
	{23, 41, 44,  54, 67, 101}, // [566] Tahoma
	{ 7, 10, 12,  16, 19,  14}, // [567] Savanna
	{19, 38, 43,  53, 63,  82}, // [568] Bandito
	{ 9, 16, 27,  38, 34,  13}, // [569] Freight
// MELEE, PISTOL, SMG, SHOTGUN, ASSAULT, RIFLE

	{ 9, 16,  27,  38,  34,  13}, // [570] Trailer
	{ 6, 10,  21,  24,  27,   9}, // [571] Kart
	{62, 96, 119, 139, 161, 171}, // [572] Mower
	{23, 41,  44,  54,  67, 101}, // [573] Duneride
	{23, 33,  45,  51,  67, 143}, // [574] Sweeper
// MELEE, PISTOL, SMG, SHOTGUN, ASSAULT, RIFLE

	{ 3, 13, 19, 15, 17, 103}, // [575] Broadway
	{12, 18, 25, 34, 44,   1}, // [576] Tornado
	{ 4, 13, 28, 23, 31,   9}, // [577] AT-400
	{12, 18, 25, 34, 44,   1}, // [578] DFT-30
	{14, 16, 30, 24, 30,   7}, // [579] Huntley
// MELEE, PISTOL, SMG, SHOTGUN, ASSAULT, RIFLE

	{26, 46, 79,  69,  81, 111}, // [580] Stafford
	{10, 20, 30,  42,  37,  53}, // [581] BF-400
	{ 6, 10, 21,  24,  27,   9}, // [582] Newsvan
	{46, 75, 93, 104, 127, 229}, // [583] Tug
	{ 9, 16, 27,  38,  34,  13}, // [584] Trailer A
// MELEE, PISTOL, SMG, SHOTGUN, ASSAULT, RIFLE

	{10, 20,  30,  42,  37,  53}, // [585] Emperor
	{36, 42,  44,  47,  72,  92}, // [586] Wayfarer
	{ 6, 10,  21,  24,  27,   9}, // [587] Euros
	{66, 98, 120, 145, 167, 153}, // [588] Hotdog
	{31, 46,  44,  47,  78,  99}, // [589] Club
// MELEE, PISTOL, SMG, SHOTGUN, ASSAULT, RIFLE

	{ 9, 16, 27,  38,  34,  13}, // [590] Trailer B
	{ 9, 16, 27,  38,  34,  13}, // [591] Trailer C
	{ 2, 11, 21,  31,  41,   1}, // [592] Andromada
	{ 6, 10, 21,  24,  27,   9}, // [593] Dodo
	{46, 75, 93, 104, 127, 229}, // [594] RC Cam
// MELEE, PISTOL, SMG, SHOTGUN, ASSAULT, RIFLE

	{6, 10, 21, 24, 27,   9}, // [595] Launch
	{5, 16, 30, 20, 39,  62}, // [596] Police Car (LSPD)
	{5, 18, 29, 21, 41,  61}, // [597] Police Car (SFPD)
	{5, 16, 30, 19, 40,  63}, // [598] Police Car (LVPD)
	{5, 16, 29, 21, 41,  66}, // [599] Police Ranger
// MELEE, PISTOL, SMG, SHOTGUN, ASSAULT, RIFLE

	{ 5, 16, 29,  21, 39,  62}, // [600] Picador
	{ 1,  2,  3,   3,  3,   2}, // [601] S.W.A.T. Van
	{59, 69, 74, 108, 94, 130}, // [602] Alpha
	{ 4,  9, 14,  17, 21,  13}, // [603] Phoenix
	{23, 35, 43,  54, 67,  89}, // [604] Glendale
// MELEE, PISTOL, SMG, SHOTGUN, ASSAULT, RIFLE

	{59, 69, 74, 108, 94, 130}, // [605] Sadler
	{ 9, 16, 27,  38, 34,  13}, // [606] Luggage Trailer A
	{ 9, 16, 27,  38, 34,  13}, // [607] Luggage Trailer B
	{12, 18, 25,  34, 44,   1}, // [608] Stair Trailer
	{ 8, 15, 23,  34, 44,  25}, // [609] Boxville
// MELEE, PISTOL, SMG, SHOTGUN, ASSAULT, RIFLE
	
	{12, 18, 25, 34, 44,  1}, // [610] Farm Plow
	{12, 18, 25, 34, 44,  1}  // [611] Utility Trailer
// MELEE, PISTOL, SMG, SHOTGUN, ASSAULT, RIFLE
};
