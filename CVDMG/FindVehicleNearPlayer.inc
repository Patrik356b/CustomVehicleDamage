
  //======================================================================================================//
 //   FindVehicleNearPlayer(playerid) function by Patrik356b  ----  https://github.com/Patrik356b        //
//======================================================================================================//

// Do not change
#define VEHICLE_ACTION_RANGE 1.75

// Fucntion: Will return 0 if no vehicle was found near the player
// Function: Will return VehicleID of the first vehicle player is very close to

FindVehicleNearPlayer(playerid)
{
	new Float:hitX, Float:hitY, Float:hitZ;
	GetPlayerPos(playerid, hitX, hitY, hitZ);

	for(new v=1; v <= MAX_VEHICLES; v++)
	{
		new vm=GetVehicleModel(v);
    	switch(vm)
    	{
    		// Disabled for trains cause of angle mismatching
    		case 449, 537, 538, 569, 570: continue;
    	}

    	new Float:x, Float:y, Float:z;
		GetVehiclePos(v, x, y, z);
		if(x == 0.0 && y == 0.0 && z == 0.0) continue; // not spawned

		new Float:size_X, Float:size_Y, Float:size_Z, Float:a;
		GetVehicleSize(vm, size_X, size_Y, size_Z);
		GetVehicleZAngle(v, a);
		
		// Append vehicle rotation
		// Translate to coords
		new Float:points[8];

		points[0] = x + (((size_X+VEHICLE_ACTION_RANGE) * floatcos(a, degrees) - size_Y * floatsin(a, degrees))/VEHICLE_ACTION_RANGE);
		points[1] = y + ((size_X * floatsin(a, degrees) + size_Y * floatcos(a, degrees))/VEHICLE_ACTION_RANGE);

		points[2] = x + (((-size_X-VEHICLE_ACTION_RANGE) * floatcos(a, degrees) - size_Y * floatsin(a, degrees))/VEHICLE_ACTION_RANGE);
		points[3] = y + (((-size_X) * floatsin(a, degrees) + size_Y * floatcos(a, degrees))/VEHICLE_ACTION_RANGE);

		points[4] = x + (((size_X+VEHICLE_ACTION_RANGE) * floatcos(a+180, degrees) - size_Y * floatsin(a+180, degrees))/VEHICLE_ACTION_RANGE);
		points[5] = y + ((size_X * floatsin(a+180, degrees) + size_Y * floatcos(a+180, degrees))/VEHICLE_ACTION_RANGE);

		points[6] = x + (((-size_X-VEHICLE_ACTION_RANGE) * floatcos(a+180, degrees) - size_Y * floatsin(a+180, degrees))/VEHICLE_ACTION_RANGE);
		points[7] = y + (((-size_X) * floatsin(a+180, degrees) + size_Y * floatcos(a+180, degrees))/VEHICLE_ACTION_RANGE);

		if(IsPointInPolygon(hitX, hitY, points[0], points[1], points[2], points[3], points[4], points[5], points[6], points[7]))
		{
			if((z-(size_Z)-VEHICLE_ACTION_RANGE) > hitZ && (z+(size_Z)+(VEHICLE_ACTION_RANGE * 2)) < hitZ ) continue; // Zpos check
	    	return v;
		}
	}
	return 0;
}