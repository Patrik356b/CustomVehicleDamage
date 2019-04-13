<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" dir="ltr">
<head><meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">
a:link, a:visited, a:hover, a:active { 
	color: #000000; /* Links will be black */
}
</style></head><body>
<div style="width:920px; position:relative; left:150px;">
<table style="padding: 5px; background-color:#e2e2e2; border: 1px solid;">
<tbody><tr><br>
<td align="left" style="padding-left:10px; padding-right:7px;"><span style="font-size:14px;">
<h1 class="firstHeading">Vehicle Information</h1>
</span></td></tr></tbody></table>
</div>
<p>
<div style="width:920px; position:relative; left:64px;">
<table style="padding: 5px; background-color: #ffeecc; border: 1px solid #ffbf7f;">
<tr>
<td align="center" style="padding-right:10px; padding-left:5px; border-right:1px solid #ffbf7f;"><img src="warning.png" alt="Image:warning.png" width="32" height="32" longdesc="Image:warning.png" /><br />
<p><strong>Important<br />Note</strong>
</p>
</td><td align="left" style="padding-left:10px; padding-right:7px;"><span style="font-size:14px;">Under Construction</span>
</td></tr></table>
</div>
</p>

<div style="width:920px; left:150px;">
<table style="padding: 5px; background-color:#e2e2e2; border: 1px solid;">
<tbody><tr>
<td align="left" style="padding-left:10px; padding-right:7px;"><span style="font-size:14px;">
<pre>Details of all vehicles...</pre>
</span></td></tr></tbody></table></div>
<br>

<?php

$VehicleNames = array(
	"Landstalker","Bravura","Buffalo","Linerunner","Pereniel","Sentinel","Dumper","Firetruck","Trashmaster","Stretch","Manana","Infernus","Voodoo","Pony","Mule","Cheetah","Ambulance",
	"Leviathan","Moonbeam","Esperanto","Taxi","Washington","Bobcat","Mr Whoopee","BF Injection","Hunter","Premier","Enforcer","Securicar","Banshee","Predator","Bus","Rhino","Barracks","Hotknife",
	"Trailer","Previon","Coach","Cabbie","Stallion","Rumpo","RC Bandit","Romero","Packer","Monster","Admiral","Squalo","Seasparrow","Pizzaboy","Tram","Trailer","Turismo","Speeder","Reefer",
	"Tropic","Flatbed","Yankee","Caddy","Solair","Berkley's RC Van","Skimmer","PCJ-600","Faggio","Freeway","RC Baron","RC Raider","Glendale","Oceanic","Sanchez","Sparrow","Patriot","Quad",
	"Coastguard","Dinghy","Hermes","Sabre","Rustler","ZR 350","Walton","Regina","Comet","BMX","Burrito","Camper","Marquis","Baggage","Dozer","Maverick","News Chopper","Rancher","FBI Rancher",
	"Virgo","Greenwood","Jetmax","Hotring","Sandking","Blista Compact","Police Maverick","Boxville","Benson","Mesa","RC Goblin","Hotring Racer A","Hotring Racer B","Bloodring Banger","Rancher",
	"Super GT","Elegant","Journey","Bike","Mountain Bike","Beagle","Cropdust","Stunt","Tanker","RoadTrain","Nebula","Majestic","Buccaneer","Shamal","Hydra","FCR-900","NRG-500","HPV1000",
	"Cement Truck","Tow Truck","Fortune","Cadrona","FBI Truck","Willard","Forklift","Tractor","Combine","Feltzer","Remington","Slamvan","Blade","Freight","Streak","Vortex","Vincent","Bullet",
	"Clover","Sadler","Firetruck","Hustler","Intruder","Primo","Cargobob","Tampa","Sunrise","Merit","Utility","Nevada","Yosemite","Windsor","Monster A","Monster B","Uranus","Jester","Sultan",
	"Stratum","Elegy","Raindance","RC Tiger","Flash","Tahoma","Savanna","Bandito","Freight","Trailer","Kart","Mower","Duneride","Sweeper","Broadway","Tornado","AT-400","DFT-30","Huntley",
	"Stafford","BF-400","Newsvan","Tug","Trailer A","Emperor","Wayfarer","Euros","Hotdog","Club","Trailer B","Trailer C","Andromada","Dodo","RC Cam","Launch","Police Car (LSPD)","Police Car (SFPD)",
	"Police Car (LVPD)","Police Ranger","Picador","S.W.A.T. Van","Alpha","Phoenix","Glendale","Sadler","Luggage Trailer A","Luggage Trailer B","Stair Trailer","Boxville","Farm Plow","Utility Trailer"
);

$RealVehicleNames = array(
	"Jeep Wagoneer","Mercury Cougar","Camaro with Scoop","Big Rig","Jeep Grand Wagoneer","BMW 7-Series","Dumptruck","SA Firetruck","Peterbuilt","Lincoln Towncar","Dodge Aries",
	"Acura NSX '05","Chevy Biscayne","Ford Aerostar","Ford Box Van","Ferrari Testarosso","Ford Econoline","Emergency Helicopter","Chevrolet Astrovan","Cadillac Eldorado",
	"Chevy Caprice","Lincoln Mark 7","Chevrolet S10","Chevy Ice Cream Truck","Volkswagen Beach Buggy","AH-64A","Chevrolet Caprice", "International SWAT Van","Securita Van",
	"Dodge Viper","Preditor","Volvo Bus","M1A1 Abrams","Barracks","Ford Hot Rod","Trailer","Nissan Pulsar","Old Coach","Caprice Classic Cab","Ford Mustang Mach 1","Mercedes Van",
	"RC Bandit","Cadillac Hearse","Packer/Stunt Helper","Chevy S-10 Monster Truck","Mercedes-Benz S-Class","Chris Craft Stinger","Bell 47G","Piaggio Vespa PX 200","Tram","Trailer",
	"Ferrari F40", "Go-Fast Boat","Orca","Sea Ray 270 Sedan Bridge","Flatbed","1992 Ford F800","Golf Car","Ford Taurus Wagon","Honda Life '74","Cessna 150 With Floats","Honda CBR 600 '92",
	"Piaggio Vespa PX 200 '86","Harley Davidson Soft Tail","RC Red Baron","RC Raider","Dodge Dart","Plymouth Belverdere","Yamaha DT 200 Dirt Bike","Bell 47G","Hummer H-1","Honda TRX250x '92",
	"Coastguard Boat","Rescue Boat","Mercury '51","Chevy Chevelle","Curtiss P-40D Warhawk","Mazda RX-7","Chevy Farm Truck","Chevy Caprice Estate","Porsche 911","Schwinn BMX","Dodge Ramvan",
	"Volkswagen Bus","Endeavour 42","Equitech M40 '85","Bulldozer","Bell 206L-4","Bell 206B-3","Ford Bronco","Chevrolet Suburban '92","Lincoln Mark 7","Dodge Diplomat","CMN Interceptor DV-15",
	"Ford Mustang LX","Ford Bronco","Honda CRX","Bell 206L-4","Chevy Cargo Van","Ford Moving Van","Jeep Wrangler","RC Heli","Ford Mustang LX '86","Ford Mustang LX '86","Customised Glendale",
	"Ford Bronco '80","Mitsubishi 3000 GT","Buick Roadmaster","GMC R.V.","Old Bike","Schwinn Mesa Mountain Hardtail","C-2 Greyhound","Grumman G-164 AgCat","Pitt's Special","Gas Tanker",
	"International 9370 Truck","Lincoln Towncar","Chevy Monte Carlo","Chevrolet Monte Carlo","Bombardier Learjet 55","AV-8 Harrier Jump-Jet","Honda CBR 900 RR Fireblade","Honda NSR 500 '01",
	"Kawasaki KZ1000-P21","Chevrolet Cement Truck","Tow Truck '91","Ford Thunderbird","Ford Escort","CSI/FBI Investigation Truck","Dodge Dynasty","Forklift '89","Old Tractor","Combine Harvester",
	"Mercedes-Benz SL-Class","Lincoln Mark 5","Chevy CST '68","Chevrolet Caprice Droptop","1972 EMD SD40","Amtrak F40PH","Hovercraft","Mercedes Benz E120","Ford GT-40","Dodge Challenger '70",
	"Dodge 100 Series","SA Firetruck","Ford Hotrod","Chevrolet Lumina","Oldsmobile Cutlass Ciera","Sikorsky CH-53","Dodge Roadrunner","Late 80's Honda Sedan","Mercury Grand Marquis",
	"Chevy 2500","Douglas C-47","GMC Sierra","Jaguar XKE '66","Chevy S-10 Monster Truck","Chevy S-10 Monster Truck","Eagle Talon","Toyota Supra","Impreza 2.5RS '95","Honda Accord Wagon",
	"Nissan R34 Skyline","Sikorsky UH-60 Black Hawk","RC Tiger","Honda Civic","Oldsmobile Cutlass","Chevy Impala","Half Life 2 Sand Rail","EMD SD40","Trailer","Go Kart","Ride-On Lawn Mower",
	"Mercedes-Benz AK 4x4 '91","Elgin Pelican","Caddilac '54","Chevy Bel Air '57","Boeing 737","Flatbed","Range Rover","Rolls Royce","Honda VFR 400","Dodge Ramvan Newsvan",
	"Baggage Tow Tractor HTAG-30/40","Trailer","Infinity J30 '92","Honda Goldwing GL1500 '04","Nissan 350Z/240SX","Hotdog Van","Volkswagen Golf","Trailer","Trailer","Lockheed C-5 Galaxy",
	"Cessna 150","Unknown","CMN Interceptor DV-15","Chevy Caprice LA", "Chevy Caprice SF","Chevy Caprice LV","Chevy Blazer Desert","Chevrolet El Camino '68","S.W.A.T. Van",
	"Dodge Stealth '91","Pontiac Trans AM", "Dodge Dart", "Dodge 100 Series", "Luggage Trailer","Luggage Trailer", "Stair Trailer", "Chevy Cargo Van","Farm Plow", "Chevy 2500 Trailer"
);

$model=0;
$health=1000-250; // vehicle explodes if health goes below 250 hp
// Read data
ini_set("auto_detect_line_endings", true);
// Nope, multi-dimensional arrays do not work...
$data0=array(); // Price
$data1=array(); // Melee
$data2=array(); // Pistol
$data3=array(); // Small machine gun
$data4=array(); // Shotgun
$data5=array(); // Heavy machine gun
$data6=array(); // Rifle
// read buffer
if (file_exists("VehicleDamage_buffer.txt")) {
	$handle = fopen("VehicleDamage_buffer.txt", "r"); // easier to process
	if ($handle) {
		// read file line by line
	    while (($line = fgets($handle)) !== false) {
	    	// split string to array of strings
			$arr = explode(',', $line);
			// convert array of strings to array of integers
			foreach ($arr AS $index => $value)
			{
				$arr[$index] = (int)$value; 
			}
	    	
	    	// Nope, multi-dimensional arrays do not work...
	    	for($i=1; $i < sizeof($arr); $i++)
	    	{
	    		switch($i)
	    		{
	    			case 1: $data1[$model]=$arr[$i];
	    			case 2: $data2[$model]=$arr[$i];
	    			case 3: $data3[$model]=$arr[$i];
	    			case 4: $data4[$model]=$arr[$i];
	    			case 5: $data5[$model]=$arr[$i];
	    			case 6: $data6[$model]=$arr[$i];
	    		}
	    	}
	    	$model++;
	    }
	}
	else echo "FATAL ERROR: COULD NOT READ FROM BUFFER!";
	fclose($handle);
}else{ // create buffer
	$ipos=0; $skip=0; $model=0; $xsize=0;
	echo "<div style=\"position: absolute; top:180px; left:400px; width:400px; height:25px\">";
	echo "<b>Warning:</b> buffer file missing...<br>";
	echo "<br>...Creating a new one...<br><br></div>";
	$handle = fopen("VehicleDamage.inc", "r");
	$File = fopen("VehicleDamage_buffer.txt", 'a');
	if ($handle && $File) {
		// read file line by line
	    while (($line = fgets($handle)) !== false) {
	    	$ipos++; // internal line counter
	    	$pos=strpos($line, "VehicleDamage[][VehicleDamageType]");
	    	
	    	if($pos === false && !$skip)
	    	{
	    		continue;
	    	}else $skip++;

	    	if($ipos > $pos)
	    	{
	    		// ignore some lines
	    		$start = strpos($line, "{");
	    		$end = strpos($line, "}");
		    	if($start !== false && $end !== false)
		    	{
		    		$line = str_replace("{","{1, ",$line); // Modify string

		    		// split string to array of strings
					$arr = explode(',', $line);
					// convert array of strings to array of integers
					foreach ($arr AS $index => $value)
					{
						$arr[$index] = (int)$value; 
					}

					$xsize=sizeof($arr);

					// Add model id
					$arr[0]=$model+400;

					// Write to buffer
					for($i=0; $i < sizeof($arr)-1; $i++)
					{
						fwrite($File, $arr[$i]);
						if($i < sizeof($arr)-2)
						{
							fwrite($File, ", ");
						}
					}
					fwrite($File, "\n");

					$model++;
				}
	    	}
	    }
	    echo "<br<br><br>Please realod this page soon...";
	} else if(!$File) {
	    echo "FATAL ERROR: COULD NOT WRITE TO CRITICAL FILE!";
	} else {
	    echo "FATAL ERROR: COULD NOT READ FROM CRITICAL FILE!";
	} 
	fclose($handle);
	fclose($File);
}

if (file_exists("VehicleDamage_buffer.txt")) {
	// Generate html content
	$fake_modus=0;

	echo "<table border=\"1\" cellspacing=\"0\" cellpadding=\"5\">";
	echo "<tbody>";

	for ($i=0; $i < sizeof($VehicleNames); $i++)
	{
		// Generate internal header
		if($fake_modus == 0 || $fake_modus == 5)
		{
			$fake_modus=0;
			echo "<tr style=\"font-size:18px; text-align:center; background-color:#cee0f2;\">";
			echo "<td><b>ID</b></td><td><b>Name<br>Real Name</b></td><td><b>Preview</b></td><td><b>Resistance</b></td><td><b>Price</b></td>";
			echo "</td></tr>";
		}

		$model = $i+400;
		// insert to table
		echo "<tr style=\"font-size:14px; text-align:center; background-color:#e1ebeb;\">";
		echo "<td> ";
		echo $model;
		echo " </td>";
		echo "<td> ";
		echo $VehicleNames[$i];
		echo " <br><br> ";
		echo $RealVehicleNames[$i];
		echo " </td>\n";
		echo "<td> ";

		// Create preview
		echo "<img src=\"./img/Vehicle_";
		echo $model;
		echo ".jpg\"";
		echo " width=\"102\" height=\"63\" name=\"img_";
		echo $model;
		echo ".jpg\">"; // broken

		echo " </td><td>";
		// Nope, multi-dimensional arrays do not work...
		echo "<table width=\"320\" style=\"padding: 4px; background-color:#e2e2e2; border: 1px solid;\">";
		echo "\n<tbody><tr>";
		echo "<td>";
		echo "Melee: ";
		echo round((750/$data1[$i])*100)/100;
		echo "</td>";
		echo "<td>";
		echo "Light machine gun: ";
		echo round((750/$data3[$i])*100)/100;
		echo "</td>";
		echo "</tr><tr><td>";
		echo "Pistol: ";
		echo round((750/$data2[$i])*100)/100;
		echo "</td>";
		echo "<td>";
		echo "Heavy Machine gun: ";
		echo round((750/$data5[$i])*100)/100;
		echo "</tr><tr>";
		echo "<td>";
		echo "Shotgun: ";
		echo round((750/$data4[$i])*100)/100;
		echo "</td>";
		echo "<td>";
		echo "Sniper/Hunting rifle: ";
		echo round((750/$data6[$i])*100)/100;
		echo "</td>";
		echo "</tr></tbody></table>";

		echo "</td>";
		echo "<td>";
		// Calculate prize
		$multiply = 10000;
		$value=round((750/($data1[$i]+$data2[$i]+$data3[$i]+$data4[$i]+$data5[$i]+$data6[$i])*$multiply)*100);
		echo $value;
		
		// close table
		echo " </td>";
		echo "</tr>\n";

		$fake_modus++;
	}

	echo "</tbody></table>";
}

?>

</body></html>