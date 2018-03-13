begin;

-- Add statuses
insert into floods.status (id, name) values
  (1, 'Open'),
  (2, 'Closed'),
  (3, 'Caution'),
  (4, 'Long-Term Closure');
alter sequence floods.status_id_seq restart with 5;

-- Add status reasons
insert into floods.status_reason (id, status_id, name) values
  (1, 2, 'Flooded'),
  (2, 4, 'Bridge Broken'),
  (3, 3, 'Unconfirmed Flooding');
alter sequence floods.status_reason_id_seq restart with 4;

-- Add status durations
insert into floods.status_duration (id, name, timespan) values
  (1, 'A Minute', interval '1 minute'),
  (2, 'A Week', interval '1 week');
alter sequence floods.status_duration_id_seq restart with 3;

-- Add status associations
insert into floods.status_association (id, status_id, detail, rule) values
  (1, 1, 'reason', 'disabled'),
  (2, 1, 'duration', 'disabled'),
  (3, 2, 'reason', 'required'),
  (4, 2, 'duration', 'disabled'),
  (5, 3, 'reason', 'required'),
  (6, 3, 'duration', 'disabled'),
  (7, 4, 'reason', 'required'),
  (8, 4, 'duration', 'required');
alter sequence floods.status_association_id_seq restart with 9;

-- Add crossings
insert into floods.crossing (id, legacy_id, name, human_address, description, coordinates, geojson, community_ids) values

(1, 1, 'Low Water Crossing #1', '6019 Spicewood Springs, Austin, TX', 'description', ST_MakePoint(-97.774994, 30.390406), ST_AsGeoJSON(ST_MakePoint(-97.774994, 30.390406)), '{9009}'),
(2, 2, 'Low Water Crossing #2', '6020 Spicewood Springs Rd, Austin, TX', 'description', ST_MakePoint(-97.778450, 30.391405), ST_AsGeoJSON(ST_MakePoint(-97.778450, 30.391405)), '{9009}'),
(3, 3, 'Low Water Crossing #3', '6650 Spicewood Springs Rd, Austin, TX', 'description', ST_MakePoint(-97.778900, 30.397104), ST_AsGeoJSON(ST_MakePoint(-97.778900, 30.397104)), '{9009}'),
(4, 4, 'Low Water Crossing #4', '6836 Spicewood Springs Rd, Austin, TX', 'description', ST_MakePoint(-97.783081, 30.399363), ST_AsGeoJSON(ST_MakePoint(-97.783081, 30.399363)), '{9009}'),
(5, 5, 'Low Water Crossing #5', '7003 Spicewood Springs Rd, Austin, TX', 'description', ST_MakePoint(-97.788383, 30.404879), ST_AsGeoJSON(ST_MakePoint(-97.788383, 30.404879)), '{9009}'),
(6, 6, 'Low Water Crossing #6', '7748 Spicewood Springs Rd, Austin, TX', 'description', ST_MakePoint(-97.795227, 30.416759), ST_AsGeoJSON(ST_MakePoint(-97.795227, 30.416759)), '{9009}'),
(7, 7, 'Low Water Crossing #7', '7882 Spicewood Springs Rd, Austin, TX', 'description', ST_MakePoint(-97.793816, 30.420071), ST_AsGeoJSON(ST_MakePoint(-97.793816, 30.420071)), '{9009}'),
(8, 8, 'Low Water Crossing #10', '6700 Lakewood Dr, Austin, TX', 'description', ST_MakePoint(-97.787018, 30.366344), ST_AsGeoJSON(ST_MakePoint(-97.787018, 30.366344)), '{9009}'),
(9, 9, 'Low Water Crossing #11', 'Old Spicewood Springs', 'description', ST_MakePoint(-97.768349, 30.383081), ST_AsGeoJSON(ST_MakePoint(-97.768349, 30.383081)), '{9009}'),
(10, 10, 'Low Water Crossing #12', 'Old Spicewood Springs', 'description', ST_MakePoint(-97.769730, 30.382622), ST_AsGeoJSON(ST_MakePoint(-97.769730, 30.382622)), '{9009}'),
(11, 11, 'Low Water Crossing #13', '5296 Old Spicewood Springs Road', 'description', ST_MakePoint(-97.770370, 30.382612), ST_AsGeoJSON(ST_MakePoint(-97.770370, 30.382612)), '{9009}'),
(12, 12, 'Low Water Crossing #20', '6765 Old Bee Caves Rd, Austin, TX', 'description', ST_MakePoint(-97.871414, 30.235039), ST_AsGeoJSON(ST_MakePoint(-97.871414, 30.235039)), '{9009}'),
(13, 13, 'Low Water Crossing #21', '6334 Joe Tanner Ln, Austin, TX', 'description', ST_MakePoint(-97.857742, 30.234055), ST_AsGeoJSON(ST_MakePoint(-97.857742, 30.234055)), '{9009}'),
(14, 14, 'Low Water Crossing #22', '5003 Wasson Rd, Austin, TX', 'description', ST_MakePoint(-97.771172, 30.210482), ST_AsGeoJSON(ST_MakePoint(-97.771172, 30.210482)), '{9009}'),
(15, 15, 'Low Water Crossing #30', '3523 McNeil Dr, Austin, TX', 'description', ST_MakePoint(-97.701256, 30.433285), ST_AsGeoJSON(ST_MakePoint(-97.701256, 30.433285)), '{9009}'),
(16, 16, 'Low Water Crossing #31', '12400 Waters Park Rd, Austin, TX', 'description', ST_MakePoint(-97.707306, 30.418852), ST_AsGeoJSON(ST_MakePoint(-97.707306, 30.418852)), '{9009}'),
(17, 17, 'Low Water Crossing #32', '3144 Adelphi Ln, Austin, TX', 'description', ST_MakePoint(-97.710564, 30.419043), ST_AsGeoJSON(ST_MakePoint(-97.710564, 30.419043)), '{9009}'),
(18, 18, 'Low Water Crossing #33', '12218 Waters Park Rd, Austin, TX', 'description', ST_MakePoint(-97.709892, 30.415836), ST_AsGeoJSON(ST_MakePoint(-97.709892, 30.415836)), '{9009}'),
(19, 19, 'Low Water Crossing #34', '2809 Oneal Lane', 'description', ST_MakePoint(-97.706612, 30.418734), ST_AsGeoJSON(ST_MakePoint(-97.706612, 30.418734)), '{9009}'),
(20, 20, 'Low Water Crossing #40', '10131 Old San Antonio Rd, Austin, TX', 'description', ST_MakePoint(-97.795372, 30.153522), ST_AsGeoJSON(ST_MakePoint(-97.795372, 30.153522)), '{9009}'),
(21, 21, 'Low Water Crossing #41', '10131 David Moore Dr, Austin, TX', 'description', ST_MakePoint(-97.813972, 30.164919), ST_AsGeoJSON(ST_MakePoint(-97.813972, 30.164919)), '{9009}'),
(22, 22, 'Low Water Crossing #50', '12784 Cameron Rd, Austin, TX', 'description', ST_MakePoint(-97.615974, 30.366470), ST_AsGeoJSON(ST_MakePoint(-97.615974, 30.366470)), '{9009}'),
(23, 23, 'Low Water Crossing #51', '12275 Cameron Rd, Austin, TX', 'description', ST_MakePoint(-97.620033, 30.365187), ST_AsGeoJSON(ST_MakePoint(-97.620033, 30.365187)), '{9009}'),
(24, 24, 'Low Water Crossing #60', '2326 River Hills Rd, Austin, TX', 'description', ST_MakePoint(-97.850266, 30.340532), ST_AsGeoJSON(ST_MakePoint(-97.850266, 30.340532)), '{9009}'),
(25, 25, 'Low Water Crossing #61', '2219 River Hills Road, Austin, TX', 'description', ST_MakePoint(-97.849930, 30.339327), ST_AsGeoJSON(ST_MakePoint(-97.849930, 30.339327)), '{9009}'),
(26, 26, 'Low Water Crossing #70', '3101 Delwau, Austin, TX', 'description', ST_MakePoint(-97.668480, 30.262674), ST_AsGeoJSON(ST_MakePoint(-97.668480, 30.262674)), '{9009}'),
(27, 27, 'Low Water Crossing #80', '2573 Hoeke Ln, Austin, TX', 'description', ST_MakePoint(-97.688660, 30.213947), ST_AsGeoJSON(ST_MakePoint(-97.688660, 30.213947)), '{9009}'),
(28, 28, 'Low Water Crossing #81', '7819 Posten Ln, Austin, TX', 'description', ST_MakePoint(-97.687706, 30.214373), ST_AsGeoJSON(ST_MakePoint(-97.687706, 30.214373)), '{9009}'),
(29, 29, 'Low Water Crossing #82', 'Colton-Bluff Springs Road, Austin, TX', 'description', ST_MakePoint(-97.736015, 30.159782), ST_AsGeoJSON(ST_MakePoint(-97.736015, 30.159782)), '{9009}'),
(30, 30, 'Woodview Mobile Home Park', '1301 W Oltorf St, Austin, TX', 'description', ST_MakePoint(-97.769783, 30.244511), ST_AsGeoJSON(ST_MakePoint(-97.769783, 30.244511)), '{9009}'),
(31, 31, 'Circle C Park LWC', '6301 W Slaughter Ln, Austin, TX', 'description', ST_MakePoint(-97.886627, 30.201567), ST_AsGeoJSON(ST_MakePoint(-97.886627, 30.201567)), '{9009}'),
(32, 32, 'Golf Course LWC', '5400 Jimmy Clay Dr, Austin, TX', 'description', ST_MakePoint(-97.732780, 30.189495), ST_AsGeoJSON(ST_MakePoint(-97.732780, 30.189495)), '{9009}'),
(33, 33, 'Bull Creek Park LWC', '7900 N Capital of Texas Hwy, Austin, TX', 'description', ST_MakePoint(-97.778931, 30.378298), ST_AsGeoJSON(ST_MakePoint(-97.778931, 30.378298)), '{9009}'),
(34, 34, 'Brodie Lane and Graybuck Road', '10076 Brodie Lane, Austin, TX', 'description', ST_MakePoint(-97.850922, 30.181850), ST_AsGeoJSON(ST_MakePoint(-97.850922, 30.181850)), '{9009}'),
(35, 35, 'Johnny Morris Road', 'Austin, TX', 'description', ST_MakePoint(-97.652611, 30.284103), ST_AsGeoJSON(ST_MakePoint(-97.652611, 30.284103)), '{9009}'),
(36, 36, 'Hemphill at W 32nd', '301 W 32nd St, Austin, TX', 'description', ST_MakePoint(-97.738976, 30.297943), ST_AsGeoJSON(ST_MakePoint(-97.738976, 30.297943)), '{9009}'),
(37, 37, 'Williamson Creek at Jones Road', 'Austin, TX', 'description', ST_MakePoint(-97.799438, 30.223421), ST_AsGeoJSON(ST_MakePoint(-97.799438, 30.223421)), '{9009}'),
(38, 38, 'Williamson Creek (Kincheon Branch) at Latta Dr', 'Austin, TX', 'description', ST_MakePoint(-97.846275, 30.216385), ST_AsGeoJSON(ST_MakePoint(-97.846275, 30.216385)), '{9009}'),
(39, 39, 'South Boggy Creek at Dittmar', 'Austin, TX', 'description', ST_MakePoint(-97.783516, 30.183256), ST_AsGeoJSON(ST_MakePoint(-97.783516, 30.183256)), '{9009}'),
(40, 40, 'Shoal Creek at Lamar (downtown)', 'Austin, TX', 'description', ST_MakePoint(-97.752441, 30.274645), ST_AsGeoJSON(ST_MakePoint(-97.752441, 30.274645)), '{9009}'),
(41, 41, 'Waller at 8th Street', 'Austin, TX', 'description', ST_MakePoint(-97.735733, 30.268042), ST_AsGeoJSON(ST_MakePoint(-97.735733, 30.268042)), '{9009}'),
(42, 42, 'Bitting School Rd. @ Wilbarger Creek', 'Travis County, TX', 'description', ST_MakePoint(-97.452927, 30.309078), ST_AsGeoJSON(ST_MakePoint(-97.452927, 30.309078)), '{9010}'),
(43, 43, 'Cameron Rd @ Schmidt Ln / Wilbarger Creek', 'Travis County, TX', 'description', ST_MakePoint(-97.543350, 30.404383), ST_AsGeoJSON(ST_MakePoint(-97.543350, 30.404383)), '{9010}'),
(44, 44, 'Jesse Bohls Rd @ Tributary to Wilbarger Creek', 'Travis County, TX', 'description', ST_MakePoint(-97.558022, 30.433605), ST_AsGeoJSON(ST_MakePoint(-97.558022, 30.433605)), '{9010}'),
(45, 45, 'Cadillac Dr near FM 969', 'Travis County, TX', 'description', ST_MakePoint(-97.579292, 30.248285), ST_AsGeoJSON(ST_MakePoint(-97.579292, 30.248285)), '{9010}'),
(46, 46, 'County Line Rd @ South of 290E', 'Travis County, TX', 'description', ST_MakePoint(-97.414215, 30.348660), ST_AsGeoJSON(ST_MakePoint(-97.414215, 30.348660)), '{9010}'),
(47, 47, 'Lockwood Rd East of Parsons Rd', 'Travis County, TX', 'description', ST_MakePoint(-97.514938, 30.308081), ST_AsGeoJSON(ST_MakePoint(-97.514938, 30.308081)), '{9010}'),
(48, 48, 'Felder Ln @ Cottonwood Creek', 'Travis County, TX', 'description', ST_MakePoint(-97.465218, 30.444187), ST_AsGeoJSON(ST_MakePoint(-97.465218, 30.444187)), '{9010}'),
(49, 49, 'Brita Olson Rd @ Tributary to Cottonwood Creek', 'Travis County, TX', 'description', ST_MakePoint(-97.482452, 30.417759), ST_AsGeoJSON(ST_MakePoint(-97.482452, 30.417759)), '{9010}'),
(50, 50, 'Jacobson Rd @ Cottonwood Creek', 'Travis County, TX', 'description', ST_MakePoint(-97.480118, 30.391279), ST_AsGeoJSON(ST_MakePoint(-97.480118, 30.391279)), '{9010}'),
(51, 51, 'Johnson Rd west of Bois D', 'Travis County, TX', 'description', ST_MakePoint(-97.510139, 30.380987), ST_AsGeoJSON(ST_MakePoint(-97.510139, 30.380987)), '{9010}'),
(52, 52, 'Old Kimbro Rd @ Cottonwood Creek', 'Travis County, TX', 'description', ST_MakePoint(-97.487617, 30.356644), ST_AsGeoJSON(ST_MakePoint(-97.487617, 30.356644)), '{9010}'),
(53, 53, 'Littig Rd @ Cottonwood Creek', 'Travis County, TX', 'description', ST_MakePoint(-97.471222, 30.323795), ST_AsGeoJSON(ST_MakePoint(-97.471222, 30.323795)), '{9010}'),
(54, 54, 'Hogeye Rd East of Blake-Manor Rd', 'Travis County, TX', 'description', ST_MakePoint(-97.513618, 30.293049), ST_AsGeoJSON(ST_MakePoint(-97.513618, 30.293049)), '{9010}'),
(55, 55, 'Albert Voelker Rd @ Dry Creek', 'Travis County, TX', 'description', ST_MakePoint(-97.440056, 30.335573), ST_AsGeoJSON(ST_MakePoint(-97.440056, 30.335573)), '{9010}'),
(56, 56, 'Littig Rd @ Dry Creek', 'Travis County, TX', 'description', ST_MakePoint(-97.456795, 30.321613), ST_AsGeoJSON(ST_MakePoint(-97.456795, 30.321613)), '{9010}'),
(57, 57, 'Gregg Ln @ Wilbarger Creek', 'Travis County, TX', 'description', ST_MakePoint(-97.540504, 30.381243), ST_AsGeoJSON(ST_MakePoint(-97.540504, 30.381243)), '{9010}'),
(58, 58, 'Jones Rd @Wilbarger Creek', 'Travis County, TX', 'description', ST_MakePoint(-97.479576, 30.320063), ST_AsGeoJSON(ST_MakePoint(-97.479576, 30.320063)), '{9010}'),
(59, 59, 'Springdale Rd @ Walnut Creek', 'Travis County, TX', 'description', ST_MakePoint(-97.650215, 30.337410), ST_AsGeoJSON(ST_MakePoint(-97.650215, 30.337410)), '{9010}'),
(60, 60, 'Springdale Rd @ Ferguson Branch (Creek)', 'Travis County, TX', 'description', ST_MakePoint(-97.653687, 30.331684), ST_AsGeoJSON(ST_MakePoint(-97.653687, 30.331684)), '{9010}'),
(61, 62, 'Littig Rd @ Willow Creek', 'Travis County, TX', 'description', ST_MakePoint(-97.462334, 30.323267), ST_AsGeoJSON(ST_MakePoint(-97.462334, 30.323267)), '{9010}'),
(62, 63, 'Carlson Rd @ Dry Creek', 'Travis County, TX', 'description', ST_MakePoint(-97.410530, 30.390736), ST_AsGeoJSON(ST_MakePoint(-97.410530, 30.390736)), '{9010}'),
(63, 64, 'Crystal Bend @ Harris Branch (Creek)', 'Travis County, TX', 'description', ST_MakePoint(-97.634727, 30.406910), ST_AsGeoJSON(ST_MakePoint(-97.634727, 30.406910)), '{9010}'),
(64, 65, 'Taylor Ln near Decker Lake Rd', 'Travis County, TX', 'description', ST_MakePoint(-97.551872, 30.262096), ST_AsGeoJSON(ST_MakePoint(-97.551872, 30.262096)), '{9010}'),
(65, 66, 'Killingsworth Rd east of Immanuel Rd', 'Travis County, TX', 'description', ST_MakePoint(-97.615417, 30.417175), ST_AsGeoJSON(ST_MakePoint(-97.615417, 30.417175)), '{9010}'),
(66, 67, 'Immanuel Rd north of Killingsworth Rd', 'Travis County, TX', 'description', ST_MakePoint(-97.619942, 30.420252), ST_AsGeoJSON(ST_MakePoint(-97.619942, 30.420252)), '{9010}'),
(67, 68, 'Old San Antonio Rd @ Onion Creek', 'Travis County, TX', 'description', ST_MakePoint(-97.810425, 30.133249), ST_AsGeoJSON(ST_MakePoint(-97.810425, 30.133249)), '{9010}'),
(68, 69, 'Bee Creek Rd @ Bee Creek', 'Travis County, TX', 'description', ST_MakePoint(-98.040054, 30.354773), ST_AsGeoJSON(ST_MakePoint(-98.040054, 30.354773)), '{9010}'),
(69, 70, 'Crumley Ranch Rd @ Rocky Creek', 'Travis County, TX', 'description', ST_MakePoint(-98.021423, 30.266903), ST_AsGeoJSON(ST_MakePoint(-98.021423, 30.266903)), '{9010}'),
(70, 71, 'Great Divide @ Little Barton Creek', 'Travis County, TX', 'description', ST_MakePoint(-97.957802, 30.305210), ST_AsGeoJSON(ST_MakePoint(-97.957802, 30.305210)), '{9010}'),
(71, 72, 'Tumbleweed Trl @ Tributary to Lake Austin', 'Travis County, TX', 'description', ST_MakePoint(-97.871216, 30.324345), ST_AsGeoJSON(ST_MakePoint(-97.871216, 30.324345)), '{9010}'),
(72, 73, 'Westlake Dr b/w Woodcutter', 'Travis County, TX', 'description', ST_MakePoint(-97.782799, 30.327383), ST_AsGeoJSON(ST_MakePoint(-97.782799, 30.327383)), '{9010}'),
(73, 74, 'Wild Basin Ledge @ Tributary to Bee Creek', 'Travis County, TX', 'description', ST_MakePoint(-97.806282, 30.308975), ST_AsGeoJSON(ST_MakePoint(-97.806282, 30.308975)), '{9010}'),
(74, 75, 'Lime Creek Rd @ Fisher Hollow (Creek)', 'Travis County, TX', 'description', ST_MakePoint(-97.894073, 30.481779), ST_AsGeoJSON(ST_MakePoint(-97.894073, 30.481779)), '{9010}'),
(75, 76, 'Fitzhugh Rd @ Barton Creek', 'Travis County, TX', 'description', ST_MakePoint(-98.011162, 30.242487), ST_AsGeoJSON(ST_MakePoint(-98.011162, 30.242487)), '{9010}'),
(76, 77, 'Fall Creek Rd @ Tributary to Fall Creek', 'Travis County, TX', 'description', ST_MakePoint(-98.127342, 30.419184), ST_AsGeoJSON(ST_MakePoint(-98.127342, 30.419184)), '{9010}'),
(77, 78, 'Flint Rock Rd @ Tributary to Hurst Creek', 'Travis County, TX', 'description', ST_MakePoint(-97.997841, 30.330700), ST_AsGeoJSON(ST_MakePoint(-97.997841, 30.330700)), '{9010}'),
(78, 79, 'Pedernales Canyon Trl @ Lick Creek', 'Travis County, TX', 'description', ST_MakePoint(-98.088783, 30.369410), ST_AsGeoJSON(ST_MakePoint(-98.088783, 30.369410)), '{9010}'),
(79, 80, 'Hamilton Pool @ Pedernales River', 'Travis County, TX', 'description', ST_MakePoint(-98.138939, 30.340010), ST_AsGeoJSON(ST_MakePoint(-98.138939, 30.340010)), '{9010}'),
(80, 81, 'Ledgestone Terr @ Tributary to Pen Creek', 'Travis County, TX', 'description', ST_MakePoint(-97.929260, 30.223341), ST_AsGeoJSON(ST_MakePoint(-97.929260, 30.223341)), '{9010}'),
(81, 82, 'Flintrock Circle @ Tributary to Pen Creek', 'Travis County, TX', 'description', ST_MakePoint(-97.924110, 30.223345), ST_AsGeoJSON(ST_MakePoint(-97.924110, 30.223345)), '{9010}'),
(82, 85, 'Williamson Creek Dr @ Williamson Creek', 'Travis County, TX', 'description', ST_MakePoint(-97.915123, 30.246428), ST_AsGeoJSON(ST_MakePoint(-97.915123, 30.246428)), '{9010}'),
(83, 86, 'Pitter Pat Ln @ Williamson Creek', 'Travis County, TX', 'description', ST_MakePoint(-97.913620, 30.245514), ST_AsGeoJSON(ST_MakePoint(-97.913620, 30.245514)), '{9010}'),
(84, 87, 'Mowinkle Dr @ Williamson Creek', 'Travis County, TX', 'description', ST_MakePoint(-97.906670, 30.242262), ST_AsGeoJSON(ST_MakePoint(-97.906670, 30.242262)), '{9010}'),
(85, 88, 'Big Sandy Dr @ Long Hollow', 'Travis County, TX', 'description', ST_MakePoint(-97.948364, 30.570286), ST_AsGeoJSON(ST_MakePoint(-97.948364, 30.570286)), '{9010}'),
(86, 89, 'Juniper Trl @ Long Hollow (Creek)', 'Travis County, TX', 'description', ST_MakePoint(-97.967262, 30.581793), ST_AsGeoJSON(ST_MakePoint(-97.967262, 30.581793)), '{9010}'),
(87, 90, 'Cottonwood Dr @ Long Hollow (Creek)', 'Travis County, TX', 'description', ST_MakePoint(-97.971863, 30.583870), ST_AsGeoJSON(ST_MakePoint(-97.971863, 30.583870)), '{9010}'),
(88, 91, 'Live Oak Dr @ Long Hollow (Creek)', 'Travis County, TX', 'description', ST_MakePoint(-97.967941, 30.585136), ST_AsGeoJSON(ST_MakePoint(-97.967941, 30.585136)), '{9010}'),
(89, 92, 'Nameless Rd @ Nameless Hollow (Creek)', 'Travis County, TX', 'description', ST_MakePoint(-97.928017, 30.526802), ST_AsGeoJSON(ST_MakePoint(-97.928017, 30.526802)), '{9010}'),
(90, 93, 'Round Mountain Rd @ Bingham Creek', 'Travis County, TX', 'description', ST_MakePoint(-97.945068, 30.580051), ST_AsGeoJSON(ST_MakePoint(-97.945068, 30.580051)), '{9010}'),
(91, 94, 'Slaughter Creek Dr @ Tributary to Slaughter Creek', 'Travis County, TX', 'description', ST_MakePoint(-97.821320, 30.166294), ST_AsGeoJSON(ST_MakePoint(-97.821320, 30.166294)), '{9010}'),
(92, 95, 'Jacobson Rd b/w Alpine Dr & Linden Rd', 'Travis County, TX', 'description', ST_MakePoint(-97.609001, 30.132555), ST_AsGeoJSON(ST_MakePoint(-97.609001, 30.132555)), '{9010}'),
(93, 96, 'Linden Rd @ Maha Creek', 'Travis County, TX', 'description', ST_MakePoint(-97.588860, 30.133886), ST_AsGeoJSON(ST_MakePoint(-97.588860, 30.133886)), '{9010}'),
(94, 97, 'Citation Dr (Thoroughbred Farms subdiv) between Man-O-War Ave and Ponder Ln', 'Travis County, TX', 'description', ST_MakePoint(-97.676346, 30.135599), ST_AsGeoJSON(ST_MakePoint(-97.676346, 30.135599)), '{9010}'),
(95, 98, 'Pearce Ln near FM 973', 'Travis County, TX', 'description', ST_MakePoint(-97.640076, 30.177479), ST_AsGeoJSON(ST_MakePoint(-97.640076, 30.177479)), '{9010}'),
(96, 99, 'Turnersville Rd @ Maha Creek', 'Travis County, TX', 'description', ST_MakePoint(-97.737938, 30.076216), ST_AsGeoJSON(ST_MakePoint(-97.737938, 30.076216)), '{9010}'),
(97, 100, '9500-blk Blocker Ln ', 'Travis County, TX', 'description', ST_MakePoint(-97.671249, 30.112530), ST_AsGeoJSON(ST_MakePoint(-97.671249, 30.112530)), '{9010}'),
(98, 101, 'Rodriguez Rd @ Dry Creek', 'Travis County, TX', 'description', ST_MakePoint(-97.710732, 30.118946), ST_AsGeoJSON(ST_MakePoint(-97.710732, 30.118946)), '{9010}'),
(99, 102, 'Doyle-Overton Rd @ Eilers Rd', 'Travis County, TX', 'description', ST_MakePoint(-97.640572, 30.078949), ST_AsGeoJSON(ST_MakePoint(-97.640572, 30.078949)), '{9010}'),
(100, 103, 'Peterson Rd @ Tributary to Maha Creek', 'Travis County, TX', 'description', ST_MakePoint(-97.627808, 30.105795), ST_AsGeoJSON(ST_MakePoint(-97.627808, 30.105795)), '{9010}'),
(101, 104, 'Navarro Creek Rd @ Navarro Creek', 'Travis County, TX', 'description', ST_MakePoint(-97.592514, 30.167467), ST_AsGeoJSON(ST_MakePoint(-97.592514, 30.167467)), '{9010}'),
(102, 105, '14500-blk Plover Pl', 'Travis County, TX', 'description', ST_MakePoint(-97.617798, 30.127525), ST_AsGeoJSON(ST_MakePoint(-97.617798, 30.127525)), '{9010}'),
(103, 106, 'Wright Rd @ Tributary to Maha Creek', 'Travis County, TX', 'description', ST_MakePoint(-97.754387, 30.080608), ST_AsGeoJSON(ST_MakePoint(-97.754387, 30.080608)), '{9010}'),
(104, 107, 'Colton Rd @ Cottonmouth Creek', 'Travis County, TX', 'description', ST_MakePoint(-97.689194, 30.173513), ST_AsGeoJSON(ST_MakePoint(-97.689194, 30.173513)), '{9010}'),
(105, 108, 'Williamson Rd NW of Elm Grove Rd', 'Travis County, TX', 'description', ST_MakePoint(-97.723503, 30.048407), ST_AsGeoJSON(ST_MakePoint(-97.723503, 30.048407)), '{9010}'),
(106, 109, 'Williamson Rd SE of Elm Grove Rd', 'Travis County, TX', 'description', ST_MakePoint(-97.701485, 30.027739), ST_AsGeoJSON(ST_MakePoint(-97.701485, 30.027739)), '{9010}'),
(107, 110, 'Laws Rd b/w US 183 &amp; Evelyn Rd', 'Travis County, TX', 'description', ST_MakePoint(-97.681305, 30.062107), ST_AsGeoJSON(ST_MakePoint(-97.681305, 30.062107)), '{9010}'),
(108, 111, 'Tom Sassman Rd @ Maha Creek', 'Travis County, TX', 'description', ST_MakePoint(-97.701904, 30.084892), ST_AsGeoJSON(ST_MakePoint(-97.701904, 30.084892)), '{9010}'),
(109, 112, 'Doyle Rd @ Tributary to Maha Creek', 'Travis County, TX', 'description', ST_MakePoint(-97.620811, 30.094563), ST_AsGeoJSON(ST_MakePoint(-97.620811, 30.094563)), '{9010}'),
(110, 113, 'Lone Oak Trail at Sunset Valley Trib', 'Sunset Valley, TX', 'description', ST_MakePoint(-97.810463, 30.226772), ST_AsGeoJSON(ST_MakePoint(-97.810463, 30.226772)), '{9007}'),
(111, 114, 'Pillow Road at Sunset Valley Trib', 'Sunset Valley, TX', 'description', ST_MakePoint(-97.809402, 30.225208), ST_AsGeoJSON(ST_MakePoint(-97.809402, 30.225208)), '{9007}'),
(112, 116, 'Reese Drive at Sunset Valley Trib', 'Sunset Valley, TX', 'description', ST_MakePoint(-97.807320, 30.224424), ST_AsGeoJSON(ST_MakePoint(-97.807320, 30.224424)), '{9007}'),
(113, 118, 'Big Sandy @ Long Hollow', '22700 Big Sandy Drive, Leander, tx', 'description', ST_MakePoint(-97.948425, 30.570244), ST_AsGeoJSON(ST_MakePoint(-97.948425, 30.570244)), '{9001}'),
(114, 120, 'Slaughter Creek Trail', '9925 Farm to Market 1826, Austin, TX', 'description', ST_MakePoint(-97.903442, 30.209352), ST_AsGeoJSON(ST_MakePoint(-97.903442, 30.209352)), '{9009}'),
(115, 121, '2400 Sumac Lane', 'Cedar Park, TX', 'description', ST_MakePoint(-97.841324, 30.537243), ST_AsGeoJSON(ST_MakePoint(-97.841324, 30.537243)), '{9003}'),
(116, 122, '2348 Cypress Lane', 'Cedar Park, TX', 'description', ST_MakePoint(-97.840584, 30.537674), ST_AsGeoJSON(ST_MakePoint(-97.840584, 30.537674)), '{9003}'),
(117, 123, '2402 Peach Tree Lane', 'Cedar Park, TX', 'description', ST_MakePoint(-97.839897, 30.538385), ST_AsGeoJSON(ST_MakePoint(-97.839897, 30.538385)), '{9003}'),
(118, 170, '805 Cedar Park Drive', 'Cedar Park, TX', 'description', ST_MakePoint(-97.835342, 30.511259), ST_AsGeoJSON(ST_MakePoint(-97.835342, 30.511259)), '{9003}'),
(119, 192, 'CR 273 at Mason Creek', 'Leander, TX', 'description', ST_MakePoint(-97.845581, 30.576651), ST_AsGeoJSON(ST_MakePoint(-97.845581, 30.576651)), '{9001}'),
(120, 193, 'Ridgmar Road at Brushy Creek', 'Leander, TX', 'description', ST_MakePoint(-97.812286, 30.583527), ST_AsGeoJSON(ST_MakePoint(-97.812286, 30.583527)), '{9001}'),
(121, 194, 'RM 2243 at Brushy Creek', 'Leander, TX', 'description', ST_MakePoint(-97.841347, 30.582233), ST_AsGeoJSON(ST_MakePoint(-97.841347, 30.582233)), '{9001}'),
(122, 195, 'Broade Way at Brushy Creek', 'Leander, TX', 'description', ST_MakePoint(-97.858871, 30.579414), ST_AsGeoJSON(ST_MakePoint(-97.858871, 30.579414)), '{9001}'),
(123, 196, 'High Lonesome Street at Brown Hollow Creek', 'Leander, TX', 'description', ST_MakePoint(-97.901329, 30.547123), ST_AsGeoJSON(ST_MakePoint(-97.901329, 30.547123)), '{9001}'),
(124, 197, 'CR 177 at Brushy Creek', 'Leander, TX', 'description', ST_MakePoint(-97.789864, 30.573830), ST_AsGeoJSON(ST_MakePoint(-97.789864, 30.573830)), '{9001}'),
(125, 198, 'Maplecreek Drive at Brushy Creek (Devine Lake Park Entrance)', 'Leander, TX', 'description', ST_MakePoint(-97.882156, 30.579679), ST_AsGeoJSON(ST_MakePoint(-97.882156, 30.579679)), '{9001}'),
(126, 202, 'Nash St W @ Lake Creek Trib', 'Round Rock, TX', 'description', ST_MakePoint(-97.679184, 30.503847), ST_AsGeoJSON(ST_MakePoint(-97.679184, 30.503847)), '{9004}'),
(127, 203, 'A W Grimes Blvd (NB) @ Brushy Creek', 'Round Rock, TX', 'description', ST_MakePoint(-97.655251, 30.513983), ST_AsGeoJSON(ST_MakePoint(-97.655251, 30.513983)), '{9004}'),
(128, 204, 'Chisholm Trail Rd @ Brushy Creek', 'Round Rock, TX', 'description', ST_MakePoint(-97.689430, 30.513075), ST_AsGeoJSON(ST_MakePoint(-97.689430, 30.513075)), '{9004}'),
(129, 205, 'Park Ln @ Lake Creek Park', 'Round Rock, TX', 'description', ST_MakePoint(-97.669762, 30.508440), ST_AsGeoJSON(ST_MakePoint(-97.669762, 30.508440)), '{9004}'),
(130, 206, 'Summit St @ Brushy Creek/Memorial PARK', 'Round Rock, TX', 'description', ST_MakePoint(-97.684502, 30.512756), ST_AsGeoJSON(ST_MakePoint(-97.684502, 30.512756)), '{9004}'),
(131, 207, 'Harrell Pkwy @ Old Settlers Park', 'Round Rock, TX', 'description', ST_MakePoint(-97.633507, 30.529694), ST_AsGeoJSON(ST_MakePoint(-97.633507, 30.529694)), '{9004}'),
(132, 208, 'Old Bowman Rd @  Onion Branch Trib', 'Round Rock, TX', 'description', ST_MakePoint(-97.683846, 30.524473), ST_AsGeoJSON(ST_MakePoint(-97.683846, 30.524473)), '{9004}'),
(133, 209, 'Greenlawn Blvd @ Dry Branch Trib', 'Round Rock, TX', 'description', ST_MakePoint(-97.665146, 30.495581), ST_AsGeoJSON(ST_MakePoint(-97.665146, 30.495581)), '{9004}'),
(134, 210, 'Frontier Trail @ Lake Creek Trib', 'Round Rock, TX', 'description', ST_MakePoint(-97.685608, 30.492105), ST_AsGeoJSON(ST_MakePoint(-97.685608, 30.492105)), '{9004}'),
(135, 211, 'Twin Ridge Pkwy @ Forest Creek Dr', 'Round Rock, TX', 'description', ST_MakePoint(-97.601158, 30.518242), ST_AsGeoJSON(ST_MakePoint(-97.601158, 30.518242)), '{9004}'),
(136, 212, 'Burnet St S @ Lake Creek', 'Round Rock, TX', 'description', ST_MakePoint(-97.674141, 30.506256), ST_AsGeoJSON(ST_MakePoint(-97.674141, 30.506256)), '{9004}'),
(137, 213, 'Oak Ridge Dr @ Lake Creek', 'Round Rock, TX', 'description', ST_MakePoint(-97.703018, 30.497847), ST_AsGeoJSON(ST_MakePoint(-97.703018, 30.497847)), '{9004}'),
(138, 214, 'Round Rock West Dr @ Lake Creek', 'Round Rock, TX', 'description', ST_MakePoint(-97.694565, 30.504223), ST_AsGeoJSON(ST_MakePoint(-97.694565, 30.504223)), '{9004}'),
(139, 215, 'Deep Wood Dr @ Lake Creek', 'Round Rock, TX', 'description', ST_MakePoint(-97.698441, 30.501507), ST_AsGeoJSON(ST_MakePoint(-97.698441, 30.501507)), '{9004}'),
(140, 216, 'Kenny Fort Blvd under US 79 (N)', 'Round Rock, TX', 'description', ST_MakePoint(-97.640671, 30.523151), ST_AsGeoJSON(ST_MakePoint(-97.640671, 30.523151)), '{9004}'),
(141, 219, 'A W Grimes Blvd (SB) @ Brushy Creek', 'Round Rock, TX', 'description', ST_MakePoint(-97.655548, 30.514009), ST_AsGeoJSON(ST_MakePoint(-97.655548, 30.514009)), '{9004}'),
(142, 220, 'Kenny Fort Blvd under US 79 (S)', 'Round Rock, TX', 'description', ST_MakePoint(-97.639351, 30.520712), ST_AsGeoJSON(ST_MakePoint(-97.639351, 30.520712)), '{9004}'),
(143, 221, '2900 Block of Bee Cave Road (RM2244) at the Finish Line Car Wash', '2944 Bee Cave Rd, Rollingwood, TX', 'description', ST_MakePoint(-97.792221, 30.270664), ST_AsGeoJSON(ST_MakePoint(-97.792221, 30.270664)), '{9014}'),
(144, 222, '800 Block of Edgegrove Drive at Bee Cave Road', '860 Edgegrove Drive, Rollingwood, TX', 'description', ST_MakePoint(-97.788979, 30.272051), ST_AsGeoJSON(ST_MakePoint(-97.788979, 30.272051)), '{9014}'),
(145, 223, 'Dellana Lane at Bee Cave Road', '2661 Dellana Ln, Rollingwood, TX', 'description', ST_MakePoint(-97.784874, 30.267593), ST_AsGeoJSON(ST_MakePoint(-97.784874, 30.267593)), '{9014}'),
(146, 225, '2800 Cedar Hollow', 'Williamson County', 'description', ST_MakePoint(-97.770767, 30.645544), ST_AsGeoJSON(ST_MakePoint(-97.770767, 30.645544)), '{9017}'),
(147, 226, '495 Coyote Trl', 'Williamson County', 'description', ST_MakePoint(-97.727203, 30.718824), ST_AsGeoJSON(ST_MakePoint(-97.727203, 30.718824)), '{9017}'),
(148, 227, '2009 Great Oaks Dr', 'Williamson County', 'description', ST_MakePoint(-97.738487, 30.531857), ST_AsGeoJSON(ST_MakePoint(-97.738487, 30.531857)), '{9017}'),
(149, 228, '2724 Hairy Man', 'Williamson County', 'description', ST_MakePoint(-97.715004, 30.522415), ST_AsGeoJSON(ST_MakePoint(-97.715004, 30.522415)), '{9017}'),
(150, 229, '30112 Live Oak Trl', 'Williamson County', 'description', ST_MakePoint(-97.664383, 30.756660), ST_AsGeoJSON(ST_MakePoint(-97.664383, 30.756660)), '{9017}'),
(151, 230, '303 E Oak St', 'Williamson County', 'description', ST_MakePoint(-97.439552, 30.722553), ST_AsGeoJSON(ST_MakePoint(-97.439552, 30.722553)), '{9017}'),
(152, 231, '2080 Rancho Bueno', 'Williamson County', 'description', ST_MakePoint(-97.758873, 30.646746), ST_AsGeoJSON(ST_MakePoint(-97.758873, 30.646746)), '{9017}'),
(153, 232, '4553 Sam Bass Rd', 'Williamson County', 'description', ST_MakePoint(-97.751137, 30.538380), ST_AsGeoJSON(ST_MakePoint(-97.751137, 30.538380)), '{9017}'),
(154, 233, '421 San Gabriel Ranch', 'Williamson County', 'description', ST_MakePoint(-97.907944, 30.719286), ST_AsGeoJSON(ST_MakePoint(-97.907944, 30.719286)), '{9017}'),
(155, 234, '2235 Walsh Dr', 'Williamson County', 'description', ST_MakePoint(-97.748856, 30.535311), ST_AsGeoJSON(ST_MakePoint(-97.748856, 30.535311)), '{9017}'),
(156, 236, ' FM 1460 / CR 166', 'Williamson County', 'description', ST_MakePoint(-97.667328, 30.600025), ST_AsGeoJSON(ST_MakePoint(-97.667328, 30.600025)), '{9017}'),
(157, 237, 'CR 305', 'Williamson County', 'description', ST_MakePoint(-97.639954, 30.826450), ST_AsGeoJSON(ST_MakePoint(-97.639954, 30.826450)), '{9017}'),
(158, 238, '930&#039; EAST OF CR 339 / CR 124', 'Williamson County', 'description', ST_MakePoint(-97.493324, 30.666122), ST_AsGeoJSON(ST_MakePoint(-97.493324, 30.666122)), '{9017}'),
(159, 239, '1250&#039; WEST OF SPARROW RD / COYOTE TRL', 'Williamson County', 'description', ST_MakePoint(-97.551743, 30.527435), ST_AsGeoJSON(ST_MakePoint(-97.551743, 30.527435)), '{9017}'),
(160, 240, 'CR 199', 'Williamson County', 'description', ST_MakePoint(-97.536133, 30.541620), ST_AsGeoJSON(ST_MakePoint(-97.536133, 30.541620)), '{9017}'),
(161, 241, 'CR 428 / FM 1331', 'Williamson County', 'description', ST_MakePoint(-97.321938, 30.679565), ST_AsGeoJSON(ST_MakePoint(-97.321938, 30.679565)), '{9017}'),
(162, 242, 'CR 100 & Little Mankins', 'Williamson County', 'description', ST_MakePoint(-97.584511, 30.645424), ST_AsGeoJSON(ST_MakePoint(-97.584511, 30.645424)), '{9017}'),
(163, 243, 'SW CARLOS G PARKER BLVD / S RIO GRANDE', 'Williamson County', 'description', ST_MakePoint(-97.418610, 30.559025), ST_AsGeoJSON(ST_MakePoint(-97.418610, 30.559025)), '{9017}'),
(164, 244, '77&#039; WEST OF BULL RUN / MALLARD LN', 'Williamson County', 'description', ST_MakePoint(-97.425148, 30.588831), ST_AsGeoJSON(ST_MakePoint(-97.425148, 30.588831)), '{9017}'),
(165, 245, 'CR 366', 'Williamson County', 'description', ST_MakePoint(-97.446129, 30.595577), ST_AsGeoJSON(ST_MakePoint(-97.446129, 30.595577)), '{9017}'),
(166, 246, 'S RAINBOW BRG / S RAINBOW BRG', 'Williamson County', 'description', ST_MakePoint(-97.819885, 30.509405), ST_AsGeoJSON(ST_MakePoint(-97.819885, 30.509405)), '{9017}'),
(167, 247, 'S KINGS CANYON DR / S KINGS CANYON DR', 'Williamson County', 'description', ST_MakePoint(-97.820381, 30.508297), ST_AsGeoJSON(ST_MakePoint(-97.820381, 30.508297)), '{9017}'),
(168, 248, 'S KINGS CANYON DR / S KINGS CANYON DR', 'Williamson County', 'description', ST_MakePoint(-97.820808, 30.508909), ST_AsGeoJSON(ST_MakePoint(-97.820808, 30.508909)), '{9017}'),
(169, 250, '482&#039; SOUTH OF LONE STAR DR / BARON LN', 'Williamson County', 'description', ST_MakePoint(-97.832993, 30.515364), ST_AsGeoJSON(ST_MakePoint(-97.832993, 30.515364)), '{9017}'),
(170, 251, '289&#039; WEST OF ROYAL LN / CEDAR PARK DR', 'Williamson County', 'description', ST_MakePoint(-97.835503, 30.511145), ST_AsGeoJSON(ST_MakePoint(-97.835503, 30.511145)), '{9017}'),
(171, 252, ' DEWBERRY DR / CEDAR PARK DR', 'Williamson County', 'description', ST_MakePoint(-97.843376, 30.507669), ST_AsGeoJSON(ST_MakePoint(-97.843376, 30.507669)), '{9017}'),
(172, 255, 'CR 328', 'Williamson County', 'description', ST_MakePoint(-97.534500, 30.716707), ST_AsGeoJSON(ST_MakePoint(-97.534500, 30.716707)), '{9017}'),
(173, 256, 'CR 328', 'Williamson County', 'description', ST_MakePoint(-97.532127, 30.718920), ST_AsGeoJSON(ST_MakePoint(-97.532127, 30.718920)), '{9017}'),
(174, 257, '600&#039; SOUTH OF FM 972 / CR 329', 'Williamson County', 'description', ST_MakePoint(-97.570480, 30.741217), ST_AsGeoJSON(ST_MakePoint(-97.570480, 30.741217)), '{9017}'),
(175, 258, 'CR 200 / CR 236', 'Williamson County', 'description', ST_MakePoint(-97.957932, 30.769682), ST_AsGeoJSON(ST_MakePoint(-97.957932, 30.769682)), '{9017}'),
(176, 259, 'CR 200 / CR 236', 'Williamson County', 'description', ST_MakePoint(-97.961227, 30.768627), ST_AsGeoJSON(ST_MakePoint(-97.961227, 30.768627)), '{9017}'),
(177, 260, ' CR 194 / CR 140', 'Williamson County', 'description', ST_MakePoint(-97.610260, 30.689175), ST_AsGeoJSON(ST_MakePoint(-97.610260, 30.689175)), '{9017}'),
(178, 261, 'FM 1105 / CR 149', 'Williamson County', 'description', ST_MakePoint(-97.592049, 30.703566), ST_AsGeoJSON(ST_MakePoint(-97.592049, 30.703566)), '{9017}'),
(179, 262, 'CR258 @ Tejas Park', 'Williamson County', 'description', ST_MakePoint(-97.828827, 30.696257), ST_AsGeoJSON(ST_MakePoint(-97.828827, 30.696257)), '{9017}'),
(180, 264, 'CR 246 / CR 245', 'Williamson County', 'description', ST_MakePoint(-97.786789, 30.760435), ST_AsGeoJSON(ST_MakePoint(-97.786789, 30.760435)), '{9017}'),
(181, 265, ' CR 245 / CR 246', 'Williamson County', 'description', ST_MakePoint(-97.698227, 30.759169), ST_AsGeoJSON(ST_MakePoint(-97.698227, 30.759169)), '{9017}'),
(182, 266, 'CR 251 / CR 250', 'Williamson County', 'description', ST_MakePoint(-97.837570, 30.772371), ST_AsGeoJSON(ST_MakePoint(-97.837570, 30.772371)), '{9017}'),
(183, 267, 'CR 252 / CR 251', 'Williamson County', 'description', ST_MakePoint(-97.831665, 30.781549), ST_AsGeoJSON(ST_MakePoint(-97.831665, 30.781549)), '{9017}'),
(184, 268, ' CR 215', 'Williamson County', 'description', ST_MakePoint(-97.859642, 30.786821), ST_AsGeoJSON(ST_MakePoint(-97.859642, 30.786821)), '{9017}'),
(185, 269, 'CR 220', 'Williamson County', 'description', ST_MakePoint(-97.855255, 30.814713), ST_AsGeoJSON(ST_MakePoint(-97.855255, 30.814713)), '{9017}'),
(186, 270, 'CR 223 @ CR 220', 'Williamson County', 'description', ST_MakePoint(-97.851135, 30.835573), ST_AsGeoJSON(ST_MakePoint(-97.851135, 30.835573)), '{9017}'),
(187, 271, 'CR 388', 'Williamson County', 'description', ST_MakePoint(-97.597519, 30.765120), ST_AsGeoJSON(ST_MakePoint(-97.597519, 30.765120)), '{9017}'),
(188, 272, 'CR 471', 'Williamson County', 'description', ST_MakePoint(-97.270447, 30.517832), ST_AsGeoJSON(ST_MakePoint(-97.270447, 30.517832)), '{9017}'),
(189, 273, '6530', 'Williamson County', 'description', ST_MakePoint(-97.189087, 30.473770), ST_AsGeoJSON(ST_MakePoint(-97.189087, 30.473770)), '{9017}'),
(190, 275, 'Sunset Trail at Sunset Valley Trib', 'Sunset Valley, TX', 'description', ST_MakePoint(-97.806259, 30.224474), ST_AsGeoJSON(ST_MakePoint(-97.806259, 30.224474)), '{9007}'),
(191, 276, ' CR 481 / CR 482', 'Williamson County', 'description', ST_MakePoint(-97.189087, 30.473770), ST_AsGeoJSON(ST_MakePoint(-97.189087, 30.473770)), '{9017}'),
(192, 277, 'CR 475 / CR 476', 'Williamson County', 'description', ST_MakePoint(-97.237099, 30.465225), ST_AsGeoJSON(ST_MakePoint(-97.237099, 30.465225)), '{9017}'),
(193, 278, ' CR 474 / CR 476', 'Williamson County', 'description', ST_MakePoint(-97.243347, 30.463282), ST_AsGeoJSON(ST_MakePoint(-97.243347, 30.463282)), '{9017}'),
(194, 279, 'CR 467 / CR 484', 'Williamson County', 'description', ST_MakePoint(-97.287018, 30.425270), ST_AsGeoJSON(ST_MakePoint(-97.287018, 30.425270)), '{9017}'),
(195, 280, ' 484 / CR 491', 'Williamson County', 'description', ST_MakePoint(-97.302071, 30.416157), ST_AsGeoJSON(ST_MakePoint(-97.302071, 30.416157)), '{9017}'),
(196, 281, ' CR 462 / CR 460', 'Williamson County', 'description', ST_MakePoint(-97.370033, 30.441532), ST_AsGeoJSON(ST_MakePoint(-97.370033, 30.441532)), '{9017}'),
(197, 282, 'CR 453 / CR 483', 'Williamson County', 'description', ST_MakePoint(-97.375343, 30.509468), ST_AsGeoJSON(ST_MakePoint(-97.375343, 30.509468)), '{9017}'),
(198, 283, ' CR 134 / CR 132', 'Williamson County', 'description', ST_MakePoint(-97.523163, 30.538054), ST_AsGeoJSON(ST_MakePoint(-97.523163, 30.538054)), '{9017}'),
(199, 284, ' CR 373 / CR 398', 'Williamson County', 'description', ST_MakePoint(-97.455391, 30.576965), ST_AsGeoJSON(ST_MakePoint(-97.455391, 30.576965)), '{9017}'),
(200, 285, ' CR 101', 'Williamson County', 'description', ST_MakePoint(-97.505623, 30.603170), ST_AsGeoJSON(ST_MakePoint(-97.505623, 30.603170)), '{9017}'),
(201, 286, ' CR 130', 'Williamson County', 'description', ST_MakePoint(-97.554382, 30.595480), ST_AsGeoJSON(ST_MakePoint(-97.554382, 30.595480)), '{9017}'),
(202, 287, ' CR 123/ BRUSHY CREEK', 'Williamson County', 'description', ST_MakePoint(-97.589828, 30.530931), ST_AsGeoJSON(ST_MakePoint(-97.589828, 30.530931)), '{9017}'),
(203, 288, '2932 ft WEST OF CR 175 / CR 179', 'Williamson County', 'description', ST_MakePoint(-97.785728, 30.565344), ST_AsGeoJSON(ST_MakePoint(-97.785728, 30.565344)), '{9017}'),
(204, 289, ' CR 177', 'Williamson County', 'description', ST_MakePoint(-97.789879, 30.573837), ST_AsGeoJSON(ST_MakePoint(-97.789879, 30.573837)), '{9017}'),
(205, 290, 'CR 285 / CR 284', 'Williamson County', 'description', ST_MakePoint(-98.009323, 30.641748), ST_AsGeoJSON(ST_MakePoint(-98.009323, 30.641748)), '{9017}'),
(206, 291, '2500 ft WEST OF CR 126 / CR 121', 'Williamson County', 'description', ST_MakePoint(-97.561203, 30.658648), ST_AsGeoJSON(ST_MakePoint(-97.561203, 30.658648)), '{9017}'),
(207, 292, ' CR 124', 'Williamson County', 'description', ST_MakePoint(-97.540604, 30.677382), ST_AsGeoJSON(ST_MakePoint(-97.540604, 30.677382)), '{9017}'),
(208, 293, 'CR 327 / CR 336', 'Williamson County', 'description', ST_MakePoint(-97.456551, 30.701258), ST_AsGeoJSON(ST_MakePoint(-97.456551, 30.701258)), '{9017}'),
(209, 294, 'CR 327 / CR 336', 'Williamson County', 'description', ST_MakePoint(-97.456909, 30.702188), ST_AsGeoJSON(ST_MakePoint(-97.456909, 30.702188)), '{9017}'),
(210, 295, 'CR 346 / CR 347', 'Williamson County', 'description', ST_MakePoint(-97.434166, 30.702131), ST_AsGeoJSON(ST_MakePoint(-97.434166, 30.702131)), '{9017}'),
(211, 296, 'CR 327 / CR 380', 'Williamson County', 'description', ST_MakePoint(-97.484375, 30.706284), ST_AsGeoJSON(ST_MakePoint(-97.484375, 30.706284)), '{9017}'),
(212, 298, ' RONALD RD / PATRIOT WAY', 'Williamson County', 'description', ST_MakePoint(-97.610481, 30.628939), ST_AsGeoJSON(ST_MakePoint(-97.610481, 30.628939)), '{9017}'),
(213, 299, ' Big Mankins/ CR 100', 'Williamson County', 'description', ST_MakePoint(-97.580414, 30.640711), ST_AsGeoJSON(ST_MakePoint(-97.580414, 30.640711)), '{9017}'),
(214, 300, 'CR 348 / CR 347', 'Williamson County', 'description', ST_MakePoint(-97.426888, 30.714729), ST_AsGeoJSON(ST_MakePoint(-97.426888, 30.714729)), '{9017}'),
(215, 301, ' CR 353 / CR 350', 'Williamson County', 'description', ST_MakePoint(-97.408478, 30.764271), ST_AsGeoJSON(ST_MakePoint(-97.408478, 30.764271)), '{9017}'),
(216, 302, '1580 ft NORTH OF FM 971 / CR 335', 'Williamson County', 'description', ST_MakePoint(-97.472336, 30.709368), ST_AsGeoJSON(ST_MakePoint(-97.472336, 30.709368)), '{9017}'),
(217, 303, ' CR 300 / CR 326', 'Williamson County', 'description', ST_MakePoint(-97.471275, 30.721638), ST_AsGeoJSON(ST_MakePoint(-97.471275, 30.721638)), '{9017}'),
(218, 304, '0.5 MILE WEST OF SH 95 / CR 325', 'Williamson County', 'description', ST_MakePoint(-97.447197, 30.735790), ST_AsGeoJSON(ST_MakePoint(-97.447197, 30.735790)), '{9017}'),
(219, 305, ' CR 321 / CR 382', 'Williamson County', 'description', ST_MakePoint(-97.531715, 30.771580), ST_AsGeoJSON(ST_MakePoint(-97.531715, 30.771580)), '{9017}'),
(220, 306, ' CR 314 / CR 315', 'Williamson County', 'description', ST_MakePoint(-97.592148, 30.789936), ST_AsGeoJSON(ST_MakePoint(-97.592148, 30.789936)), '{9017}'),
(221, 307, 'FM 487 / CR 303', 'Williamson County', 'description', ST_MakePoint(-97.556557, 30.820198), ST_AsGeoJSON(ST_MakePoint(-97.556557, 30.820198)), '{9017}'),
(222, 308, ' WALSH DR / SAM BASS RD', 'Williamson County', 'description', ST_MakePoint(-97.751106, 30.538378), ST_AsGeoJSON(ST_MakePoint(-97.751106, 30.538378)), '{9017}'),
(223, 309, ' CR 234 / CR 143', 'Williamson County', 'description', ST_MakePoint(-97.656326, 30.730900), ST_AsGeoJSON(ST_MakePoint(-97.656326, 30.730900)), '{9017}'),
(224, 310, '1480 ft NORTH OF CR 147 / CR 234', 'Williamson County', 'description', ST_MakePoint(-97.664925, 30.742970), ST_AsGeoJSON(ST_MakePoint(-97.664925, 30.742970)), '{9017}'),
(225, 311, '1060 ft SOUTH OF CR 146 / CR 234', 'Williamson County', 'description', ST_MakePoint(-97.663589, 30.750736), ST_AsGeoJSON(ST_MakePoint(-97.663589, 30.750736)), '{9017}'),
(226, 312, '234 / CR 239', 'Williamson County', 'description', ST_MakePoint(-97.680244, 30.773506), ST_AsGeoJSON(ST_MakePoint(-97.680244, 30.773506)), '{9017}'),
(227, 313, ' CR 234 / LIVE OAK TRLS', 'Williamson County', 'description', ST_MakePoint(-97.664352, 30.756662), ST_AsGeoJSON(ST_MakePoint(-97.664352, 30.756662)), '{9017}'),
(228, 314, 'SPEARS RANCH RD / CR 305', 'Williamson County', 'description', ST_MakePoint(-97.642883, 30.828339), ST_AsGeoJSON(ST_MakePoint(-97.642883, 30.828339)), '{9017}'),
(229, 315, ' FM 487 / CR 232', 'Williamson County', 'description', ST_MakePoint(-97.694443, 30.827089), ST_AsGeoJSON(ST_MakePoint(-97.694443, 30.827089)), '{9017}'),
(230, 316, 'FM 487 / CR 232', 'Williamson County', 'description', ST_MakePoint(-97.693382, 30.828140), ST_AsGeoJSON(ST_MakePoint(-97.693382, 30.828140)), '{9017}'),
(231, 317, 'CR 308 / CR 307', 'Williamson County', 'description', ST_MakePoint(-97.617378, 30.859653), ST_AsGeoJSON(ST_MakePoint(-97.617378, 30.859653)), '{9017}'),
(232, 318, 'FM 487 / CR 232', 'Williamson County', 'description', ST_MakePoint(-97.725784, 30.847746), ST_AsGeoJSON(ST_MakePoint(-97.725784, 30.847746)), '{9017}'),
(233, 319, ' CR 230 / CR 229', 'Williamson County', 'description', ST_MakePoint(-97.766731, 30.856525), ST_AsGeoJSON(ST_MakePoint(-97.766731, 30.856525)), '{9017}'),
(234, 320, 'CR 223 / CR 221', 'Williamson County', 'description', ST_MakePoint(-97.868492, 30.840420), ST_AsGeoJSON(ST_MakePoint(-97.868492, 30.840420)), '{9017}'),
(235, 321, ' CR 241 / CR 245', 'Williamson County', 'description', ST_MakePoint(-97.790596, 30.775003), ST_AsGeoJSON(ST_MakePoint(-97.790596, 30.775003)), '{9017}'),
(236, 322, ' CR 249 / CR 245', 'Williamson County', 'description', ST_MakePoint(-97.786469, 30.765099), ST_AsGeoJSON(ST_MakePoint(-97.786469, 30.765099)), '{9017}'),
(237, 323, ' CR 236 / CR 208', 'Williamson County', 'description', ST_MakePoint(-97.930092, 30.816826), ST_AsGeoJSON(ST_MakePoint(-97.930092, 30.816826)), '{9017}'),
(238, 324, ' CR 204 / CR 200', 'Williamson County', 'description', ST_MakePoint(-97.936462, 30.754763), ST_AsGeoJSON(ST_MakePoint(-97.936462, 30.754763)), '{9017}'),
(239, 325, 'SAN GABRIEL RANCH RD / SAN GABRIEL RANCH RD', 'Williamson County', 'description', ST_MakePoint(-97.909195, 30.707323), ST_AsGeoJSON(ST_MakePoint(-97.909195, 30.707323)), '{9017}'),
(240, 326, ' BRUSHY CREEK RD / BRUSHY BEND DR', 'Williamson County', 'description', ST_MakePoint(-97.745033, 30.519209), ST_AsGeoJSON(ST_MakePoint(-97.745033, 30.519209)), '{9017}'),
(241, 327, 'WEST OF BRUSHY BEND DR / BRUSHY CREEK RD', 'Williamson County', 'description', ST_MakePoint(-97.745857, 30.518866), ST_AsGeoJSON(ST_MakePoint(-97.745857, 30.518866)), '{9017}'),
(242, 328, 'CR 272/BRUSHY CREEK', 'Williamson County', 'description', ST_MakePoint(-97.779129, 30.539675), ST_AsGeoJSON(ST_MakePoint(-97.779129, 30.539675)), '{9017}'),
(243, 329, ' KAUFFMAN LOOP / CR 267', 'Williamson County', 'description', ST_MakePoint(-97.845818, 30.617039), ST_AsGeoJSON(ST_MakePoint(-97.845818, 30.617039)), '{9017}'),
(244, 330, 'CR 281 / CR 279', 'Williamson County', 'description', ST_MakePoint(-97.904335, 30.628489), ST_AsGeoJSON(ST_MakePoint(-97.904335, 30.628489)), '{9017}'),
(245, 331, ' CR 346 / CR 279', 'Williamson County', 'description', ST_MakePoint(-97.419357, 30.701603), ST_AsGeoJSON(ST_MakePoint(-97.419357, 30.701603)), '{9017}'),
(246, 332, ' CR 347 / CR 348', 'Williamson County', 'description', ST_MakePoint(-97.422028, 30.708214), ST_AsGeoJSON(ST_MakePoint(-97.422028, 30.708214)), '{9017}'),
(247, 333, '840 ft NORTH OF CR 438 / CR 434', 'Williamson County', 'description', ST_MakePoint(-97.229271, 30.553251), ST_AsGeoJSON(ST_MakePoint(-97.229271, 30.553251)), '{9017}'),
(248, 334, '1390 ft SOUTH OF CR 436 / CR 434', 'Williamson County', 'description', ST_MakePoint(-97.231003, 30.555593), ST_AsGeoJSON(ST_MakePoint(-97.231003, 30.555593)), '{9017}'),
(249, 335, '250 ft EAST OF CR 436 / CR 434', 'Williamson County', 'description', ST_MakePoint(-97.233002, 30.558199), ST_AsGeoJSON(ST_MakePoint(-97.233002, 30.558199)), '{9017}'),
(250, 336, 'CR 414 / CR 424', 'Williamson County', 'description', ST_MakePoint(-97.310989, 30.623293), ST_AsGeoJSON(ST_MakePoint(-97.310989, 30.623293)), '{9017}'),
(251, 337, '470 ft WEST OF CR 417 / CR 416', 'Williamson County', 'description', ST_MakePoint(-97.365608, 30.652655), ST_AsGeoJSON(ST_MakePoint(-97.365608, 30.652655)), '{9017}'),
(252, 338, 'CR 493 / CR 361', 'Williamson County', 'description', ST_MakePoint(-97.282036, 30.702215), ST_AsGeoJSON(ST_MakePoint(-97.282036, 30.702215)), '{9017}'),
(253, 339, 'CR 363', 'Williamson County', 'description', ST_MakePoint(-97.287689, 30.737436), ST_AsGeoJSON(ST_MakePoint(-97.287689, 30.737436)), '{9017}'),
(254, 340, 'CR 350 / CR 351', 'Williamson County', 'description', ST_MakePoint(-97.396248, 30.775734), ST_AsGeoJSON(ST_MakePoint(-97.396248, 30.775734)), '{9017}'),
(255, 341, 'SH 95 / CR 351', 'Williamson County', 'description', ST_MakePoint(-97.426132, 30.784943), ST_AsGeoJSON(ST_MakePoint(-97.426132, 30.784943)), '{9017}'),
(256, 342, ' N RED BUD LN / N CR 122', 'Williamson County', 'description', ST_MakePoint(-97.609543, 30.553429), ST_AsGeoJSON(ST_MakePoint(-97.609543, 30.553429)), '{9017}'),
(257, 343, ' LIMMER LOOP / CR 108', 'Williamson County', 'description', ST_MakePoint(-97.571274, 30.555363), ST_AsGeoJSON(ST_MakePoint(-97.571274, 30.555363)), '{9017}'),
(258, 344, 'US 79 / CR 110', 'Williamson County', 'description', ST_MakePoint(-97.601257, 30.536390), ST_AsGeoJSON(ST_MakePoint(-97.601257, 30.536390)), '{9017}'),
(259, 345, '385 ft CR 160 / CR 101', 'Williamson County', 'description', ST_MakePoint(-97.497696, 30.584658), ST_AsGeoJSON(ST_MakePoint(-97.497696, 30.584658)), '{9017}'),
(260, 346, '1122 ft WEST OF CR 101 / CR 369', 'Williamson County', 'description', ST_MakePoint(-97.493073, 30.582775), ST_AsGeoJSON(ST_MakePoint(-97.493073, 30.582775)), '{9017}'),
(261, 347, '2300 ft EAST OF CR 368 / CR 369', 'Williamson County', 'description', ST_MakePoint(-97.468796, 30.594105), ST_AsGeoJSON(ST_MakePoint(-97.468796, 30.594105)), '{9017}'),
(262, 348, '142  MAIN ST / CR 365', 'Williamson County', 'description', ST_MakePoint(-97.425888, 30.612009), ST_AsGeoJSON(ST_MakePoint(-97.425888, 30.612009)), '{9017}'),
(263, 349, '1370 ft SOUTH OF FM 972 / CR 301', 'Williamson County', 'description', ST_MakePoint(-97.469620, 30.759796), ST_AsGeoJSON(ST_MakePoint(-97.469620, 30.759796)), '{9017}'),
(264, 350, 'CR 384 / CR 321', 'Williamson County', 'description', ST_MakePoint(-97.516914, 30.773142), ST_AsGeoJSON(ST_MakePoint(-97.516914, 30.773142)), '{9017}'),
(265, 351, 'CR 382 / CR 321', 'Williamson County', 'description', ST_MakePoint(-97.523506, 30.773922), ST_AsGeoJSON(ST_MakePoint(-97.523506, 30.773922)), '{9017}'),
(266, 352, ' CR 302 / CR 343', 'Williamson County', 'description', ST_MakePoint(-97.496445, 30.776949), ST_AsGeoJSON(ST_MakePoint(-97.496445, 30.776949)), '{9017}'),
(267, 353, ' CR 302 / CR 384', 'Williamson County', 'description', ST_MakePoint(-97.511070, 30.786507), ST_AsGeoJSON(ST_MakePoint(-97.511070, 30.786507)), '{9017}'),
(268, 354, ' 487 / CR 384', 'Williamson County', 'description', ST_MakePoint(-97.503098, 30.808092), ST_AsGeoJSON(ST_MakePoint(-97.503098, 30.808092)), '{9017}'),
(269, 355, '1465 ft NORTH OF FM 487 / CR 303 NORTH OF FM 487', 'Williamson County', 'description', ST_MakePoint(-97.562256, 30.835255), ST_AsGeoJSON(ST_MakePoint(-97.562256, 30.835255)), '{9017}'),
(270, 356, 'CR 140 / CR 149', 'Williamson County', 'description', ST_MakePoint(-97.605507, 30.699381), ST_AsGeoJSON(ST_MakePoint(-97.605507, 30.699381)), '{9017}'),
(271, 357, ' CR 152 @ LONNIE THOMAS', 'Williamson County', 'description', ST_MakePoint(-97.649773, 30.667727), ST_AsGeoJSON(ST_MakePoint(-97.649773, 30.667727)), '{9017}'),
(272, 358, ' CR 202 / CR 200', 'Williamson County', 'description', ST_MakePoint(-97.936562, 30.737272), ST_AsGeoJSON(ST_MakePoint(-97.936562, 30.737272)), '{9017}'),
(273, 359, 'CR 140 / CR 149', 'Williamson County', 'description', ST_MakePoint(-97.612869, 30.697081), ST_AsGeoJSON(ST_MakePoint(-97.612869, 30.697081)), '{9017}'),
(274, 360, 'SH 29 / CR 266', 'Williamson County', 'description', ST_MakePoint(-97.845818, 30.617039), ST_AsGeoJSON(ST_MakePoint(-97.845818, 30.617039)), '{9017}'),
(275, 361, ' FM 1331 / CR 428', 'Williamson County', 'description', ST_MakePoint(-97.321938, 30.679565), ST_AsGeoJSON(ST_MakePoint(-97.321938, 30.679565)), '{9017}'),
(276, 362, 'CR 137 / CR 137', 'Williamson County', 'description', ST_MakePoint(-97.548454, 30.507570), ST_AsGeoJSON(ST_MakePoint(-97.548454, 30.507570)), '{9017}'),
(277, 363, 'CR 105 / CR 105', 'Williamson County', 'description', ST_MakePoint(-97.586250, 30.615997), ST_AsGeoJSON(ST_MakePoint(-97.586250, 30.615997)), '{9017}'),
(278, 364, 'FM 1660 AT COTTONWOOD CREEK / FM 1660', 'Williamson County', 'description', ST_MakePoint(-97.527565, 30.512360), ST_AsGeoJSON(ST_MakePoint(-97.527565, 30.512360)), '{9017}'),
(279, 365, 'FM 685 AT BRUSHY CREEK / FM 685', 'Williamson County', 'description', ST_MakePoint(-97.566811, 30.526350), ST_AsGeoJSON(ST_MakePoint(-97.566811, 30.526350)), '{9017}'),
(280, 366, 'CR 129 AT BRUSHY CREEK / CR 129', 'Williamson County', 'description', ST_MakePoint(-97.499069, 30.489567), ST_AsGeoJSON(ST_MakePoint(-97.499069, 30.489567)), '{9017}'),
(281, 405, '1400 Blk Nature Heights Dr', 'Between US-281 & Commerce St., Marble Falls,', 'description', ST_MakePoint(-98.268562, 30.599077), ST_AsGeoJSON(ST_MakePoint(-98.268562, 30.599077)), '{9006}'),
(282, 406, '1200 Blk Mission Hill Dr.', 'Between Bluebonnet Dr & Ave K, Marble Falls, T', 'description', ST_MakePoint(-98.275215, 30.582359), ST_AsGeoJSON(ST_MakePoint(-98.275215, 30.582359)), '{9006}'),
(283, 407, '1700 Blk Broadway St Bridge', 'Between Ave. S & Ave. Q, Marble Falls, TX', 'description', ST_MakePoint(-98.284653, 30.581682), ST_AsGeoJSON(ST_MakePoint(-98.284653, 30.581682)), '{9006}'),
(284, 408, '2100 Blk Broadway St', 'Between Ave. U & Industrial Blvd., Marble Fall', 'description', ST_MakePoint(-98.288109, 30.583336), ST_AsGeoJSON(ST_MakePoint(-98.288109, 30.583336)), '{9006}'),
(285, 409, '1300 Blk Broadway St', 'Between Ave L & Ave N, Marble Falls, TX', 'description', ST_MakePoint(-98.278419, 30.578560), ST_AsGeoJSON(ST_MakePoint(-98.278419, 30.578560)), '{9006}'),
(286, 410, '800 Blk Ave J', 'Between Broadway St., & Ninth St., Marble Fall', 'description', ST_MakePoint(-98.275375, 30.577234), ST_AsGeoJSON(ST_MakePoint(-98.275375, 30.577234)), '{9006}'),
(287, 411, '800 Blk Main St.', 'Between Broadway St. & Ninth St., Marble Falls', 'description', ST_MakePoint(-98.274132, 30.576857), ST_AsGeoJSON(ST_MakePoint(-98.274132, 30.576857)), '{9006}'),
(288, 412, '1500 Blk 2nd St', 'Between Ave. P & Ave. N., Marble Falls, TX', 'description', ST_MakePoint(-98.284576, 30.574352), ST_AsGeoJSON(ST_MakePoint(-98.284576, 30.574352)), '{9006}'),
(289, 413, '800 Blk Lake Shore Dr.', 'Between Edyth St. & Trinity St., Marble Falls,', 'description', ST_MakePoint(-98.283867, 30.562025), ST_AsGeoJSON(ST_MakePoint(-98.283867, 30.562025)), '{9006}'),
(290, 414, '1100 Blk Yett St.', 'Between Ave. J & Ave. L, Marble Falls, TX', 'description', ST_MakePoint(-98.281143, 30.570227), ST_AsGeoJSON(ST_MakePoint(-98.281143, 30.570227)), '{9006}'),
(291, 416, '800 Blk Ave L', 'Between Broadway St. & Ninth St., Marble Falls', 'description', ST_MakePoint(-98.277336, 30.578644), ST_AsGeoJSON(ST_MakePoint(-98.277336, 30.578644)), '{9006}'),
(292, 417, '100 Blk S Avenue S Bridge', 'Between Johnson St. & Granite Mountain Trl.', 'description', ST_MakePoint(-98.290871, 30.573744), ST_AsGeoJSON(ST_MakePoint(-98.290871, 30.573744)), '{9006}'),
(293, 418, '100 Blk S Ave N (Huber)', 'Between Backbone St. & 1st St., Marble Falls, ', 'description', ST_MakePoint(-98.286026, 30.570494), ST_AsGeoJSON(ST_MakePoint(-98.286026, 30.570494)), '{9006}'),
(294, 419, '300 Blk Avenue S', 'Between 3rd St. &amp; 4th St.', 'description', ST_MakePoint(-98.288307, 30.577681), ST_AsGeoJSON(ST_MakePoint(-98.288307, 30.577681)), '{9006}'),
(295, 420, '1100 Blk 3rd St Bridge', 'Between Ave. L &amp; Ave. K', 'description', ST_MakePoint(-98.279320, 30.572729), ST_AsGeoJSON(ST_MakePoint(-98.279320, 30.572729)), '{9006}'),
(296, 421, '1700 Blk US Highway 281 Bridge', 'Between Marble Hts. &amp; Latana Dr.', 'description', ST_MakePoint(-98.273964, 30.588221), ST_AsGeoJSON(ST_MakePoint(-98.273964, 30.588221)), '{9006}'),
(297, 422, '1300 Blk RM - 1431 Bridge', 'Between Bluebonnet Dr. &amp; Ave. K', 'description', ST_MakePoint(-98.278038, 30.580851), ST_AsGeoJSON(ST_MakePoint(-98.278038, 30.580851)), '{9006}'),
(298, 423, '800 Blk Hwy 281 Bridge', 'Between Broadway St. &amp; 9th St.', 'description', ST_MakePoint(-98.273430, 30.576721), ST_AsGeoJSON(ST_MakePoint(-98.273430, 30.576721)), '{9006}'),
(299, 424, '900 Blk RM - 1431 Bridge', 'Between Main St. &amp; Ave. H', 'description', ST_MakePoint(-98.272041, 30.578403), ST_AsGeoJSON(ST_MakePoint(-98.272041, 30.578403)), '{9006}'),
(300, 425, '700 Blk 12th St Bridge', 'Between Ave. G &amp; Main St.', 'description', ST_MakePoint(-98.270065, 30.579365), ST_AsGeoJSON(ST_MakePoint(-98.270065, 30.579365)), '{9006}'),
(301, 426, '1200 Blk Arbor Ln.', 'Between Arbor Ln. & Lacy Dr.', 'description', ST_MakePoint(-98.282784, 30.587086), ST_AsGeoJSON(ST_MakePoint(-98.282784, 30.587086)), '{9006}'),
(302, 427, 'Johnson Park Bridge', 'Between S Yett St. & Johnson St.', 'description', ST_MakePoint(-98.280884, 30.568752), ST_AsGeoJSON(ST_MakePoint(-98.280884, 30.568752)), '{9006}'),
(303, 428, '1100 Blk 2nd St Bridge', 'Between Ave. J & Ave. L', 'description', ST_MakePoint(-98.279953, 30.572062), ST_AsGeoJSON(ST_MakePoint(-98.279953, 30.572062)), '{9006}'),
(304, 429, '1100 Blk 4th St Bridge', 'Between Ave. K &amp; Ave. M', 'description', ST_MakePoint(-98.280518, 30.574530), ST_AsGeoJSON(ST_MakePoint(-98.280518, 30.574530)), '{9006}'),
(305, 430, '900 Blk Avenue H', 'Between Broadway St. &amp; RM -1431', 'description', ST_MakePoint(-98.272057, 30.577091), ST_AsGeoJSON(ST_MakePoint(-98.272057, 30.577091)), '{9006}'),
(306, 431, '1500 Blk Resource Pkwy', 'Between US Highway 281 &amp; W Innovation Loop', 'description', ST_MakePoint(-98.264015, 30.616772), ST_AsGeoJSON(ST_MakePoint(-98.264015, 30.616772)), '{9006}'),
(307, 432, '1900 Blk RM - 1431 Bridge', 'Between Ave.Q &amp; Ave. U', 'description', ST_MakePoint(-98.284515, 30.584019), ST_AsGeoJSON(ST_MakePoint(-98.284515, 30.584019)), '{9006}'),
(308, 433, '2000 Blk 4th St', 'Between Ave. T &amp; Ave. S', 'description', ST_MakePoint(-98.289345, 30.578768), ST_AsGeoJSON(ST_MakePoint(-98.289345, 30.578768)), '{9006}'),
(309, 434, '2000 Blk 5th St', 'Between Ave. S &amp; Ave. T', 'description', ST_MakePoint(-98.287811, 30.579531), ST_AsGeoJSON(ST_MakePoint(-98.287811, 30.579531)), '{9006}'),
(310, 435, '400 - 700 Blk Avenue T', 'Between 4th St. & 7th St.', 'description', ST_MakePoint(-98.288147, 30.580151), ST_AsGeoJSON(ST_MakePoint(-98.288147, 30.580151)), '{9006}'),
(311, 436, '2000 Blk 7th St.', 'Between Ave. U & Ave. T', 'description', ST_MakePoint(-98.287689, 30.581942), ST_AsGeoJSON(ST_MakePoint(-98.287689, 30.581942)), '{9006}'),
(312, 437, '800 Blk Ave U', 'Between 7th St. & Broadway St.', 'description', ST_MakePoint(-98.288437, 30.582624), ST_AsGeoJSON(ST_MakePoint(-98.288437, 30.582624)), '{9006}'),
(313, 439, 'Montell Rd (CR 339) E of Angostura Ln ', 'Hays County', 'description', ST_MakePoint(-98.243378, 30.118563), ST_AsGeoJSON(ST_MakePoint(-98.243378, 30.118563)), '{9016}'),
(314, 440, 'Circle Dr - S of Sandy Point Rd', 'Hays County', 'description', ST_MakePoint(-98.216927, 30.046593), ST_AsGeoJSON(ST_MakePoint(-98.216927, 30.046593)), '{9016}'),
(315, 441, 'PETRAS WAY - BETWEEN MONTZ PT & STEPHANIES TRL', 'Hays County', 'description', ST_MakePoint(-97.750755, 30.037531), ST_AsGeoJSON(ST_MakePoint(-97.750755, 30.037531)), '{9016}'),
(316, 442, 'DACY LN (CR 205) - .5 MI N OF WINDY HILL RD', 'Hays County', 'description', ST_MakePoint(-97.828224, 30.038677), ST_AsGeoJSON(ST_MakePoint(-97.828224, 30.038677)), '{9016}'),
(317, 443, 'RED OAK RD - .25 MI W OF OAK GROVE RD', 'Hays County', 'description', ST_MakePoint(-97.911537, 30.113346), ST_AsGeoJSON(ST_MakePoint(-97.911537, 30.113346)), '{9016}'),
(318, 444, 'BELL SPRINGS RD (SOUTH) -  .5 MI N OF HARMON HILLS RD', 'Hays County', 'description', ST_MakePoint(-98.121185, 30.228535), ST_AsGeoJSON(ST_MakePoint(-98.121185, 30.228535)), '{9016}'),
(319, 445, 'MARTIN RD (CR188) - .5 MI W OF PLANT LADY LN', 'Hays County', 'description', ST_MakePoint(-98.179192, 30.220041), ST_AsGeoJSON(ST_MakePoint(-98.179192, 30.220041)), '{9016}'),
(320, 446, 'LONGVIEW RD - .5 MI S OF TWIN CREEK RD', 'Hays County', 'description', ST_MakePoint(-98.194405, 30.251295), ST_AsGeoJSON(ST_MakePoint(-98.194405, 30.251295)), '{9016}'),
(321, 447, 'PAISANO TRL - WEST OF TRAIL DRIVER', 'Hays County', 'description', ST_MakePoint(-98.012436, 30.222067), ST_AsGeoJSON(ST_MakePoint(-98.012436, 30.222067)), '{9016}'),
(322, 448, 'SATTERWHITE RD (CR 107) - .5 E OF FM 2OO1', 'Hays County', 'description', ST_MakePoint(-97.794724, 30.061136), ST_AsGeoJSON(ST_MakePoint(-97.794724, 30.061136)), '{9016}'),
(323, 449, 'SATTERWHITE RD - .66 MI W OF WILLIAMSON RD', 'Hays County', 'description', ST_MakePoint(-97.768005, 30.048773), ST_AsGeoJSON(ST_MakePoint(-97.768005, 30.048773)), '{9016}'),
(324, 450, 'SCHUBERT LN - .5 MI N OF NEIDERWALD STRASSE', 'Hays County', 'description', ST_MakePoint(-97.729103, 30.018488), ST_AsGeoJSON(ST_MakePoint(-97.729103, 30.018488)), '{9016}'),
(325, 451, 'COTTON GIN RD - .66 MI N OF DAIRY RD', 'Hays County', 'description', ST_MakePoint(-97.816856, 29.984154), ST_AsGeoJSON(ST_MakePoint(-97.816856, 29.984154)), '{9016}'),
(326, 452, 'COTTON GIN RD AND DAIRY RD', 'Hays County', 'description', ST_MakePoint(-97.808655, 29.976870), ST_AsGeoJSON(ST_MakePoint(-97.808655, 29.976870)), '{9016}'),
(327, 453, 'REDWOOD RD (CR 232) - S OF OLD BASTROP HWY', 'Hays County', 'description', ST_MakePoint(-97.928429, 29.833851), ST_AsGeoJSON(ST_MakePoint(-97.928429, 29.833851)), '{9016}'),
(328, 455, 'DACY LN (CR 205) - .25 MI N OF KELLEY SMITH LN (CR 149)', 'Hays County', 'description', ST_MakePoint(-97.828293, 30.043983), ST_AsGeoJSON(ST_MakePoint(-97.828293, 30.043983)), '{9016}'),
(329, 456, 'WINDY HILL RD (CR 131) - W of Palomino Rd (CR 124)', 'Hays County', 'description', ST_MakePoint(-97.810860, 30.031456), ST_AsGeoJSON(ST_MakePoint(-97.810860, 30.031456)), '{9016}'),
(330, 457, 'GOFORTH RD (CR 157) - JUST N OF ROHDE RD (CR 126)', 'Hays County', 'description', ST_MakePoint(-97.784599, 30.029179), ST_AsGeoJSON(ST_MakePoint(-97.784599, 30.029179)), '{9016}'),
(331, 458, 'S QUAIL RUN - JUST S OF RED BIRD DR', 'Hays County', 'description', ST_MakePoint(-97.792358, 30.040094), ST_AsGeoJSON(ST_MakePoint(-97.792358, 30.040094)), '{9016}'),
(332, 459, 'WINDY HILL RD (CR 131) - JUST S OF FM 2001', 'Hays County', 'description', ST_MakePoint(-97.803452, 30.044287), ST_AsGeoJSON(ST_MakePoint(-97.803452, 30.044287)), '{9016}'),
(333, 460, 'BLACKBIRD LN - JUST N OF HOWARD LN', 'Hays County', 'description', ST_MakePoint(-97.796776, 30.041714), ST_AsGeoJSON(ST_MakePoint(-97.796776, 30.041714)), '{9016}'),
(334, 461, 'ROLLING HILLS DR - .25 MI W OF FM 2001', 'Hays County', 'description', ST_MakePoint(-97.795776, 30.041094), ST_AsGeoJSON(ST_MakePoint(-97.795776, 30.041094)), '{9016}'),
(335, 462, 'HILLSIDE TERR - .75 MI W OF FM 2001', 'Hays County', 'description', ST_MakePoint(-97.816498, 30.058584), ST_AsGeoJSON(ST_MakePoint(-97.816498, 30.058584)), '{9016}'),
(336, 463, 'MARTIN RD (CR 188) - .10 MI S OF WINDY HILLS RD', 'Hays County', 'description', ST_MakePoint(-98.184196, 30.211290), ST_AsGeoJSON(ST_MakePoint(-98.184196, 30.211290)), '{9016}'),
(337, 464, 'SATTERWHITE RD (CR 107) - .20 MI W OF WILLIAMSON RD (CR 120)', 'Hays County', 'description', ST_MakePoint(-97.764038, 30.042793), ST_AsGeoJSON(ST_MakePoint(-97.764038, 30.042793)), '{9016}'),
(338, 465, 'OLD WEST TRAIL - .20 MI S OF FM 2001', 'Hays County', 'description', ST_MakePoint(-97.816040, 30.068115), ST_AsGeoJSON(ST_MakePoint(-97.816040, 30.068115)), '{9016}'),
(339, 466, 'RICH LN - .25 MI E OF TURNERSVILLE RD (CR 212)', 'Hays County', 'description', ST_MakePoint(-97.777069, 30.066278), ST_AsGeoJSON(ST_MakePoint(-97.777069, 30.066278)), '{9016}'),
(340, 467, 'TURNERSVILLE RD (CR 212) - .33 MI N OF RICH LN', 'Hays County', 'description', ST_MakePoint(-97.781357, 30.072577), ST_AsGeoJSON(ST_MakePoint(-97.781357, 30.072577)), '{9016}'),
(341, 468, 'HARRIS HILL RD (CR 160) - .75 MI W OF SOUTHPOINT DR', 'Hays County', 'description', ST_MakePoint(-97.889542, 29.908024), ST_AsGeoJSON(ST_MakePoint(-97.889542, 29.908024)), '{9016}'),
(342, 469, 'HARRIS HILL RD (CR 160) - .25 MI W OF HWY 21', 'Hays County', 'description', ST_MakePoint(-97.883858, 29.895720), ST_AsGeoJSON(ST_MakePoint(-97.883858, 29.895720)), '{9016}'),
(343, 470, 'SATTERWHITE RD (CR 107) - .5 MI E OF S TURNERSVILLE RD (CR 212)', 'Hays County', 'description', ST_MakePoint(-97.770607, 30.056059), ST_AsGeoJSON(ST_MakePoint(-97.770607, 30.056059)), '{9016}'),
(344, 471, 'S TURNSERSVILLE RD (CR 212) - .5 MI S OF SATTERWHITE RD (CR 107)', 'Hays County', 'description', ST_MakePoint(-97.780602, 30.055243), ST_AsGeoJSON(ST_MakePoint(-97.780602, 30.055243)), '{9016}'),
(345, 473, 'SATTERWHITE RD (CR 107) - BETWEEN BOTH S TURNERSVILLE RDS', 'Hays County', 'description', ST_MakePoint(-97.779701, 30.060678), ST_AsGeoJSON(ST_MakePoint(-97.779701, 30.060678)), '{9016}'),
(346, 474, 'SATTERWHITE RD (CR 107) - 1.25 MI E OF FM 2001 (BEFORE S TURNERSVILLE)', 'Hays County', 'description', ST_MakePoint(-97.783516, 30.061365), ST_AsGeoJSON(ST_MakePoint(-97.783516, 30.061365)), '{9016}'),
(347, 475, 'PETRAS WAY - BETWEEN PETRAS CV AND PEGGYS TRL', 'Hays County', 'description', ST_MakePoint(-97.753822, 30.039825), ST_AsGeoJSON(ST_MakePoint(-97.753822, 30.039825)), '{9016}'),
(348, 476, 'SCHUBERT LN (CR 211) - .5 MI W OF HWY 21', 'Hays County', 'description', ST_MakePoint(-97.721024, 30.023180), ST_AsGeoJSON(ST_MakePoint(-97.721024, 30.023180)), '{9016}'),
(349, 477, 'GRIST MILL RD (CR 153) - .5 MI W OF HWY 21, JUST BEFORE S PLUM CREEK RD (CR 156)', 'Hays County', 'description', ST_MakePoint(-97.805481, 29.951456), ST_AsGeoJSON(ST_MakePoint(-97.805481, 29.951456)), '{9016}'),
(350, 478, 'S PLUM CREEK RD (CR 156) - JUST E OF GRIST MILL RD (CR 153)', 'Hays County', 'description', ST_MakePoint(-97.805038, 29.952936), ST_AsGeoJSON(ST_MakePoint(-97.805038, 29.952936)), '{9016}'),
(351, 479, 'GRIST MILL RD (CR 153) - .75 MI W OF S PLUM CREEK RD (CR 156)', 'Hays County', 'description', ST_MakePoint(-97.814911, 29.959692), ST_AsGeoJSON(ST_MakePoint(-97.814911, 29.959692)), '{9016}'),
(352, 480, 'WINDY HILL RD (CR 131) - .5 MI W OF PALOMINO RD (CR 124)', 'Hays County', 'description', ST_MakePoint(-97.819214, 30.030495), ST_AsGeoJSON(ST_MakePoint(-97.819214, 30.030495)), '{9016}'),
(353, 481, 'GATLIN CREEK RD (SOUTH OF MT GAINOR) AT SOUTH ONION CREEK', 'Hays County', 'description', ST_MakePoint(-98.136330, 30.142319), ST_AsGeoJSON(ST_MakePoint(-98.136330, 30.142319)), '{9016}'),
(354, 482, 'PALOMA CIR - S OF DOVE HOLLOW DR', 'Hays County', 'description', ST_MakePoint(-97.892113, 30.019053), ST_AsGeoJSON(ST_MakePoint(-97.892113, 30.019053)), '{9016}'),
(355, 483, 'TURTLEDOVE CIR - S OF DOVE HOLLOW DR', 'Hays County', 'description', ST_MakePoint(-97.893333, 30.018843), ST_AsGeoJSON(ST_MakePoint(-97.893333, 30.018843)), '{9016}'),
(356, 484, 'CYPRESS RD - 1.75 MI W OF OLD STAGECOACH RD', 'Hays County', 'description', ST_MakePoint(-97.917130, 29.992199), ST_AsGeoJSON(ST_MakePoint(-97.917130, 29.992199)), '{9016}'),
(357, 485, 'TALL OAKS TRL - 800 FT N OF LAUREL HILL ST', 'Hays County', 'description', ST_MakePoint(-97.989250, 30.215183), ST_AsGeoJSON(ST_MakePoint(-97.989250, 30.215183)), '{9016}'),
(358, 486, 'LAUREL HILL ST - 800 FT E OF TALL OAKS TRL', 'Hays County', 'description', ST_MakePoint(-97.987038, 30.214270), ST_AsGeoJSON(ST_MakePoint(-97.987038, 30.214270)), '{9016}'),
(359, 487, 'PAULS VALLEY RD - .75 MI SW OF FITZHUGH RD (CR 101)', 'Hays County', 'description', ST_MakePoint(-98.012878, 30.229668), ST_AsGeoJSON(ST_MakePoint(-98.012878, 30.229668)), '{9016}'),
(360, 488, 'FITZHUGH RD (CR 101) - .25 MI W  OF S OAK FOREST DR', 'Hays County', 'description', ST_MakePoint(-98.113197, 30.255049), ST_AsGeoJSON(ST_MakePoint(-98.113197, 30.255049)), '{9016}'),
(361, 489, 'OAK HOLLOW LN - JUST E OF MOURNING DOVE LN', 'Hays County', 'description', ST_MakePoint(-97.896545, 30.106146), ST_AsGeoJSON(ST_MakePoint(-97.896545, 30.106146)), '{9016}'),
(362, 490, 'FM 1626 - BETWEEN LAKEWOOD DR & EAGLE NEST DR (CITY OF HAYS)', 'Hays County', 'description', ST_MakePoint(-97.862167, 30.125540), ST_AsGeoJSON(ST_MakePoint(-97.862167, 30.125540)), '{9016}'),
(363, 491, 'LAKESIDE DR (CR 343) - 1 MI E OF MONTELL RD (CR 339)', 'Hays County', 'description', ST_MakePoint(-98.226723, 30.113211), ST_AsGeoJSON(ST_MakePoint(-98.226723, 30.113211)), '{9016}'),
(364, 492, 'E CREEK DR - .25 MI S OF UPPER BRANCH CV', 'Hays County', 'description', ST_MakePoint(-98.051674, 30.187426), ST_AsGeoJSON(ST_MakePoint(-98.051674, 30.187426)), '{9016}'),
(365, 493, 'FRANCIS HARRIS LN (CR 265) - .25 MI S OF VALLEY ACRES DR', 'Hays County', 'description', ST_MakePoint(-97.998878, 29.756277), ST_AsGeoJSON(ST_MakePoint(-97.998878, 29.756277)), '{9016}'),
(366, 495, 'YORK CREEK RD (CR 262) - .25 MI N OF FRANCIS HARRIS LN (CR 265)', 'Hays County', 'description', ST_MakePoint(-97.994179, 29.762884), ST_AsGeoJSON(ST_MakePoint(-97.994179, 29.762884)), '{9016}'),
(367, 496, 'YORK CREEK RD (CR 262) - .66 MI N OF FRANCIS HARRIS LN (CR 265)', 'Hays County', 'description', ST_MakePoint(-97.998238, 29.768808), ST_AsGeoJSON(ST_MakePoint(-97.998238, 29.768808)), '{9016}'),
(368, 497, 'YORK CREEK RD (CR 262) - .25 MI S OF SOECHTING LN', 'Hays County', 'description', ST_MakePoint(-98.002785, 29.771360), ST_AsGeoJSON(ST_MakePoint(-98.002785, 29.771360)), '{9016}'),
(369, 499, 'OLD MARTINDALE RD (CR 295) AT BLANCO RIVER', 'Hays County', 'description', ST_MakePoint(-97.915611, 29.871346), ST_AsGeoJSON(ST_MakePoint(-97.915611, 29.871346)), '{9016}'),
(370, 500, 'OLD BASTROP HWY (CR 266) - AT MILLERS LAKE', 'Hays County', 'description', ST_MakePoint(-97.936684, 29.831358), ST_AsGeoJSON(ST_MakePoint(-97.936684, 29.831358)), '{9016}'),
(371, 501, 'ROLLING OAKS - BETWEEN CORRIE CT & WILLOW CREEK CIR', 'Hays County', 'description', ST_MakePoint(-97.982445, 29.858175), ST_AsGeoJSON(ST_MakePoint(-97.982445, 29.858175)), '{9016}'),
(372, 502, 'MCCARTY LN (CR233) - .25 MI W OF PHILO ST', 'Hays County', 'description', ST_MakePoint(-97.988823, 29.853956), ST_AsGeoJSON(ST_MakePoint(-97.988823, 29.853956)), '{9016}'),
(373, 504, 'POST RD (CR 140) - AT BLANCO RIVER', 'Hays County', 'description', ST_MakePoint(-97.895134, 29.937107), ST_AsGeoJSON(ST_MakePoint(-97.895134, 29.937107)), '{9016}'),
(374, 505, 'LIME KILN RD - 1 MI W OF POST RD, JUST S OF WINDMERE RD', 'Hays County', 'description', ST_MakePoint(-97.930176, 29.905729), ST_AsGeoJSON(ST_MakePoint(-97.930176, 29.905729)), '{9016}'),
(375, 506, 'FULTON RANCH RD (CR 213) - 1.25 MI N OF RR 12', 'Hays County', 'description', ST_MakePoint(-98.009201, 29.924425), ST_AsGeoJSON(ST_MakePoint(-98.009201, 29.924425)), '{9016}'),
(376, 507, 'HUGO RD (CR 214) - 1 MI W OF RR 12', 'Hays County', 'description', ST_MakePoint(-98.064285, 29.909199), ST_AsGeoJSON(ST_MakePoint(-98.064285, 29.909199)), '{9016}'),
(377, 508, 'HUGO RD (CR 214) - 1.5 MI W OF RR 12', 'Hays County', 'description', ST_MakePoint(-98.067940, 29.908873), ST_AsGeoJSON(ST_MakePoint(-98.067940, 29.908873)), '{9016}'),
(378, 509, 'HUGO RD (CR 214) - 2 MI W OF RR 12', 'Hays County', 'description', ST_MakePoint(-98.073715, 29.906651), ST_AsGeoJSON(ST_MakePoint(-98.073715, 29.906651)), '{9016}'),
(379, 510, 'CASCADE TRL - .25 MI S OF OZARK DR', 'Hays County', 'description', ST_MakePoint(-98.079987, 29.918730), ST_AsGeoJSON(ST_MakePoint(-98.079987, 29.918730)), '{9016}'),
(380, 511, 'HUGO RD (CR 214) - JUST W OF CASCADE TRL', 'Hays County', 'description', ST_MakePoint(-98.094490, 29.905626), ST_AsGeoJSON(ST_MakePoint(-98.094490, 29.905626)), '{9016}'),
(381, 512, 'HUGO RD (CR 214) - .25 MI W OF CASCADE TRL', 'Hays County', 'description', ST_MakePoint(-98.098701, 29.907227), ST_AsGeoJSON(ST_MakePoint(-98.098701, 29.907227)), '{9016}'),
(382, 513, 'HUGO RD (CR 214) - .5 MI W OF CASCADE TRL', 'Hays County', 'description', ST_MakePoint(-98.102379, 29.910919), ST_AsGeoJSON(ST_MakePoint(-98.102379, 29.910919)), '{9016}'),
(383, 514, 'HUGO RD (CR 214) - .5 MI E OF PURGATORY RD (CR 215)', 'Hays County', 'description', ST_MakePoint(-98.113235, 29.916311), ST_AsGeoJSON(ST_MakePoint(-98.113235, 29.916311)), '{9016}'),
(384, 515, 'PURGATORY RD (CR 215) JUST S OF HUGO RD (CR 214)', 'Hays County', 'description', ST_MakePoint(-98.121399, 29.917351), ST_AsGeoJSON(ST_MakePoint(-98.121399, 29.917351)), '{9016}'),
(385, 516, 'PURGATORY RD (CR 215) - .25 MI N OF HUGO RD (CR 214)', 'Hays County', 'description', ST_MakePoint(-98.123192, 29.919334), ST_AsGeoJSON(ST_MakePoint(-98.123192, 29.919334)), '{9016}'),
(386, 517, 'PURGATORY RD (CR 215) - .5 MI S OF RR 12', 'Hays County', 'description', ST_MakePoint(-98.125870, 29.924625), ST_AsGeoJSON(ST_MakePoint(-98.125870, 29.924625)), '{9016}'),
(387, 518, 'PURGATORY RD (CR 215) - JUST S OF RR 12', 'Hays County', 'description', ST_MakePoint(-98.129829, 29.931902), ST_AsGeoJSON(ST_MakePoint(-98.129829, 29.931902)), '{9016}'),
(388, 519, 'S PLUM CREEK RD (CR 156) - .5 MI W OF COTTON GIN RD (CR 129)', 'Hays County', 'description', ST_MakePoint(-97.798225, 29.960394), ST_AsGeoJSON(ST_MakePoint(-97.798225, 29.960394)), '{9016}'),
(389, 520, 'HEIDENREICH LN (CR 152) - 1 MI N OF RR 150', 'Hays County', 'description', ST_MakePoint(-97.830627, 29.963371), ST_AsGeoJSON(ST_MakePoint(-97.830627, 29.963371)), '{9016}'),
(390, 521, 'CR 158 - 1.5 MI N OF YARRINGTON RD AT CLEAR FORK PLUM CREEK', 'Hays County', 'description', ST_MakePoint(-97.846680, 29.941181), ST_AsGeoJSON(ST_MakePoint(-97.846680, 29.941181)), '{9016}'),
(391, 522, 'BUNTON LN (CR 151) - .75 MI S OF GOFORTH RD', 'City of Kyle', 'description', ST_MakePoint(-97.834679, 29.985933), ST_AsGeoJSON(ST_MakePoint(-97.834679, 29.985933)), '{9016}'),
(392, 523, 'BUNTON LN (CR 151) - 1 MI S OF GOFORTH RD', 'Hays County', 'description', ST_MakePoint(-97.830818, 29.982611), ST_AsGeoJSON(ST_MakePoint(-97.830818, 29.982611)), '{9016}'),
(393, 524, 'BUNTON LN (CR 151) - 1.25 MI S OF GOFORTH RD', 'Hays County', 'description', ST_MakePoint(-97.829376, 29.981382), ST_AsGeoJSON(ST_MakePoint(-97.829376, 29.981382)), '{9016}'),
(394, 525, 'HEIDENREICH LN (CR 152) - JUST W OF BUNTON LN (CR 151)', 'Hays County', 'description', ST_MakePoint(-97.818245, 29.971544), ST_AsGeoJSON(ST_MakePoint(-97.818245, 29.971544)), '{9016}'),
(395, 526, 'DAIRY RD (CR 151) - .25 MI W OF COTTON GIN RD (CR 129)', 'Hays County', 'description', ST_MakePoint(-97.812523, 29.973518), ST_AsGeoJSON(ST_MakePoint(-97.812523, 29.973518)), '{9016}'),
(396, 527, 'COTTON GIN RD (CR 129) - 1 MI E OF GOFORTH RD', 'Hays County', 'description', ST_MakePoint(-97.824341, 29.990545), ST_AsGeoJSON(ST_MakePoint(-97.824341, 29.990545)), '{9016}'),
(397, 528, 'LITTLE ARKANSAS RD (CR 174) - 2.25 MI E OF FULTON RANCH RD (CR 213)', 'Hays County', 'description', ST_MakePoint(-98.022552, 29.984943), ST_AsGeoJSON(ST_MakePoint(-98.022552, 29.984943)), '{9016}'),
(398, 529, 'LITTLE ARKANSAS RD (CR 174) - 2 MI E OF FULTON RANCH RD (CR 213)', 'Hays County', 'description', ST_MakePoint(-98.031418, 29.983168), ST_AsGeoJSON(ST_MakePoint(-98.031418, 29.983168)), '{9016}'),
(399, 530, 'SPOKE HOLLOW RD (CR 314) - .25 MI W OF HIDDEN VALLEY RD (CR 217)', 'Hays County', 'description', ST_MakePoint(-98.069832, 29.983879), ST_AsGeoJSON(ST_MakePoint(-98.069832, 29.983879)), '{9016}'),
(400, 531, 'GREEN ACRES DR (CR 279) - .25 MI N OF WAYSIDE DR (CR 179)', 'Hays County', 'description', ST_MakePoint(-98.111191, 29.991013), ST_AsGeoJSON(ST_MakePoint(-98.111191, 29.991013)), '{9016}'),
(401, 532, 'PINION TRL - 1 MI W OF CARNEY LN (CR 278)', 'Hays County', 'description', ST_MakePoint(-98.125969, 29.998375), ST_AsGeoJSON(ST_MakePoint(-98.125969, 29.998375)), '{9016}'),
(402, 533, 'WAYSIDE DR (CR 179) - .25 MI E OF THOMPSON RANCH RD', 'Hays County', 'description', ST_MakePoint(-98.152466, 29.982210), ST_AsGeoJSON(ST_MakePoint(-98.152466, 29.982210)), '{9016}'),
(403, 534, 'WAYSIDE DR (CR 179) - BETWEEN THOMPSON RANCH RD AND RIDGE OAK DR', 'Hays County', 'description', ST_MakePoint(-98.156998, 29.982187), ST_AsGeoJSON(ST_MakePoint(-98.156998, 29.982187)), '{9016}'),
(404, 535, 'RIDGE OAK DR - .75 MI S OF WAYSIDE DR (CR 179)', 'Hays County', 'description', ST_MakePoint(-98.157166, 29.972404), ST_AsGeoJSON(ST_MakePoint(-98.157166, 29.972404)), '{9016}'),
(405, 536, 'THOMAS OAKS DR - .5 MI W OF RIDGE OAKS DR', 'Hays County', 'description', ST_MakePoint(-98.162575, 29.976562), ST_AsGeoJSON(ST_MakePoint(-98.162575, 29.976562)), '{9016}'),
(406, 537, 'WAYSIDE DR (CR 179) - .5 MI W OF RIDGE OAK DR', 'Hays County', 'description', ST_MakePoint(-98.164848, 29.979439), ST_AsGeoJSON(ST_MakePoint(-98.164848, 29.979439)), '{9016}'),
(407, 538, 'THOMPSON RANCH RD - .20 MI N OF BIG BEND DR', 'Hays County', 'description', ST_MakePoint(-98.150520, 29.995731), ST_AsGeoJSON(ST_MakePoint(-98.150520, 29.995731)), '{9016}'),
(408, 539, 'WAYSIDE DR (CR 179) - AT BLANCO RIVER', 'Hays County', 'description', ST_MakePoint(-98.189484, 29.967382), ST_AsGeoJSON(ST_MakePoint(-98.189484, 29.967382)), '{9016}'),
(409, 540, 'GREEN PASTURES DR - .20 MI W OF LAKELAND DR', 'Hays County', 'description', ST_MakePoint(-97.801247, 30.012817), ST_AsGeoJSON(ST_MakePoint(-97.801247, 30.012817)), '{9016}'),
(410, 541, 'DICKERSON RD - .20 MI W OF LAKELAND DR', 'Hays County', 'description', ST_MakePoint(-97.799591, 30.012138), ST_AsGeoJSON(ST_MakePoint(-97.799591, 30.012138)), '{9016}'),
(411, 542, 'PEACEFUL VALLEY RD - .5 MI W OF GOFORTH RD CR (157)', 'Hays County', 'description', ST_MakePoint(-97.799232, 30.017204), ST_AsGeoJSON(ST_MakePoint(-97.799232, 30.017204)), '{9016}'),
(412, 543, 'GOFORTH RD (CR 157) - .25 MI E OF JANZET DR', 'Hays County', 'description', ST_MakePoint(-97.805763, 30.020409), ST_AsGeoJSON(ST_MakePoint(-97.805763, 30.020409)), '{9016}'),
(413, 544, 'ROHDE RD (CR 126) - .25 MI W OF GRAEF RD (CR 302)', 'Hays County', 'description', ST_MakePoint(-97.769966, 30.013725), ST_AsGeoJSON(ST_MakePoint(-97.769966, 30.013725)), '{9016}'),
(414, 545, 'GOFORTH RD (CR 157) - .25 MI W OF COTTON GIN RD (CR 129)', 'Hays County', 'description', ST_MakePoint(-97.837036, 29.997282), ST_AsGeoJSON(ST_MakePoint(-97.837036, 29.997282)), '{9016}'),
(415, 546, 'DACY LN (CR 205) - .75 MI W OF BEBEE RD (CR 122)', 'Hays County', 'description', ST_MakePoint(-97.845947, 30.010157), ST_AsGeoJSON(ST_MakePoint(-97.845947, 30.010157)), '{9016}'),
(416, 547, 'DACY LN (CR 205) - .75 MI S OF WINDY HILL RD (CR 131)', 'Hays County', 'description', ST_MakePoint(-97.831001, 30.024374), ST_AsGeoJSON(ST_MakePoint(-97.831001, 30.024374)), '{9016}'),
(417, 548, 'ANDREWS XING - BETWEEN DACY LN (CR 205) AND WINDY HILL RD (CR 131)', 'Hays County', 'description', ST_MakePoint(-97.826805, 30.030338), ST_AsGeoJSON(ST_MakePoint(-97.826805, 30.030338)), '{9016}'),
(418, 549, 'WINDY HILL RD (CR 131) - BETWEEN DACY LN (CR 205) AND ANDREWS XING', 'Hays County', 'description', ST_MakePoint(-97.827240, 30.031595), ST_AsGeoJSON(ST_MakePoint(-97.827240, 30.031595)), '{9016}'),
(419, 550, 'KELLY SMITH LN (CR 149) - .75 MI W OF DACY LN (CR 205)', 'Hays County', 'description', ST_MakePoint(-97.840714, 30.040800), ST_AsGeoJSON(ST_MakePoint(-97.840714, 30.040800)), '{9016}'),
(420, 551, 'S TURNERSVILLE RD (CR 212) - .25 MI S OF LANES LN', 'Hays County', 'description', ST_MakePoint(-97.792198, 30.044930), ST_AsGeoJSON(ST_MakePoint(-97.792198, 30.044930)), '{9016}'),
(421, 552, 'SATTERWHITE RD (CR 107) - .25 MI E OF FM 2001', 'Hays County', 'description', ST_MakePoint(-97.798882, 30.060955), ST_AsGeoJSON(ST_MakePoint(-97.798882, 30.060955)), '{9016}'),
(422, 553, 'HILLSIDE TERR - 1 MI W OF FM 2001', 'Hays County', 'description', ST_MakePoint(-97.818481, 30.058546), ST_AsGeoJSON(ST_MakePoint(-97.818481, 30.058546)), '{9016}'),
(423, 554, 'DEER LAKE EST (CR 291/292) - .20 MI S OF DEER LAKE RD (CR 317)', 'Hays County', 'description', ST_MakePoint(-98.044609, 30.028276), ST_AsGeoJSON(ST_MakePoint(-98.044609, 30.028276)), '{9016}'),
(424, 555, 'DEER LAKE CV - .10 MI S OF DEER LAKE RD (CR 317)', 'Hays County', 'description', ST_MakePoint(-98.052879, 30.034592), ST_AsGeoJSON(ST_MakePoint(-98.052879, 30.034592)), '{9016}'),
(425, 556, 'ARROWLAKE RD (CR 304) - .20 MI S OF RR 3237', 'Hays County', 'description', ST_MakePoint(-98.060272, 30.010078), ST_AsGeoJSON(ST_MakePoint(-98.060272, 30.010078)), '{9016}'),
(426, 557, 'JACOBS WELL RD (CR 220) AT CYPRESS CREEK - .25 MI S OF MT SHARP RD (CR 220)', 'Hays County', 'description', ST_MakePoint(-98.121773, 30.030506), ST_AsGeoJSON(ST_MakePoint(-98.121773, 30.030506)), '{9016}'),
(427, 558, 'LEDGEROCK RD (CR 244) - .25 MI N OF VALLEY RIDGE RD', 'Hays County', 'description', ST_MakePoint(-98.166893, 30.056936), ST_AsGeoJSON(ST_MakePoint(-98.166893, 30.056936)), '{9016}'),
(428, 559, 'PUMP STATION RD (CR 218) - 1 MI N OF RR 2325', 'Hays County', 'description', ST_MakePoint(-98.195297, 30.058870), ST_AsGeoJSON(ST_MakePoint(-98.195297, 30.058870)), '{9016}'),
(429, 560, 'VALLEY VIEW RD - .75 MI E OF DAYS END RD', 'Hays County', 'description', ST_MakePoint(-98.222832, 30.036821), ST_AsGeoJSON(ST_MakePoint(-98.222832, 30.036821)), '{9016}'),
(430, 561, 'FISCHER STORE RD (CR 181) - 1.75 MI W OF SACHTLEBEN RD (CR 180)', 'Hays County', 'description', ST_MakePoint(-98.200104, 30.000616), ST_AsGeoJSON(ST_MakePoint(-98.200104, 30.000616)), '{9016}'),
(431, 562, 'COTTONWOOD RD - 2 MI N OF FISCHER STORE RD (CR 181)', 'Hays County', 'description', ST_MakePoint(-98.253761, 30.007923), ST_AsGeoJSON(ST_MakePoint(-98.253761, 30.007923)), '{9016}'),
(432, 563, 'COTTONWOOD RD - 4 MI N OF FISCHER STORE RD (CR 181)', 'Hays County', 'description', ST_MakePoint(-98.234566, 30.023846), ST_AsGeoJSON(ST_MakePoint(-98.234566, 30.023846)), '{9016}'),
(433, 564, 'DAYS END RD - .25 MI N OF HUMMINGBIRD LN', 'Hays County', 'description', ST_MakePoint(-98.232292, 30.034605), ST_AsGeoJSON(ST_MakePoint(-98.232292, 30.034605)), '{9016}'),
(434, 565, 'HORTON PREISS RD AT LITTLE BLANCO RIVER', 'Hays County', 'description', ST_MakePoint(-98.297043, 30.038141), ST_AsGeoJSON(ST_MakePoint(-98.297043, 30.038141)), '{9016}'),
(435, 566, 'MAYBROOK DR - .25 MI W OF N FM 1626', 'Hays County', 'description', ST_MakePoint(-97.879143, 30.104568), ST_AsGeoJSON(ST_MakePoint(-97.879143, 30.104568)), '{9016}'),
(436, 567, 'ARBOR TRL - JUST N OF LIVE OAK LOOP', 'Hays County', 'description', ST_MakePoint(-97.912941, 30.116627), ST_AsGeoJSON(ST_MakePoint(-97.912941, 30.116627)), '{9016}'),
(437, 568, 'YORKS XING - .5 MI W OF  RR 150', 'Hays County', 'description', ST_MakePoint(-98.001205, 30.062155), ST_AsGeoJSON(ST_MakePoint(-98.001205, 30.062155)), '{9016}'),
(438, 569, 'YORK CREEK RD (CR 376) - .25 MI W OF ROLLING OAKS DR (CR 369)', 'Hays County', 'description', ST_MakePoint(-98.023201, 30.070133), ST_AsGeoJSON(ST_MakePoint(-98.023201, 30.070133)), '{9016}'),
(439, 570, 'ELDER HILL RD (CR 170) - .25 MI E OF RR 12', 'Hays County', 'description', ST_MakePoint(-98.087723, 30.110140), ST_AsGeoJSON(ST_MakePoint(-98.087723, 30.110140)), '{9016}'),
(440, 571, 'MT GAINOR RD (CR 220) - .25 MI S OF PURSLEY RD (CR 198)', 'Hays County', 'description', ST_MakePoint(-98.167938, 30.123949), ST_AsGeoJSON(ST_MakePoint(-98.167938, 30.123949)), '{9016}'),
(441, 572, 'LAKESIDE DR (CR 343) - BETWEEN ANGOSTURA LN AND MONTELL RD', 'Hays County', 'description', ST_MakePoint(-98.242462, 30.113726), ST_AsGeoJSON(ST_MakePoint(-98.242462, 30.113726)), '{9016}'),
(442, 573, 'CARPENTER LN - .25 MI S OF BLISS SPILLAR RD (CR 224', 'Hays County', 'description', ST_MakePoint(-97.876160, 30.135738), ST_AsGeoJSON(ST_MakePoint(-97.876160, 30.135738)), '{9016}'),
(443, 574, 'CHAPARRAL RD - .25 MI W OF CARPENTER LN', 'Hays County', 'description', ST_MakePoint(-97.877060, 30.137985), ST_AsGeoJSON(ST_MakePoint(-97.877060, 30.137985)), '{9016}'),
(444, 575, 'CHAPARRAL RD - .25 MI W OF QUAIL RD', 'Hays County', 'description', ST_MakePoint(-97.894333, 30.137409), ST_AsGeoJSON(ST_MakePoint(-97.894333, 30.137409)), '{9016}'),
(445, 576, 'BEAR CREEK PASS (CR 367) AT BEAR CREEK - .5 MI S OF RR 1826', 'Hays County', 'description', ST_MakePoint(-97.944923, 30.160967), ST_AsGeoJSON(ST_MakePoint(-97.944923, 30.160967)), '{9016}'),
(446, 577, 'CRYSTAL HILL DR AT SPRING HOLLOW - JUST S OF RR 1826', 'Hays County', 'description', ST_MakePoint(-97.972115, 30.151791), ST_AsGeoJSON(ST_MakePoint(-97.972115, 30.151791)), '{9016}'),
(447, 578, 'DARDEN HILL RD (CR 162) - 1 MI W OF SAWYER RANCH RD (CR 164)', 'Hays County', 'description', ST_MakePoint(-98.021889, 30.153227), ST_AsGeoJSON(ST_MakePoint(-98.021889, 30.153227)), '{9016}'),
(448, 579, 'DARDEN HILL RD (CR 162) - .40 MI E OF RR 150', 'Hays County', 'description', ST_MakePoint(-98.041893, 30.151417), ST_AsGeoJSON(ST_MakePoint(-98.041893, 30.151417)), '{9016}'),
(449, 580, 'CROSSCREEK DR - JUST W OF E CREEK DR', 'Hays County', 'description', ST_MakePoint(-98.054588, 30.178301), ST_AsGeoJSON(ST_MakePoint(-98.054588, 30.178301)), '{9016}'),
(450, 581, 'CREEK RD (CR 190) - .5 MI E OF MT GAINOR RD (CR 220)', 'Hays County', 'description', ST_MakePoint(-98.115501, 30.187622), ST_AsGeoJSON(ST_MakePoint(-98.115501, 30.187622)), '{9016}'),
(451, 582, 'CREEK RD (CR 190) - JUST W OF MT GAINOR RD (CR 220)', 'Hays County', 'description', ST_MakePoint(-98.123817, 30.187965), ST_AsGeoJSON(ST_MakePoint(-98.123817, 30.187965)), '{9016}'),
(452, 583, 'MT GAINOR RD (CR 220) - 1 MI E OF PURSLEY RD (CR 198)', 'Hays County', 'description', ST_MakePoint(-98.158455, 30.137257), ST_AsGeoJSON(ST_MakePoint(-98.158455, 30.137257)), '{9016}'),
(453, 584, 'MT GAINOR RD (CR 220) AT SOUTH ONION CREEK - .25 MI W OF GATLIN CREEK RD (CR 191', 'Hays County', 'description', ST_MakePoint(-98.140327, 30.143394), ST_AsGeoJSON(ST_MakePoint(-98.140327, 30.143394)), '{9016}'),
(454, 585, 'LOOP 165 (CR 165) - .5 MI E OF THE S ENTRANCE OFF RR 165', 'Hays County', 'description', ST_MakePoint(-98.239594, 30.157591), ST_AsGeoJSON(ST_MakePoint(-98.239594, 30.157591)), '{9016}'),
(455, 586, 'LOOP 165 (CR 165) - 2 MI E OF S ENTRANCE OFF RR 165', 'Hays County', 'description', ST_MakePoint(-98.226524, 30.166075), ST_AsGeoJSON(ST_MakePoint(-98.226524, 30.166075)), '{9016}'),
(456, 587, 'LOOP 165 (CR 165) - .25 MI E OF N ENTRANCE OFF RR 165', 'Hays County', 'description', ST_MakePoint(-98.223969, 30.176220), ST_AsGeoJSON(ST_MakePoint(-98.223969, 30.176220)), '{9016}'),
(457, 588, 'PURSLEY RD (CR 198) -C 1.75 MI N OF MT GAINOR RD (CR 220)', 'Hays County', 'description', ST_MakePoint(-98.175346, 30.146482), ST_AsGeoJSON(ST_MakePoint(-98.175346, 30.146482)), '{9016}'),
(458, 589, 'PURSLEY RD (CR 198) - .5 MI S OF CREEK RD (CR 190)', 'Hays County', 'description', ST_MakePoint(-98.188622, 30.173611), ST_AsGeoJSON(ST_MakePoint(-98.188622, 30.173611)), '{9016}'),
(459, 590, 'PURSLEY RD (CR 198) - .30 MI S OF CREEK RD (CR 190)', 'Hays County', 'description', ST_MakePoint(-98.188667, 30.175333), ST_AsGeoJSON(ST_MakePoint(-98.188667, 30.175333)), '{9016}'),
(460, 591, 'CREEK RD (CR 190) - .75 MI E OF PURSLEY RD (CR 198)', 'Hays County', 'description', ST_MakePoint(-98.181160, 30.181561), ST_AsGeoJSON(ST_MakePoint(-98.181160, 30.181561)), '{9016}'),
(461, 592, 'CANYONWOOD DR - BETWEEN OAKWOOD LN AND ROY CREEK LN', 'Hays County', 'description', ST_MakePoint(-98.035835, 30.213938), ST_AsGeoJSON(ST_MakePoint(-98.035835, 30.213938)), '{9016}'),
(462, 593, 'HIDDEN HILLS DR - BETWEEN COTTONWOOD CREEK DR AND ROY CREEK LN', 'Hays County', 'description', ST_MakePoint(-98.025528, 30.210232), ST_AsGeoJSON(ST_MakePoint(-98.025528, 30.210232)), '{9016}'),
(463, 594, 'OAKWOOD LN - BETWEEN COTTONWOOD CREEK DR AND WEST CREEK DR', 'Hays County', 'description', ST_MakePoint(-98.026657, 30.213724), ST_AsGeoJSON(ST_MakePoint(-98.026657, 30.213724)), '{9016}'),
(464, 595, 'BLUE HILLS DR - BETWEEN WEST CREEK DR AND COTTONWOOD CREEK DR', 'Hays County', 'description', ST_MakePoint(-98.028870, 30.219912), ST_AsGeoJSON(ST_MakePoint(-98.028870, 30.219912)), '{9016}'),
(465, 596, 'FITZHUGH RD (CR 101) - 1.2 MI E OF TRAUTWEIN RD (CR 185) RIGHT AT COUNTY LINE', 'Hays County', 'description', ST_MakePoint(-98.011147, 30.242491), ST_AsGeoJSON(ST_MakePoint(-98.011147, 30.242491)), '{9016}'),
(466, 597, 'TRAUTWEIN RD (CR 185) AT BARTON CREEK', 'Hays County', 'description', ST_MakePoint(-98.024834, 30.236509), ST_AsGeoJSON(ST_MakePoint(-98.024834, 30.236509)), '{9016}'),
(467, 598, 'BELL SPRING RD (CR 169) - 2 MI S OF FITZHUGH RD (CR 101)', 'Hays County', 'description', ST_MakePoint(-98.124870, 30.234697), ST_AsGeoJSON(ST_MakePoint(-98.124870, 30.234697)), '{9016}'),
(468, 599, 'BELL SPRINGS RD (CR 169) - 1 MI S OF FITZHUGH RD (CR 101)', 'Hays County', 'description', ST_MakePoint(-98.122566, 30.244528), ST_AsGeoJSON(ST_MakePoint(-98.122566, 30.244528)), '{9016}'),
(469, 600, 'MCGREGOR LN (CR 187) -  2 MI N OF US 290', 'Hays County', 'description', ST_MakePoint(-98.154556, 30.226864), ST_AsGeoJSON(ST_MakePoint(-98.154556, 30.226864)), '{9016}'),
(470, 601, 'WINDYS HILL RD -  .25 MI S OF GLENN CV', 'Hays County', 'description', ST_MakePoint(-98.201553, 30.222597), ST_AsGeoJSON(ST_MakePoint(-98.201553, 30.222597)), '{9016}'),
(471, 602, 'LOST VALLEY RD -  .5 MI N OF EASY ST', 'Hays County', 'description', ST_MakePoint(-98.205681, 30.245077), ST_AsGeoJSON(ST_MakePoint(-98.205681, 30.245077)), '{9016}'),
(472, 603, 'FITZHUGH RD (CR 101) - .5 MI E OF TED BURGER RD', 'Hays County', 'description', ST_MakePoint(-98.082695, 30.254898), ST_AsGeoJSON(ST_MakePoint(-98.082695, 30.254898)), '{9016}'),
(473, 604, 'SYCAMORE CREEK DR - JUST W OF TWIN CREEK RD', 'Hays County', 'description', ST_MakePoint(-98.199638, 30.261024), ST_AsGeoJSON(ST_MakePoint(-98.199638, 30.261024)), '{9016}'),
(474, 605, 'MYERS CREEK RD - 1.5 MI N OF BELL SPRINGS RD (CR 169)', 'Hays County', 'description', ST_MakePoint(-98.134094, 30.283445), ST_AsGeoJSON(ST_MakePoint(-98.134094, 30.283445)), '{9016}'),
(475, 606, 'POSEY RD (CR 235) - JUST E OF FM 2439 (HUNTER RD)', 'Hays County', 'description', ST_MakePoint(-98.004517, 29.823009), ST_AsGeoJSON(ST_MakePoint(-98.004517, 29.823009)), '{9016}'),
(476, 607, 'POSEY RD (CR 235) - JUST W OF IH 35', 'Hays County', 'description', ST_MakePoint(-97.998688, 29.818159), ST_AsGeoJSON(ST_MakePoint(-97.998688, 29.818159)), '{9016}'),
(477, 608, 'POSEY RD (CR 235) - E OF IH 35', 'Hays County', 'description', ST_MakePoint(-97.995407, 29.815346), ST_AsGeoJSON(ST_MakePoint(-97.995407, 29.815346)), '{9016}'),
(478, 609, 'RIVER RD (CITY OF SM) - .5 MI E OF SH 80', 'Hays County', 'description', ST_MakePoint(-97.906982, 29.885052), ST_AsGeoJSON(ST_MakePoint(-97.906982, 29.885052)), '{9016}'),
(479, 610, 'POST RD (CR 140) .20 MI S OF YARRINGTON RD (CR 159)', 'Hays County', 'description', ST_MakePoint(-97.885979, 29.948603), ST_AsGeoJSON(ST_MakePoint(-97.885979, 29.948603)), '{9016}'),
(480, 611, 'S LOOP 4 (BUDA) - .20 MI S OF W GOFORTH RD (CR 228)', 'Hays County', 'description', ST_MakePoint(-97.844780, 30.074629), ST_AsGeoJSON(ST_MakePoint(-97.844780, 30.074629)), '{9016}'),
(481, 612, 'FM 2770 (BUDA) - BETWEEN S AUSTIN ST AND BLUFF ST (BUDA)', 'Hays County', 'description', ST_MakePoint(-97.845909, 30.079020), ST_AsGeoJSON(ST_MakePoint(-97.845909, 30.079020)), '{9016}'),
(482, 613, 'SCHUBERT LN - JUST E OF NIEDERWALD STRASSE', 'Hays County', 'description', ST_MakePoint(-97.733757, 30.014273), ST_AsGeoJSON(ST_MakePoint(-97.733757, 30.014273)), '{9016}'),
(483, 614, 'COLE SPRINGS RD (CR 148) - 1 1/2 MI E OF FM 2770', 'Hays County', 'description', ST_MakePoint(-97.851006, 30.081158), ST_AsGeoJSON(ST_MakePoint(-97.851006, 30.081158)), '{9016}'),
(484, 615, 'MATHIAS LN (CR 123) - .25 MI E OF WINDY HILL RD (CR 131)', 'Hays County', 'description', ST_MakePoint(-97.801361, 30.033113), ST_AsGeoJSON(ST_MakePoint(-97.801361, 30.033113)), '{9016}'),
(485, 616, 'MATHIAS LN (CR 123) - .75 MI E OF WINDY HILL RD (CR131)', 'Hays County', 'description', ST_MakePoint(-97.796097, 30.028946), ST_AsGeoJSON(ST_MakePoint(-97.796097, 30.028946)), '{9016}'),
(486, 617, 'CEMENT PLANT RD (CR 132) - .5 MI E OF LOOP 4 (BUDA)', 'Hays County', 'description', ST_MakePoint(-97.836624, 30.057915), ST_AsGeoJSON(ST_MakePoint(-97.836624, 30.057915)), '{9016}'),
(487, 618, 'HIDDEN VALLEY RD (CR 217) - .25 MI E OF SPOKE HOLLOW RD (CR 314)', 'Hays County', 'description', ST_MakePoint(-98.062141, 29.982872), ST_AsGeoJSON(ST_MakePoint(-98.062141, 29.982872)), '{9016}'),
(488, 619, 'PLEASANT VALLEY RD (WOODCREEK) - BETWEEN LITTLE BEND CT AND WOODACRE DR', 'Hays County', 'description', ST_MakePoint(-98.130600, 30.033110), ST_AsGeoJSON(ST_MakePoint(-98.130600, 30.033110)), '{9016}'),
(489, 620, 'PLEASANT VALLEY RD (WOODCREEK) - BETWEEN VALLEY SPRING RD AND QUIET MEADOW CIR', 'Hays County', 'description', ST_MakePoint(-98.133194, 30.032286), ST_AsGeoJSON(ST_MakePoint(-98.133194, 30.032286)), '{9016}'),
(490, 621, 'VALLEY SPRING RD (WOODCREEK) - BETWEEN GREEN GLADE CT AND TRINKET CT', 'Hays County', 'description', ST_MakePoint(-98.134087, 30.034092), ST_AsGeoJSON(ST_MakePoint(-98.134087, 30.034092)), '{9016}'),
(491, 622, 'WOODACRE DR (WOODCREEK) - BETWEEN ACACIA DR AND CYPRESS FAIRWAY VLG', 'Hays County', 'description', ST_MakePoint(-98.129036, 30.034554), ST_AsGeoJSON(ST_MakePoint(-98.129036, 30.034554)), '{9016}'),
(492, 623, 'FRANCIS HARRIS LN (CR 265) - .25 MI S OF OLD BASTROP HWY (CR 266)', 'Hays County', 'description', ST_MakePoint(-97.994667, 29.798210), ST_AsGeoJSON(ST_MakePoint(-97.994667, 29.798210)), '{9016}'),
(493, 624, 'NUTTY BROWN RD (CR 163) - JUST N OF WILDWOOD HILLS LN', 'Hays County', 'description', ST_MakePoint(-97.963860, 30.175901), ST_AsGeoJSON(ST_MakePoint(-97.963860, 30.175901)), '{9016}'),
(494, 625, 'E MCCARTY LN (CR 233) - .5 MI E OF IH 35', 'Hays County', 'description', ST_MakePoint(-97.965286, 29.833900), ST_AsGeoJSON(ST_MakePoint(-97.965286, 29.833900)), '{9016}'),
(495, 626, 'N OLD BASTROP HWY (CR 266) - .20 MI S OF AIRPORT HWY 21 (SH 21)', 'Hays County', 'description', ST_MakePoint(-97.894524, 29.881516), ST_AsGeoJSON(ST_MakePoint(-97.894524, 29.881516)), '{9016}'),
(496, 627, 'LIME KILN RD (SAN MARCOS) - .25 MI W OF POST RD (CR 140)', 'Hays County', 'description', ST_MakePoint(-97.925949, 29.899267), ST_AsGeoJSON(ST_MakePoint(-97.925949, 29.899267)), '{9016}'),
(497, 628, 'RR 1826 - 1 MI E OF RR 150', 'Hays County', 'description', ST_MakePoint(-98.016365, 30.131485), ST_AsGeoJSON(ST_MakePoint(-98.016365, 30.131485)), '{9016}'),
(498, 629, 'LITTLE ARKANSAS RD (CR 174) - AT BLANCO RIVER', 'Hays County', 'description', ST_MakePoint(-98.052963, 29.984037), ST_AsGeoJSON(ST_MakePoint(-98.052963, 29.984037)), '{9016}'),
(499, 630, 'Hidden Valley Rd @ Low Water Crossing', 'Hays County', 'description', ST_MakePoint(-98.065285, 29.985580), ST_AsGeoJSON(ST_MakePoint(-98.065285, 29.985580)), '{9016}'),
(500, 633, 'CR 1492 AT BLANCO RIVER AND RIVER ROAD (CR 178)', 'Hays County', 'description', ST_MakePoint(-98.109413, 29.984812), ST_AsGeoJSON(ST_MakePoint(-98.109413, 29.984812)), '{9016}'),
(501, 634, 'RR 967 - JUST N OF HALEYS WAY DR (BUDA)', 'Hays County', 'description', ST_MakePoint(-97.848320, 30.099525), ST_AsGeoJSON(ST_MakePoint(-97.848320, 30.099525)), '{9016}'),
(502, 635, 'N MADRONE TR (BEAR CREEK) - .5 MI W OF CEDAR CV', 'Hays County', 'description', ST_MakePoint(-97.938202, 30.185980), ST_AsGeoJSON(ST_MakePoint(-97.938202, 30.185980)), '{9016}'),
(503, 636, 'BELL SPRINGS RD (CR 169) - JUST N OF US 290', 'Hays County', 'description', ST_MakePoint(-98.118294, 30.204742), ST_AsGeoJSON(ST_MakePoint(-98.118294, 30.204742)), '{9016}'),
(504, 637, 'W FITZHUGH RD (CR 101) - BETWEEN BOTH LEGS OF BELL SPRINGS RD (CR 169) 1 MI E OF', 'Hays County', 'description', ST_MakePoint(-98.131348, 30.255873), ST_AsGeoJSON(ST_MakePoint(-98.131348, 30.255873)), '{9016}'),
(505, 638, 'CREEK RD (CR 190) - .10 MI E OF PURSLEY RD (CR 198)', 'Hays County', 'description', ST_MakePoint(-98.190826, 30.178694), ST_AsGeoJSON(ST_MakePoint(-98.190826, 30.178694)), '{9016}'),
(506, 639, 'N BURLESON ST (KYLE) - W OF IH 35', 'City of Kyle', 'description', ST_MakePoint(-97.866997, 30.003784), ST_AsGeoJSON(ST_MakePoint(-97.866997, 30.003784)), '{9016}'),
(507, 640, 'E RR 150 - BETWEEN IH 35 AND LEHMAN RD (CR 204)', 'Hays County', 'description', ST_MakePoint(-97.870132, 29.981874), ST_AsGeoJSON(ST_MakePoint(-97.870132, 29.981874)), '{9016}'),
(508, 642, 'CENTERPOINT RD (CR 234) - 1 MI E OF IH 35', 'Hays County', 'description', ST_MakePoint(-97.973999, 29.818613), ST_AsGeoJSON(ST_MakePoint(-97.973999, 29.818613)), '{9016}'),
(509, 643, 'W VALLEY SPRING RD (WOODCREEK N) - BETWEEN RAVINE TRL AND BASSWOOD CIR', 'Hays County', 'description', ST_MakePoint(-98.148209, 30.043716), ST_AsGeoJSON(ST_MakePoint(-98.148209, 30.043716)), '{9016}'),
(510, 644, 'YARRINGTON RD (CR 159) - 0.75 MILE EAST OF IH 35', 'Hays County', 'description', ST_MakePoint(-97.877205, 29.939224), ST_AsGeoJSON(ST_MakePoint(-97.877205, 29.939224)), '{9016}'),
(511, 645, 'YARRINGTON RD (CR 159) - JUST W OF CR 158 INTERSECTION', 'Hays County', 'description', ST_MakePoint(-97.862473, 29.927027), ST_AsGeoJSON(ST_MakePoint(-97.862473, 29.927027)), '{9016}'),
(512, 646, 'HILLIARD RD (CR 222) - JUST E OF VALLEY VIEW WEST DR', 'Hays County', 'description', ST_MakePoint(-97.960548, 29.948168), ST_AsGeoJSON(ST_MakePoint(-97.960548, 29.948168)), '{9016}'),
(513, 647, 'YARRINGTON RD (CR 159) - JUST W OF HARRIS HILL RD (CR 160)', 'Hays County', 'description', ST_MakePoint(-97.865562, 29.929462), ST_AsGeoJSON(ST_MakePoint(-97.865562, 29.929462)), '{9016}'),
(514, 648, 'CLIMBING WAY - BETWEEN BLANCO DR AND BRINKLEY DR', 'Hays County', 'description', ST_MakePoint(-98.081856, 29.985308), ST_AsGeoJSON(ST_MakePoint(-98.081856, 29.985308)), '{9016}'),
(515, 649, 'FM 150 @ DRUE LN', 'Hays County', 'description', ST_MakePoint(-97.837860, 29.952993), ST_AsGeoJSON(ST_MakePoint(-97.837860, 29.952993)), '{9016}'),
(516, 650, 'MT SHARP RD BETWEEN LEDGEROCK AND MT OLIVE SCHOOL RD', 'Hays County', 'description', ST_MakePoint(-98.159424, 30.074924), ST_AsGeoJSON(ST_MakePoint(-98.159424, 30.074924)), '{9016}'),
(517, 651, 'MT SHARP RD @ JACOBS WELL RD', 'Hays County', 'description', ST_MakePoint(-98.122124, 30.034140), ST_AsGeoJSON(ST_MakePoint(-98.122124, 30.034140)), '{9016}'),
(518, 652, 'TWIN OAKS TRL JUST S OF MARTIN RD', 'Hays County', 'description', ST_MakePoint(-98.164856, 30.226315), ST_AsGeoJSON(ST_MakePoint(-98.164856, 30.226315)), '{9016}'),
(519, 653, 'E MT GAINOR RD 2 MI W OF RR 12', 'Hays County', 'description', ST_MakePoint(-98.121033, 30.146551), ST_AsGeoJSON(ST_MakePoint(-98.121033, 30.146551)), '{9016}'),
(520, 654, 'COVERED BRIDGE DR .2 MI S OF RANCHERS CLUB LN', 'Hays County', 'description', ST_MakePoint(-98.045303, 30.088882), ST_AsGeoJSON(ST_MakePoint(-98.045303, 30.088882)), '{9016}'),
(521, 655, 'ELM CREEK RD .2 MI W OF COTTONWOOD RD', 'Hays County', 'description', ST_MakePoint(-98.248688, 30.016211), ST_AsGeoJSON(ST_MakePoint(-98.248688, 30.016211)), '{9016}'),
(522, 656, 'OLD OAKS RANCH RD .25 MI W OF BRUNSON LN', 'Hays County', 'description', ST_MakePoint(-98.081787, 30.058887), ST_AsGeoJSON(ST_MakePoint(-98.081787, 30.058887)), '{9016}'),
(523, 657, 'STEPPING STONE XING .1 MI N OF WOLF CREEK PASS', 'Hays County', 'description', ST_MakePoint(-98.044113, 30.060617), ST_AsGeoJSON(ST_MakePoint(-98.044113, 30.060617)), '{9016}'),
(524, 658, 'G W Haschke Ln .8 MI S OF Fischer Store Rd ', 'Hays County', 'description', ST_MakePoint(-98.199738, 29.990133), ST_AsGeoJSON(ST_MakePoint(-98.199738, 29.990133)), '{9016}'),
(525, 659, 'Winn Valley Dr @ CR 1492', 'Hays County', 'description', ST_MakePoint(-98.102959, 29.969860), ST_AsGeoJSON(ST_MakePoint(-98.102959, 29.969860)), '{9016}'),
(526, 660, 'Commanche Waters .1 MI S OF Deer Lake Rd', 'Hays County', 'description', ST_MakePoint(-98.055359, 30.034817), ST_AsGeoJSON(ST_MakePoint(-98.055359, 30.034817)), '{9016}'),
(527, 661, 'Rancho Grande Dr .2 MI W OF FM 3237', 'Hays County', 'description', ST_MakePoint(-98.047096, 30.016235), ST_AsGeoJSON(ST_MakePoint(-98.047096, 30.016235)), '{9016}'),
(528, 662, 'CR 1492 1 MI West OF Winn Wood Rd', 'Hays County', 'description', ST_MakePoint(-98.097107, 29.976194), ST_AsGeoJSON(ST_MakePoint(-98.097107, 29.976194)), '{9016}'),
(529, 663, 'W RR 150 @ Onion Creek (Double Crossings)', 'Hays County', 'description', ST_MakePoint(-98.008339, 30.083231), ST_AsGeoJSON(ST_MakePoint(-98.008339, 30.083231)), '{9016}'),
(530, 664, 'W RR 150 @ Onion Creek (Double Crossings)', 'Hays County', 'description', ST_MakePoint(-98.013268, 30.084974), ST_AsGeoJSON(ST_MakePoint(-98.013268, 30.084974)), '{9016}'),
(531, 665, 'York Creek RD Near Soechting RD', 'Hays County', 'description', ST_MakePoint(-98.004822, 29.774179), ST_AsGeoJSON(ST_MakePoint(-98.004822, 29.774179)), '{9016}'),
(532, 666, 'Loyola at 183', 'APD Reports Flooding', 'description', ST_MakePoint(-97.661308, 30.302710), ST_AsGeoJSON(ST_MakePoint(-97.661308, 30.302710)), '{9009}'),
(533, 667, '3700-4500 block of Manor Rd.', 'APD Reports Flooding', 'description', ST_MakePoint(-97.693581, 30.289951), ST_AsGeoJSON(ST_MakePoint(-97.693581, 30.289951)), '{9009}'),
(534, 668, '2600 Blk Commerce St', 'Commerce St & Trade St', 'description', ST_MakePoint(-98.268570, 30.597076), ST_AsGeoJSON(ST_MakePoint(-98.268570, 30.597076)), '{9006}'),
(535, 669, '1124 Rutland Drive', '1124 Rutland Drive', 'description', ST_MakePoint(-97.703384, 30.369398), ST_AsGeoJSON(ST_MakePoint(-97.703384, 30.369398)), '{9009}'),
(536, 670, '900 Blk Colorado St', 'Colorado St &amp; S Ave J, Marble Falls, TX', 'description', ST_MakePoint(-98.283218, 30.565212), ST_AsGeoJSON(ST_MakePoint(-98.283218, 30.565212)), '{9006}'),
(537, 671, 'W 9th St and N Lamar Blvd', 'W 9th St and N Lamar Blvd, Austin, TX', 'description', ST_MakePoint(-97.752777, 30.273918), ST_AsGeoJSON(ST_MakePoint(-97.752777, 30.273918)), '{9009}'),
(538, 672, '805 Payton Gin Rd', '805 Payton Gin Rd', 'description', ST_MakePoint(-97.701157, 30.358139), ST_AsGeoJSON(ST_MakePoint(-97.701157, 30.358139)), '{9009}'),
(539, 673, 'Mopac at Steck', '7500 N Mopac Expy', 'description', ST_MakePoint(-97.742874, 30.367212), ST_AsGeoJSON(ST_MakePoint(-97.742874, 30.367212)), '{9009}'),
(540, 674, '6600 Silvermine Drive', '6600 Silvermine Drive, Austin, TX', 'description', ST_MakePoint(-97.888397, 30.247019), ST_AsGeoJSON(ST_MakePoint(-97.888397, 30.247019)), '{9009}'),
(541, 675, '3400 Fritz Hughes Park Rd @ Hummingbird Ln', 'Travis County, TX', 'description', ST_MakePoint(-97.912277, 30.382242), ST_AsGeoJSON(ST_MakePoint(-97.912277, 30.382242)), '{9010}'),
(542, 676, '100 Blk Ave L', 'Between 1st St & 2nd St', 'description', ST_MakePoint(-98.282089, 30.572124), ST_AsGeoJSON(ST_MakePoint(-98.282089, 30.572124)), '{9006}'),
(543, 677, '3700 Blk Mormon Mill Rd', 'Mormon Mill Rd & Cedar Ridge Rd', 'description', ST_MakePoint(-98.251900, 30.601788), ST_AsGeoJSON(ST_MakePoint(-98.251900, 30.601788)), '{9006}'),
(544, 679, 'Bluebonnet Dr & Lantana Dr', 'Bluebonnet Dr & Lantana Dr', 'description', ST_MakePoint(-98.274773, 30.588169), ST_AsGeoJSON(ST_MakePoint(-98.274773, 30.588169)), '{9006}'),
(545, 680, 'Westgate Blvd @ Williamson Creek', '5407 West Gate Blvd, Austin, TX', 'description', ST_MakePoint(-97.804886, 30.221277), ST_AsGeoJSON(ST_MakePoint(-97.804886, 30.221277)), '{9009}'),
(546, 681, '281 & 2nd St', 'Hwy 281 & 2nd St, Marble Falls, TX', 'description', ST_MakePoint(-98.276291, 30.570263), ST_AsGeoJSON(ST_MakePoint(-98.276291, 30.570263)), '{9006}'),
(547, 682, 'Old San Antonio Rd @ I-35', '9900 S IH 35 Frontage Rd, Austin, TX', 'description', ST_MakePoint(-97.792610, 30.154083), ST_AsGeoJSON(ST_MakePoint(-97.792610, 30.154083)), '{9009}'),
(548, 689, '4500 Steiner Ranch Blvd', 'Travis County,TX', 'description', ST_MakePoint(-97.879669, 30.383169), ST_AsGeoJSON(ST_MakePoint(-97.879669, 30.383169)), '{9010}'),
(549, 692, 'Manchaca Rd &amp; Jones Rd', 'Manchaca Rd &amp; Jones Rd Austin, TX 78745 ', 'description', ST_MakePoint(-97.794067, 30.220797), ST_AsGeoJSON(ST_MakePoint(-97.794067, 30.220797)), '{9009}'),
(550, 693, '11900 Brodie Lane', '11900 Brodie Lane, Austin, TX', 'description', ST_MakePoint(-97.859795, 30.169113), ST_AsGeoJSON(ST_MakePoint(-97.859795, 30.169113)), '{9009}'),
(551, 694, 'CR 272', 'CR 272 @ San Gabriel River', 'description', ST_MakePoint(0.000000, 0.000000), ST_AsGeoJSON(ST_MakePoint(0.000000, 0.000000)), '{9017}'),
(552, 695, 'Frate Barker and Brodie', 'Frate Barker and Brodie Lane, Austin, TX', 'description', ST_MakePoint(-97.854881, 30.148464), ST_AsGeoJSON(ST_MakePoint(-97.854881, 30.148464)), '{9009}'),
(553, 698, '9100 W State Highway 71', '9100 W State Highway 71, Austin, TX 78736', 'description', ST_MakePoint(-97.904610, 30.257412), ST_AsGeoJSON(ST_MakePoint(-97.904610, 30.257412)), '{9009}'),
(554, 699, 'Pedernales Canyon Trail LWC', 'Pedernales Canyon Trail &amp; Canyon Ranch Trail S', 'description', ST_MakePoint(-98.086914, 30.369465), ST_AsGeoJSON(ST_MakePoint(-98.086914, 30.369465)), '{9009}'),
(555, 700, 'Convict Hill and Brush Country (near Mopac underpass)', 'Convict Hill Rd and Brush Country, Austin, TX', 'description', ST_MakePoint(-97.845901, 30.216908), ST_AsGeoJSON(ST_MakePoint(-97.845901, 30.216908)), '{9009}'),
(556, 702, '3700 Wyldwood Road', '3700 Wyldwood Road, Austin TX', 'description', ST_MakePoint(-97.858040, 30.175661), ST_AsGeoJSON(ST_MakePoint(-97.858040, 30.175661)), '{9009}'),
(557, 706, 'Borchert Loop', '29.8694083,-97.73108611111111', 'description', ST_MakePoint(-97.731071, 29.869385), ST_AsGeoJSON(ST_MakePoint(-97.731071, 29.869385)), '{9011}'),
(558, 707, 'Black Ankle', '29.8607278,-97.74115277777778', 'description', ST_MakePoint(-97.743263, 29.859383), ST_AsGeoJSON(ST_MakePoint(-97.743263, 29.859383)), '{9011}'),
(559, 708, 'Black Ankle ', '29.8479472,-97.743933333333333', 'description', ST_MakePoint(-97.750496, 29.852467), ST_AsGeoJSON(ST_MakePoint(-97.750496, 29.852467)), '{9011}'),
(560, 709, 'Old Kelly Road', '29.8820083,-97.63033055555555', 'description', ST_MakePoint(-97.630348, 29.882029), ST_AsGeoJSON(ST_MakePoint(-97.630348, 29.882029)), '{9011}'),
(561, 710, 'Cattlemans Row', '29.8566417,-97.58190833333333', 'description', ST_MakePoint(-97.578911, 29.855028), ST_AsGeoJSON(ST_MakePoint(-97.578911, 29.855028)), '{9011}'),
(562, 711, '6900 Pleasant Valley, Austin, TX', '6900 Pleasant Valley, Austin, TX', 'description', ST_MakePoint(-97.749519, 30.176132), ST_AsGeoJSON(ST_MakePoint(-97.749519, 30.176132)), '{9009}'),
(563, 714, 'Railroad Street', 'Railroad Street, Maxwell TX', 'description', ST_MakePoint(-97.788902, 29.879816), ST_AsGeoJSON(ST_MakePoint(-97.788902, 29.879816)), '{9011}'),
(564, 715, 'Von Quintus Rd @ Sunflower Rd', 'Travis County, TX', 'description', ST_MakePoint(-97.676826, 30.104755), ST_AsGeoJSON(ST_MakePoint(-97.676826, 30.104755)), '{9010}'),
(565, 716, 'Barton Springs Road', '2000 W Barton Springs Road ', 'description', ST_MakePoint(-97.764992, 30.264969), ST_AsGeoJSON(ST_MakePoint(-97.764992, 30.264969)), '{9002}'),
(566, 717, 'Wells School Rd @ Wells Ln', 'Travis County, TX', 'description', ST_MakePoint(-97.453362, 30.392813), ST_AsGeoJSON(ST_MakePoint(-97.453362, 30.392813)), '{9010}'),
(567, 718, 'CR 473 South of CR 112', 'CR 473 South of CR 112', 'description', ST_MakePoint(-97.247803, 30.518572), ST_AsGeoJSON(ST_MakePoint(-97.247803, 30.518572)), '{9017}'),
(568, 719, 'Patricia @ Deer Draw', 'Patricia @ Deer Draw', 'description', ST_MakePoint(-97.766129, 30.588125), ST_AsGeoJSON(ST_MakePoint(-97.766129, 30.588125)), '{9017}'),
(569, 721, 'Southeast River Road', '4100 Bk of Southeast River Road Martindale TX', 'description', ST_MakePoint(-97.821182, 29.822613), ST_AsGeoJSON(ST_MakePoint(-97.821182, 29.822613)), '{9011}'),
(570, 722, 'County Line Road', '1000 Bk County Line Road, Dale TX', 'description', ST_MakePoint(-97.600433, 30.016884), ST_AsGeoJSON(ST_MakePoint(-97.600433, 30.016884)), '{9011}'),
(571, 723, 'Long Road', '700 Bk Long Road, Lockhart, TX', 'description', ST_MakePoint(-97.740051, 29.829351), ST_AsGeoJSON(ST_MakePoint(-97.740051, 29.829351)), '{9011}'),
(572, 724, 'Oak Grove Road', '400 Bk Oak Grove Road, Luling, TX', 'description', ST_MakePoint(-97.649612, 29.756502), ST_AsGeoJSON(ST_MakePoint(-97.649612, 29.756502)), '{9011}'),
(573, 725, 'Salt Flat ', 'Salt Flat Road, Luling, TX', 'description', ST_MakePoint(-97.600983, 29.756298), ST_AsGeoJSON(ST_MakePoint(-97.600983, 29.756298)), '{9011}'),
(574, 726, 'Salt Flat Road', '4000 Bk Salt Flat Road, Luling, TX', 'description', ST_MakePoint(-97.616135, 29.723900), ST_AsGeoJSON(ST_MakePoint(-97.616135, 29.723900)), '{9011}'),
(575, 727, 'Misty Lane', 'Misty Lane, Maxwell TX', 'description', ST_MakePoint(-97.765717, 29.900843), ST_AsGeoJSON(ST_MakePoint(-97.765717, 29.900843)), '{9011}'),
(576, 729, 'Jolley Road', '1800 Bk Jolly Road, Lockhart, TX', 'description', ST_MakePoint(-97.758484, 29.897476), ST_AsGeoJSON(ST_MakePoint(-97.758484, 29.897476)), '{9011}'),
(577, 730, 'Polonia Road', '1000 Bk Polonia Road, Lockhart, TX', 'description', ST_MakePoint(-97.725182, 29.937742), ST_AsGeoJSON(ST_MakePoint(-97.725182, 29.937742)), '{9011}'),
(578, 731, 'Plant Road', '1200 Bk Plant Road, Luling, TX', 'description', ST_MakePoint(-97.722290, 29.740314), ST_AsGeoJSON(ST_MakePoint(-97.722290, 29.740314)), '{9011}'),
(579, 732, 'Plant Road', 'Plant Road, Kingsbury, TX', 'description', ST_MakePoint(-97.753273, 29.716928), ST_AsGeoJSON(ST_MakePoint(-97.753273, 29.716928)), '{9011}'),
(580, 733, 'Holz Road', '2300 Bk Holtz Road, Lockhart, TX', 'description', ST_MakePoint(-97.727432, 29.969942), ST_AsGeoJSON(ST_MakePoint(-97.727432, 29.969942)), '{9011}'),
(581, 734, 'Tomahawk Trail', '1500 Bk Tomahawk Trail, Dale TX', 'description', ST_MakePoint(-97.644073, 30.034851), ST_AsGeoJSON(ST_MakePoint(-97.644073, 30.034851)), '{9011}'),
(582, 735, 'Tomahawk Trail', 'Off Hwy 1854', 'description', ST_MakePoint(-97.658257, 30.021996), ST_AsGeoJSON(ST_MakePoint(-97.658257, 30.021996)), '{9011}'),
(583, 736, 'Crooked Road', 'Off County Line Rd', 'description', ST_MakePoint(-97.577446, 30.002169), ST_AsGeoJSON(ST_MakePoint(-97.577446, 30.002169)), '{9011}'),
(584, 739, 'Pettytown Road', '500 Bk Pettytown Road, Lockhart, TX Caldwell Count', 'description', ST_MakePoint(-97.546074, 29.903242), ST_AsGeoJSON(ST_MakePoint(-97.546074, 29.903242)), '{9011}'),
(585, 740, 'Pettytown Road', '800 Bk Pettytown Road, Caldwell County', 'description', ST_MakePoint(-97.461082, 29.906052), ST_AsGeoJSON(ST_MakePoint(-97.461082, 29.906052)), '{9011}'),
(586, 741, 'Pettytown Road', '2200 Bk Pettytown Road, Dale - Caldwell County', 'description', ST_MakePoint(-97.534790, 29.891262), ST_AsGeoJSON(ST_MakePoint(-97.534790, 29.891262)), '{9011}'),
(587, 744, 'Rocky Road', '1500 Bk Rocky Road, Caldwell County', 'description', ST_MakePoint(-97.749817, 29.960852), ST_AsGeoJSON(ST_MakePoint(-97.749817, 29.960852)), '{9011}'),
(588, 745, 'Creekside Drive', 'Creekside Drive, Caldwell County', 'description', ST_MakePoint(-97.576118, 29.776285), ST_AsGeoJSON(ST_MakePoint(-97.576118, 29.776285)), '{9011}'),
(589, 746, 'Soda Springs Road', 'Soda Springs Road, Caldwell County', 'description', ST_MakePoint(-97.613235, 29.718494), ST_AsGeoJSON(ST_MakePoint(-97.613235, 29.718494)), '{9011}'),
(590, 747, 'P1001 - Johnson Rd just off 1209', 'Johnson Rd just off 1209', 'description', ST_MakePoint(-97.429787, 30.135370), ST_AsGeoJSON(ST_MakePoint(-97.429787, 30.135370)), '{9012}'),
(591, 748, 'P1002 - E Riverside Dr/Tahitian Dr', 'E Riverside Dr/Tahitian Dr', 'description', ST_MakePoint(-97.283447, 30.072571), ST_AsGeoJSON(ST_MakePoint(-97.283447, 30.072571)), '{9012}'),
(592, 749, 'P1003 - Riverwood Dr ', 'Riverwood Dr @ low water crossing COB1001', 'description', ST_MakePoint(-97.329033, 30.120420), ST_AsGeoJSON(ST_MakePoint(-97.329033, 30.120420)), '{9012}'),
(593, 750, 'P1004 - Green Valley Dr', 'Green Valley Dr @ low water crossing', 'description', ST_MakePoint(-97.293823, 30.177050), ST_AsGeoJSON(ST_MakePoint(-97.293823, 30.177050)), '{9012}'),
(594, 751, 'P1005 - 712 Shilo Road .2 West of N Gaines', '712 Shilo Road .2 West of N Gaines', 'description', ST_MakePoint(-97.403717, 30.097076), ST_AsGeoJSON(ST_MakePoint(-97.403717, 30.097076)), '{9012}'),
(595, 752, 'P1006 - Lovers Ln', '1275 Lovers Ln', 'description', ST_MakePoint(-97.327667, 30.091990), ST_AsGeoJSON(ST_MakePoint(-97.327667, 30.091990)), '{9012}'),
(596, 753, 'P1007 - Keanahalululu Ln/ Haiimaile', 'Keanahalululu Ln/ Haiimaile', 'description', ST_MakePoint(-97.326958, 30.091640), ST_AsGeoJSON(ST_MakePoint(-97.326958, 30.091640)), '{9012}'),
(597, 754, 'P1008 - Woodlands Dr', 'Woodlands Dr', 'description', ST_MakePoint(-97.402878, 30.118040), ST_AsGeoJSON(ST_MakePoint(-97.402878, 30.118040)), '{9012}'),
(598, 755, 'P1009 - Tucker Hill Ln', 'Tucker Hill Ln', 'description', ST_MakePoint(-97.523064, 30.181110), ST_AsGeoJSON(ST_MakePoint(-97.523064, 30.181110)), '{9012}'),
(599, 756, 'P1010 - 236 Over Hill Rd', '236 Over Hill Rd near Creek side', 'description', ST_MakePoint(-97.301392, 30.189760), ST_AsGeoJSON(ST_MakePoint(-97.301392, 30.189760)), '{9012}'),
(600, 757, 'P1011 - 170 Tiger Woods Dr', '170 Tiger Woods Dr', 'description', ST_MakePoint(-97.280937, 30.179899), ST_AsGeoJSON(ST_MakePoint(-97.280937, 30.179899)), '{9012}'),
(601, 758, 'P1012 - Manawianui Dr ', 'Manawianui Dr just off Kaanapali ln', 'description', ST_MakePoint(-97.276688, 30.087570), ST_AsGeoJSON(ST_MakePoint(-97.276688, 30.087570)), '{9012}'),
(602, 759, 'P1013 - Kaanapali Low Water Crossing', 'Between Manawianui Dr and Koali Dr', 'description', ST_MakePoint(-97.277298, 30.088461), ST_AsGeoJSON(ST_MakePoint(-97.277298, 30.088461)), '{9012}'),
(603, 760, 'P1014 - Old McDade Rd ', 'Old McDade Rd @ low water crossing', 'description', ST_MakePoint(-97.309441, 30.143410), ST_AsGeoJSON(ST_MakePoint(-97.309441, 30.143410)), '{9012}'),
(604, 761, 'P1015 - Greenfields Dr', 'Greenfields Dr', 'description', ST_MakePoint(-97.427696, 30.126659), ST_AsGeoJSON(ST_MakePoint(-97.427696, 30.126659)), '{9012}'),
(605, 762, 'P1016 - E Riverside Dr', 'E Riverside Dr from Akaloa Dr to Kahana Ln', 'description', ST_MakePoint(-97.298019, 30.069189), ST_AsGeoJSON(ST_MakePoint(-97.298019, 30.069189)), '{9012}'),
(606, 763, 'P2001 - Friendship Rd. (East)', '400 Blk', 'description', ST_MakePoint(-97.086777, 30.187429), ST_AsGeoJSON(ST_MakePoint(-97.086777, 30.187429)), '{9012}'),
(607, 764, 'P2002 - Friendship Rd. (West)', '200 Blk', 'description', ST_MakePoint(-97.103958, 30.187330), ST_AsGeoJSON(ST_MakePoint(-97.103958, 30.187330)), '{9012}'),
(608, 765, 'P2003 - Saint Delight Rd', '400 Blk', 'description', ST_MakePoint(-97.112297, 30.184549), ST_AsGeoJSON(ST_MakePoint(-97.112297, 30.184549)), '{9012}'),
(609, 766, 'P2004 - Gotier Trace Rd', '1600 Blk', 'description', ST_MakePoint(-97.132156, 30.131001), ST_AsGeoJSON(ST_MakePoint(-97.132156, 30.131001)), '{9012}'),
(610, 767, 'P2005 - Gotier Trace Rd.', '1250 Blk', 'description', ST_MakePoint(-97.157066, 30.123619), ST_AsGeoJSON(ST_MakePoint(-97.157066, 30.123619)), '{9012}'),
(611, 768, 'P2006 - Bowie Dr.', '126 Blk', 'description', ST_MakePoint(-97.201424, 30.176960), ST_AsGeoJSON(ST_MakePoint(-97.201424, 30.176960)), '{9012}'),
(612, 769, 'P2007 - Cardinal Dr.', '718 Blk', 'description', ST_MakePoint(-97.202263, 30.191250), ST_AsGeoJSON(ST_MakePoint(-97.202263, 30.191250)), '{9012}'),
(613, 770, 'P2008 - Cardinal Dr.', '700 Blk', 'description', ST_MakePoint(-97.204323, 30.190281), ST_AsGeoJSON(ST_MakePoint(-97.204323, 30.190281)), '{9012}'),
(614, 772, 'P2010 - 250 Blk League line Rd', 'P2010 - 250 Blk League line Rd', 'description', ST_MakePoint(-97.068138, 30.076050), ST_AsGeoJSON(ST_MakePoint(-97.068138, 30.076050)), '{9012}'),
(615, 773, 'P2011 - Zack Rd', '', 'description', ST_MakePoint(-97.042831, 30.056141), ST_AsGeoJSON(ST_MakePoint(-97.042831, 30.056141)), '{9012}'),
(616, 774, 'P2012 - Center Union Rd.', '', 'description', ST_MakePoint(-97.060402, 30.040739), ST_AsGeoJSON(ST_MakePoint(-97.060402, 30.040739)), '{9012}'),
(617, 775, 'P2013 - Krchnak Rd.', '300 KRCHNAK RD', 'description', ST_MakePoint(-97.074890, 30.050800), ST_AsGeoJSON(ST_MakePoint(-97.074890, 30.050800)), '{9012}'),
(618, 776, 'P2014 - Barton Oak Rd.', '', 'description', ST_MakePoint(-97.138802, 29.950230), ST_AsGeoJSON(ST_MakePoint(-97.138802, 29.950230)), '{9012}'),
(619, 777, 'P2015 - Vyvjala Rd.', '300 Blk', 'description', ST_MakePoint(-97.200989, 29.940050), ST_AsGeoJSON(ST_MakePoint(-97.200989, 29.940050)), '{9012}'),
(620, 778, 'P2016 - Patterson Rd.', '300 Blk', 'description', ST_MakePoint(-97.239220, 29.921841), ST_AsGeoJSON(ST_MakePoint(-97.239220, 29.921841)), '{9012}'),
(621, 779, 'P2017 - Patterson Rd.', '500 Blk at Hickory Creek', 'description', ST_MakePoint(-97.239449, 29.909660), ST_AsGeoJSON(ST_MakePoint(-97.239449, 29.909660)), '{9012}'),
(622, 780, 'P2018 - Patterson Rd.', '1600 Blk', 'description', ST_MakePoint(-97.269234, 29.862989), ST_AsGeoJSON(ST_MakePoint(-97.269234, 29.862989)), '{9012}'),
(623, 781, 'P2019 - Henry Ln.', '', 'description', ST_MakePoint(-97.315308, 29.844379), ST_AsGeoJSON(ST_MakePoint(-97.315308, 29.844379)), '{9012}'),
(624, 782, 'P2020 - McReynolds Rd.', '450 Blk', 'description', ST_MakePoint(-97.356071, 29.927019), ST_AsGeoJSON(ST_MakePoint(-97.356071, 29.927019)), '{9012}'),
(625, 783, 'P2021 - McReynolds Rd.', '300 Blk', 'description', ST_MakePoint(-97.349197, 29.917690), ST_AsGeoJSON(ST_MakePoint(-97.349197, 29.917690)), '{9012}'),
(626, 784, 'Johns Rd', '200 BLK', 'description', ST_MakePoint(-97.284241, 29.980640), ST_AsGeoJSON(ST_MakePoint(-97.284241, 29.980640)), '{9012}'),
(627, 785, 'P2023 - Hidden Shore Loop', '205 Blk', 'description', ST_MakePoint(-97.201180, 30.049440), ST_AsGeoJSON(ST_MakePoint(-97.201180, 30.049440)), '{9012}'),
(628, 786, 'P2024 - O Grady Rd', '205 Blk', 'description', ST_MakePoint(97.199753, 30.070650), ST_AsGeoJSON(ST_MakePoint(97.199753, 30.070650)), '{9012}'),
(629, 787, 'P3001 - Wilhelm Way ', '300 Blk', 'description', ST_MakePoint(-97.368439, 29.970921), ST_AsGeoJSON(ST_MakePoint(-97.368439, 29.970921)), '{9012}'),
(630, 788, 'P3002 - Watterson Rd.', '1250 Blk ', 'description', ST_MakePoint(-97.378670, 29.979650), ST_AsGeoJSON(ST_MakePoint(-97.378670, 29.979650)), '{9012}'),
(631, 789, 'P3003 - Watterson Rd. /Possum Way', '900 Blk', 'description', ST_MakePoint(-97.365471, 29.999800), ST_AsGeoJSON(ST_MakePoint(-97.365471, 29.999800)), '{9012}'),
(632, 790, 'P3004 - Watterson Rd.', '674 Blk', 'description', ST_MakePoint(-97.355232, 30.014771), ST_AsGeoJSON(ST_MakePoint(-97.355232, 30.014771)), '{9012}'),
(633, 791, 'P3005 - Watterson Rd.', '350 Blk', 'description', ST_MakePoint(-97.340431, 30.028339), ST_AsGeoJSON(ST_MakePoint(-97.340431, 30.028339)), '{9012}'),
(634, 792, 'P3006 - Glass Ln', '317 Blk', 'description', ST_MakePoint(-97.329071, 30.020800), ST_AsGeoJSON(ST_MakePoint(-97.329071, 30.020800)), '{9012}'),
(635, 793, 'P3007 - Lee Rd.', '613 Blk', 'description', ST_MakePoint(-97.383202, 29.991020), ST_AsGeoJSON(ST_MakePoint(-97.383202, 29.991020)), '{9012}'),
(636, 794, 'P3008 - Watterson School Rd.', '362 Blk', 'description', ST_MakePoint(-97.403709, 29.988140), ST_AsGeoJSON(ST_MakePoint(-97.403709, 29.988140)), '{9012}'),
(637, 795, 'P3009 - Lee Rd.', '525 Blk', 'description', ST_MakePoint(-97.386101, 29.995131), ST_AsGeoJSON(ST_MakePoint(-97.386101, 29.995131)), '{9012}'),
(638, 796, 'P3010 - Lower Red Rock Rd.', '919 Blk', 'description', ST_MakePoint(-97.378906, 30.028250), ST_AsGeoJSON(ST_MakePoint(-97.378906, 30.028250)), '{9012}'),
(639, 797, 'P3011 - Lower Red Rock Rd.', '500 Blk', 'description', ST_MakePoint(-97.371429, 30.057091), ST_AsGeoJSON(ST_MakePoint(-97.371429, 30.057091)), '{9012}'),
(640, 798, 'Lone Star Rd', '400 Blk', 'description', ST_MakePoint(-97.402077, 30.042351), ST_AsGeoJSON(ST_MakePoint(-97.402077, 30.042351)), '{9012}'),
(641, 799, 'P3013 - Lower Red Rock Rd.', '110 Blk', 'description', ST_MakePoint(-97.384911, 30.022840), ST_AsGeoJSON(ST_MakePoint(-97.384911, 30.022840)), '{9012}'),
(642, 800, 'P3014 - Lower Red Rock Rd.', '1110 Blk', 'description', ST_MakePoint(-97.389847, 30.024290), ST_AsGeoJSON(ST_MakePoint(-97.389847, 30.024290)), '{9012}'),
(643, 801, 'P3015 - Lower Red Rock Rd.', '1300 Blk', 'description', ST_MakePoint(-97.401161, 30.017309), ST_AsGeoJSON(ST_MakePoint(-97.401161, 30.017309)), '{9012}'),
(644, 802, 'P3016 - Lower Red Rock Rd.', '1550 Blk', 'description', ST_MakePoint(-97.412987, 30.001980), ST_AsGeoJSON(ST_MakePoint(-97.412987, 30.001980)), '{9012}'),
(645, 803, 'P3017 - Lehman Ln', '300 Blk', 'description', ST_MakePoint(-97.420563, 30.009251), ST_AsGeoJSON(ST_MakePoint(-97.420563, 30.009251)), '{9012}'),
(646, 804, 'P3018 - Pleasant Chapel Rd', '270 Blk', 'description', ST_MakePoint(-97.431862, 30.030930), ST_AsGeoJSON(ST_MakePoint(-97.431862, 30.030930)), '{9012}'),
(647, 805, 'P3019 - Earl Callahan Rd', '400 - 500 Blk', 'description', ST_MakePoint(-97.438698, 30.065701), ST_AsGeoJSON(ST_MakePoint(-97.438698, 30.065701)), '{9012}'),
(648, 806, 'P3020 - N Cedar Creek Dr.', '100 Blk', 'description', ST_MakePoint(-97.483467, 30.065929), ST_AsGeoJSON(ST_MakePoint(-97.483467, 30.065929)), '{9012}'),
(649, 807, 'P3021 - Mt. Pleasant Rd.', '600 Blk', 'description', ST_MakePoint(-97.503822, 30.032209), ST_AsGeoJSON(ST_MakePoint(-97.503822, 30.032209)), '{9012}'),
(650, 808, 'P3022 - John Craft Rd.', '200Blk', 'description', ST_MakePoint(-97.384430, 29.957640), ST_AsGeoJSON(ST_MakePoint(-97.384430, 29.957640)), '{9012}'),
(651, 809, 'P3023 - Watterson Rd', '1750 Watterson Rd at Bridge', 'description', ST_MakePoint(-97.398422, 29.954880), ST_AsGeoJSON(ST_MakePoint(-97.398422, 29.954880)), '{9012}'),
(652, 810, 'P3024 - Goertz Rd. / Waterson Rd', '400 Blk', 'description', ST_MakePoint(-97.429260, 29.970671), ST_AsGeoJSON(ST_MakePoint(-97.429260, 29.970671)), '{9012}'),
(653, 811, 'P3025 - Goertz Rd ', '300 Blk', 'description', ST_MakePoint(-97.433632, 29.973240), ST_AsGeoJSON(ST_MakePoint(-97.433632, 29.973240)), '{9012}'),
(654, 812, 'P3026 - Sand Hill Rd.', '100 Blk', 'description', ST_MakePoint(-97.443336, 29.956791), ST_AsGeoJSON(ST_MakePoint(-97.443336, 29.956791)), '{9012}'),
(655, 813, 'P3027 - Sand Hill Rd.', '600 Blk', 'description', ST_MakePoint(-97.408028, 29.939159), ST_AsGeoJSON(ST_MakePoint(-97.408028, 29.939159)), '{9012}'),
(656, 814, 'P3028 - Klaus Ln', '200 Blk Klaus Ln @ Lower Elm Creek', 'description', ST_MakePoint(-97.432663, 29.929939), ST_AsGeoJSON(ST_MakePoint(-97.432663, 29.929939)), '{9012}'),
(657, 815, 'P3029 - Pettytown Rd.', '500 Blk', 'description', ST_MakePoint(-97.443810, 29.934090), ST_AsGeoJSON(ST_MakePoint(-97.443810, 29.934090)), '{9012}'),
(658, 816, 'P3030 - Pettytown Rd.', '825 Blk', 'description', ST_MakePoint(-97.456734, 29.912729), ST_AsGeoJSON(ST_MakePoint(-97.456734, 29.912729)), '{9012}'),
(659, 817, 'P3031 - Bateman Rd.', '300 Blk', 'description', ST_MakePoint(-97.466217, 29.946751), ST_AsGeoJSON(ST_MakePoint(-97.466217, 29.946751)), '{9012}'),
(660, 818, 'P3032 - Alexander Rd.', '100 Blk', 'description', ST_MakePoint(-97.474892, 29.960199), ST_AsGeoJSON(ST_MakePoint(-97.474892, 29.960199)), '{9012}'),
(661, 819, 'P3033 - Wilson Rd.', '200 Blk', 'description', ST_MakePoint(-97.473328, 29.961800), ST_AsGeoJSON(ST_MakePoint(-97.473328, 29.961800)), '{9012}'),
(662, 820, 'P3034 - Boyd Rd.', '100 Blk', 'description', ST_MakePoint(-97.496750, 29.985609), ST_AsGeoJSON(ST_MakePoint(-97.496750, 29.985609)), '{9012}'),
(663, 821, 'P3035 - Boyd Rd.', '400 Blk', 'description', ST_MakePoint(-97.512878, 29.971430), ST_AsGeoJSON(ST_MakePoint(-97.512878, 29.971430)), '{9012}'),
(664, 822, 'P3036 - Hollow Rd.', '200 Blk', 'description', ST_MakePoint(-97.492210, 29.991619), ST_AsGeoJSON(ST_MakePoint(-97.492210, 29.991619)), '{9012}'),
(665, 823, 'P3037 - High Grove Rd.', '575 Blk', 'description', ST_MakePoint(-97.478378, 30.010300), ST_AsGeoJSON(ST_MakePoint(-97.478378, 30.010300)), '{9012}'),
(666, 824, 'P3038 - High Grove Rd.', '300 Blk', 'description', ST_MakePoint(-97.468384, 30.022810), ST_AsGeoJSON(ST_MakePoint(-97.468384, 30.022810)), '{9012}'),
(667, 825, 'P3039 - Artesian Rd.', '100 Blk', 'description', ST_MakePoint(-97.533348, 30.016300), ST_AsGeoJSON(ST_MakePoint(-97.533348, 30.016300)), '{9012}'),
(668, 826, 'P3040 - Rianna Woods Dr.', '150 Blk', 'description', ST_MakePoint(-97.570396, 30.005190), ST_AsGeoJSON(ST_MakePoint(-97.570396, 30.005190)), '{9012}'),
(669, 827, 'P3041 - Blue Jay Rd.', '200 Blk', 'description', ST_MakePoint(-97.559219, 30.003019), ST_AsGeoJSON(ST_MakePoint(-97.559219, 30.003019)), '{9012}'),
(670, 828, 'P3042 - Watts Rd.', '1600 Blk', 'description', ST_MakePoint(-97.535530, 30.082920), ST_AsGeoJSON(ST_MakePoint(-97.535530, 30.082920)), '{9012}'),
(671, 829, 'P3043 - Legend Oaks Dr.', '200 Blk', 'description', ST_MakePoint(-97.599030, 30.068270), ST_AsGeoJSON(ST_MakePoint(-97.599030, 30.068270)), '{9012}'),
(672, 830, 'P3044 - Caldwell Rd.', '150 Blk', 'description', ST_MakePoint(-97.618813, 30.054649), ST_AsGeoJSON(ST_MakePoint(-97.618813, 30.054649)), '{9012}'),
(673, 831, 'P3045 - McDowell Rd.', '140 Blk', 'description', ST_MakePoint(-97.578369, 30.097561), ST_AsGeoJSON(ST_MakePoint(-97.578369, 30.097561)), '{9012}'),
(674, 832, 'P3046 - Jacobson Rd.', '1-97 Blk', 'description', ST_MakePoint(-97.590134, 30.116470), ST_AsGeoJSON(ST_MakePoint(-97.590134, 30.116470)), '{9012}'),
(675, 833, 'P3047 - Prvada Rd', '134 Blk', 'description', ST_MakePoint(-97.570686, 30.108709), ST_AsGeoJSON(ST_MakePoint(-97.570686, 30.108709)), '{9012}'),
(676, 834, 'P3048 - Reeves Ln', '158 Blk', 'description', ST_MakePoint(-97.541130, 30.112391), ST_AsGeoJSON(ST_MakePoint(-97.541130, 30.112391)), '{9012}'),
(677, 835, 'P3049 - Shady Oaks Loop', '215 Blk', 'description', ST_MakePoint(-97.530983, 30.099409), ST_AsGeoJSON(ST_MakePoint(-97.530983, 30.099409)), '{9012}'),
(678, 836, 'P3050 - Thousand Oaks Dr', '100 Blk - Road Open', 'description', ST_MakePoint(-97.511833, 30.106079), ST_AsGeoJSON(ST_MakePoint(-97.511833, 30.106079)), '{9012}'),
(679, 837, 'P3051 - Jenkins Rd', '300 Blk', 'description', ST_MakePoint(-97.494537, 30.107201), ST_AsGeoJSON(ST_MakePoint(-97.494537, 30.107201)), '{9012}'),
(680, 838, 'P3052 - Pope Bend South', '400 Blk', 'description', ST_MakePoint(-97.478432, 30.125460), ST_AsGeoJSON(ST_MakePoint(-97.478432, 30.125460)), '{9012}'),
(681, 839, 'P3053 - Simpson Ave.', '170 Blk', 'description', ST_MakePoint(-97.480377, 30.128920), ST_AsGeoJSON(ST_MakePoint(-97.480377, 30.128920)), '{9012}'),
(682, 840, 'P3054 - Cedar Ln', '323 Blk', 'description', ST_MakePoint(-97.469940, 30.127621), ST_AsGeoJSON(ST_MakePoint(-97.469940, 30.127621)), '{9012}'),
(683, 841, 'P3055 - Tuck St', '171 Blk', 'description', ST_MakePoint(-97.470108, 30.120880), ST_AsGeoJSON(ST_MakePoint(-97.470108, 30.120880)), '{9012}'),
(684, 842, 'P3056 - Lake View Dr', '248 LAKE VIEW DR', 'description', ST_MakePoint(-97.469452, 30.119110), ST_AsGeoJSON(ST_MakePoint(-97.469452, 30.119110)), '{9012}'),
(685, 843, 'P3057 - Marjess Dr.', '150 Blk', 'description', ST_MakePoint(-97.462334, 30.111250), ST_AsGeoJSON(ST_MakePoint(-97.462334, 30.111250)), '{9012}'),
(686, 844, 'P3058 - Leisure Ln', '639 Blk', 'description', ST_MakePoint(-97.466087, 30.132280), ST_AsGeoJSON(ST_MakePoint(-97.466087, 30.132280)), '{9012}'),
(687, 845, 'P3059 - Stoney Brook', '139 Blk', 'description', ST_MakePoint(-97.449188, 30.128151), ST_AsGeoJSON(ST_MakePoint(-97.449188, 30.128151)), '{9012}'),
(688, 846, 'P3060 - Leisure Ln.', '363 Blk', 'description', ST_MakePoint(-97.446060, 30.123039), ST_AsGeoJSON(ST_MakePoint(-97.446060, 30.123039)), '{9012}'),
(689, 847, 'P3061 - Shiloh Rd.', '1150 Blk', 'description', ST_MakePoint(-97.439507, 30.095131), ST_AsGeoJSON(ST_MakePoint(-97.439507, 30.095131)), '{9012}'),
(690, 848, 'P3062 - Mt. Olive Rd.', '398 Blk', 'description', ST_MakePoint(-97.441528, 30.100849), ST_AsGeoJSON(ST_MakePoint(-97.441528, 30.100849)), '{9012}'),
(691, 849, 'P4001 - 576 Block Monkey', '576 Blk', 'description', ST_MakePoint(-97.417313, 30.326191), ST_AsGeoJSON(ST_MakePoint(-97.417313, 30.326191)), '{9012}'),
(692, 850, 'P4002 - North Gates on Upper Elgin River Road @ Willbarger', '', 'description', ST_MakePoint(-97.438942, 30.287790), ST_AsGeoJSON(ST_MakePoint(-97.438942, 30.287790)), '{9012}'),
(693, 851, 'P4003 - 1685 Upper Elgin River Rd', '', 'description', ST_MakePoint(-97.441978, 30.256910), ST_AsGeoJSON(ST_MakePoint(-97.441978, 30.256910)), '{9012}'),
(694, 852, 'P4004 - 1831 Upper Elgin River Rd', '', 'description', ST_MakePoint(-97.447441, 30.248369), ST_AsGeoJSON(ST_MakePoint(-97.447441, 30.248369)), '{9012}'),
(695, 853, 'P4005 - 192 Dry Willow Rd / Elbow Bend Rd.', '', 'description', ST_MakePoint(-97.444290, 30.246441), ST_AsGeoJSON(ST_MakePoint(-97.444290, 30.246441)), '{9012}'),
(696, 854, 'P4006 - 123 Watersedge Terrace Dr.', '', 'description', ST_MakePoint(-97.481857, 30.213680), ST_AsGeoJSON(ST_MakePoint(-97.481857, 30.213680)), '{9012}'),
(697, 855, 'P4007 - 209 Old Sayers Rd', '', 'description', ST_MakePoint(-97.365662, 30.320740), ST_AsGeoJSON(ST_MakePoint(-97.365662, 30.320740)), '{9012}'),
(698, 856, 'P4008 - 1-97 Block Beaver Rd', '1-97 Blk', 'description', ST_MakePoint(-97.377190, 30.301750), ST_AsGeoJSON(ST_MakePoint(-97.377190, 30.301750)), '{9012}'),
(699, 857, 'P4009 - 175 Block Arbuckle Rd', '175 Blk', 'description', ST_MakePoint(97.380966, 30.287029), ST_AsGeoJSON(ST_MakePoint(97.380966, 30.287029)), '{9012}'),
(700, 858, 'P4010 - 1333 Block Old Sayers Rd', '1333 Blk', 'description', ST_MakePoint(-97.350853, 30.252769), ST_AsGeoJSON(ST_MakePoint(-97.350853, 30.252769)), '{9012}'),
(701, 859, 'P4011 - 1800 Block Sayers Rd', '1800 Blk', 'description', ST_MakePoint(-97.329559, 30.233141), ST_AsGeoJSON(ST_MakePoint(-97.329559, 30.233141)), '{9012}'),
(702, 860, 'P4012 - 299 Block Marlin Rd. / Paint Creek', '299 Blk Marlin Rd', 'description', ST_MakePoint(-97.223778, 30.291250), ST_AsGeoJSON(ST_MakePoint(-97.223778, 30.291250)), '{9012}'),
(703, 861, 'MARLIN ST', 'MARLIN ST', 'description', ST_MakePoint(-97.197731, 30.297279), ST_AsGeoJSON(ST_MakePoint(-97.197731, 30.297279)), '{9012}'),
(704, 862, 'P4014 - 1084 Paint Creek Rd', '', 'description', ST_MakePoint(-97.161926, 30.280331), ST_AsGeoJSON(ST_MakePoint(-97.161926, 30.280331)), '{9012}'),
(705, 863, 'STOCKADE RANCH RD', '1300 BLK', 'description', ST_MakePoint(-97.157890, 30.287149), ST_AsGeoJSON(ST_MakePoint(-97.157890, 30.287149)), '{9012}'),
(706, 864, 'P4016 - 270 Block Stockade Ranch Rd', '270 Blk', 'description', ST_MakePoint(-97.119392, 30.228710), ST_AsGeoJSON(ST_MakePoint(-97.119392, 30.228710)), '{9012}'),
(707, 865, 'P4017 - 181 Block Longhorn Trail', '181 Blk', 'description', ST_MakePoint(-97.114113, 30.259159), ST_AsGeoJSON(ST_MakePoint(-97.114113, 30.259159)), '{9012}'),
(708, 866, 'P4018 - 292 Block Longhorn Trail ', '292 Blk', 'description', ST_MakePoint(-97.118080, 30.269510), ST_AsGeoJSON(ST_MakePoint(-97.118080, 30.269510)), '{9012}'),
(709, 867, 'P4019 - 214 Lee County Rd.', '', 'description', ST_MakePoint(-97.107979, 30.270861), ST_AsGeoJSON(ST_MakePoint(-97.107979, 30.270861)), '{9012}'),
(710, 868, 'P4020 - 290 Edgewood Trail', '', 'description', ST_MakePoint(-97.099297, 30.246771), ST_AsGeoJSON(ST_MakePoint(-97.099297, 30.246771)), '{9012}'),
(711, 869, 'P4021 - 209 Block Lincoln Lake Rd', '209 Blk', 'description', ST_MakePoint(-97.085770, 30.236980), ST_AsGeoJSON(ST_MakePoint(-97.085770, 30.236980)), '{9012}'),
(712, 870, 'COB1001 - Riverwood Drive Low Water Crossing', 'Riverwood Drive .2 Miles West of Carter', 'description', ST_MakePoint(-97.329010, 30.120541), ST_AsGeoJSON(ST_MakePoint(-97.329010, 30.120541)), '{9012}'),
(713, 871, 'COB1002 - Fishermans Park Farm Street', 'Willow and Cedar going to Fishermans Park', 'description', ST_MakePoint(-97.325172, 30.114840), ST_AsGeoJSON(ST_MakePoint(-97.325172, 30.114840)), '{9012}'),
(714, 872, 'COB1003 - Fishermans Park Willow Street', 'Farm Stree near Wilson going to Fishermans Park', 'description', ST_MakePoint(-97.321907, 30.112610), ST_AsGeoJSON(ST_MakePoint(-97.321907, 30.112610)), '{9012}'),
(715, 873, 'COB1004 - Fishermans Park Boat Ramp Area', 'Fishermans Park Boat Ramp Area', 'description', ST_MakePoint(-97.325073, 30.111919), ST_AsGeoJSON(ST_MakePoint(-97.325073, 30.111919)), '{9012}'),
(716, 874, 'COE1001 - Hwy 290 and 1880 County Line Road', 'Hwy 290 and 1880 County Line Road', 'description', ST_MakePoint(-97.411682, 30.352619), ST_AsGeoJSON(ST_MakePoint(-97.411682, 30.352619)), '{9012}'),
(717, 875, 'COE1002 - Hwy 290 at 800 Martin Luther King Blvd', 'Hwy 290 at 800 Martin Luther King Blvd', 'description', ST_MakePoint(-97.362091, 30.335590), ST_AsGeoJSON(ST_MakePoint(-97.362091, 30.335590)), '{9012}'),
(718, 876, 'COE1003 - 100 Q.S. Goins Ln.', '100 Q.S. Goins Ln.', 'description', ST_MakePoint(-97.361588, 30.352800), ST_AsGeoJSON(ST_MakePoint(-97.361588, 30.352800)), '{9012}'),
(719, 877, 'COE1004 - N Avenue C in the 907 block', 'N Avenue C in the 907 block', 'description', ST_MakePoint(-97.377220, 30.352461), ST_AsGeoJSON(ST_MakePoint(-97.377220, 30.352461)), '{9012}'),
(720, 878, 'COE1005 - West Brenham St in the 600 block', 'West Brenham St in the 600 block', 'description', ST_MakePoint(-97.376389, 30.342939), ST_AsGeoJSON(ST_MakePoint(-97.376389, 30.342939)), '{9012}'),
(721, 879, 'COS1001 - Old Upton Rd and Uptown Dr', 'Old Upton Rd and Uptown Dr', 'description', ST_MakePoint(-97.170128, 30.014690), ST_AsGeoJSON(ST_MakePoint(-97.170128, 30.014690)), '{9012}'),
(722, 880, 'COS1002 - Loop 230 river bridge Boat Ramp', 'Loop 230 river bridge Boat Ramp', 'description', ST_MakePoint(-97.160187, 30.017550), ST_AsGeoJSON(ST_MakePoint(-97.160187, 30.017550)), '{9012}'),
(723, 881, 'COS1003 - The drive at Riverbend Park', 'The drive at Riverbend Park', 'description', ST_MakePoint(-97.145233, 30.018650), ST_AsGeoJSON(ST_MakePoint(-97.145233, 30.018650)), '{9012}'),
(724, 882, 'COS1004 - Loop Around at Riverbend Park Under 71', 'Loop Around at Riverbend Park Under 71', 'description', ST_MakePoint(-97.148682, 30.017929), ST_AsGeoJSON(ST_MakePoint(-97.148682, 30.017929)), '{9012}'),
(725, 885, '20700 Cameron Rd', 'Travis County, TX', 'description', ST_MakePoint(-97.492355, 30.457598), ST_AsGeoJSON(ST_MakePoint(-97.492355, 30.457598)), '{9010}'),
(726, 886, 'P4022 Arbuckle at the Bridge', 'Arbuckle at the Bridge', 'description', ST_MakePoint(-97.381363, 30.287445), ST_AsGeoJSON(ST_MakePoint(-97.381363, 30.287445)), '{9012}'),
(727, 887, 'Reavis Road', 'Near FM1322', 'description', ST_MakePoint(-97.662216, 29.829710), ST_AsGeoJSON(ST_MakePoint(-97.662216, 29.829710)), '{9011}'),
(728, 888, 'TX1001 Park Road 1C at Alum Creek', 'Park Road 1C at Alum Creek', 'description', ST_MakePoint(-97.220116, 30.096329), ST_AsGeoJSON(ST_MakePoint(-97.220116, 30.096329)), '{9012}'),
(729, 889, 'Bugtussle Lane (CR115)', 'Caldwell County', 'description', ST_MakePoint(-97.730354, 29.769598), ST_AsGeoJSON(ST_MakePoint(-97.730354, 29.769598)), '{9011}'),
(730, 890, 'Boggy Creek', '800 Bk Boggy Creek, Caldwell County', 'description', ST_MakePoint(-97.716110, 29.863838), ST_AsGeoJSON(ST_MakePoint(-97.716110, 29.863838)), '{9011}'),
(731, 891, 'P4023 - Raccoon Rd Crossing', 'Raccoon Rd 100 Yard of Old Lexington Rd', 'description', ST_MakePoint(-97.307426, 30.366083), ST_AsGeoJSON(ST_MakePoint(-97.307426, 30.366083)), '{9012}'),
(732, 892, 'Cistern Road', 'Cistern Road, Caldwell County', 'description', ST_MakePoint(-97.764145, 29.882763), ST_AsGeoJSON(ST_MakePoint(-97.764145, 29.882763)), '{9011}'),
(733, 893, 'Clark Loop', 'Clark Loop, Caldwell County', 'description', ST_MakePoint(-97.740112, 29.885496), ST_AsGeoJSON(ST_MakePoint(-97.740112, 29.885496)), '{9011}'),
(734, 894, 'COB1005 Jasper and MLK', 'Jasper and MLK', 'description', ST_MakePoint(-97.311081, 30.103134), ST_AsGeoJSON(ST_MakePoint(-97.311081, 30.103134)), '{9012}'),
(735, 895, 'WCID1001 - 100 Block Kokomo', '100 Block Kokomo', 'description', ST_MakePoint(-97.327065, 30.090548), ST_AsGeoJSON(ST_MakePoint(-97.327065, 30.090548)), '{9012}'),
(736, 898, 'Westwood Road (600 Bk)', 'Westwood Road, Caldwell County', 'description', ST_MakePoint(-97.694626, 29.814329), ST_AsGeoJSON(ST_MakePoint(-97.694626, 29.814329)), '{9011}'),
(737, 899, 'TX1003 - FM 535 / AJ Rod Road', 'Area of FM 535 / AJ Rod Road', 'description', ST_MakePoint(-97.197372, 29.972275), ST_AsGeoJSON(ST_MakePoint(-97.197372, 29.972275)), '{9012}'),
(738, 900, 'Political Road', '100 Bk Political Road, Caldwell County', 'description', ST_MakePoint(-97.746895, 29.796789), ST_AsGeoJSON(ST_MakePoint(-97.746895, 29.796789)), '{9011}'),
(739, 901, 'Austin Road', '1600 BK Austin Road, Caldwell County, TX', 'description', ST_MakePoint(-97.679710, 29.691584), ST_AsGeoJSON(ST_MakePoint(-97.679710, 29.691584)), '{9011}'),
(740, 902, 'Seals Creek Road', '100 BK Seals Creek Road, Caldwell County TX', 'description', ST_MakePoint(-97.741592, 29.792377), ST_AsGeoJSON(ST_MakePoint(-97.741592, 29.792377)), '{9011}'),
(741, 903, 'Buck Branch Road', 'Buck Branch Rd', 'description', ST_MakePoint(-97.418816, 29.768726), ST_AsGeoJSON(ST_MakePoint(-97.418816, 29.768726)), '{9011}'),
(742, 905, 'TX1004 - FM 153 @ Park Rd 1C', 'TX1004 - FM 153 @ Park Rd 1C', 'description', ST_MakePoint(-97.158310, 30.038132), ST_AsGeoJSON(ST_MakePoint(-97.158310, 30.038132)), '{9012}'),
(743, 906, 'P2026 - Kovar Rd South of Vyvjalla', 'P2026 - Kovar Rd South of Vyvjalla', 'description', ST_MakePoint(-97.220016, 29.936741), ST_AsGeoJSON(ST_MakePoint(-97.220016, 29.936741)), '{9012}'),
(744, 907, 'TX1005 - 1600 FM 2104', 'TX1005 - 1600 FM 2104', 'description', ST_MakePoint(-97.078934, 30.147470), ST_AsGeoJSON(ST_MakePoint(-97.078934, 30.147470)), '{9012}'),
(745, 908, 'P2027 - Hector Rd / Gravelly Creek', 'P2027 - Hector Rd / Gravelly Creek', 'description', ST_MakePoint(-97.090775, 30.057676), ST_AsGeoJSON(ST_MakePoint(-97.090775, 30.057676)), '{9012}'),
(746, 909, 'P2028 - 400 Old Lake Rd', 'P2028 - 400 Old Lake Rd', 'description', ST_MakePoint(-97.134331, 29.982010), ST_AsGeoJSON(ST_MakePoint(-97.134331, 29.982010)), '{9012}'),
(747, 910, 'Farris Ln', '300 Farris Ln', 'description', ST_MakePoint(-97.283272, 29.988424), ST_AsGeoJSON(ST_MakePoint(-97.283272, 29.988424)), '{9012}'),
(748, 911, 'P2030 - Pine Valley Loop Foster Lake Overflow', 'P2030 -  Pine Valley Loop', 'description', ST_MakePoint(-97.315735, 29.960033), ST_AsGeoJSON(ST_MakePoint(-97.315735, 29.960033)), '{9012}'),
(749, 914, 'P2033 - Serbin Rd at Long Prarie Branch Creek', 'P2033 - Serbin Rd at Long Prarie Branch Creek', 'description', ST_MakePoint(-97.037010, 30.064812), ST_AsGeoJSON(ST_MakePoint(-97.037010, 30.064812)), '{9012}'),
(750, 915, 'COS1005 - 1900 Woodress St', 'COS1005 - 1900 Woodress St', 'description', ST_MakePoint(-97.134933, 29.995094), ST_AsGeoJSON(ST_MakePoint(-97.134933, 29.995094)), '{9012}'),
(751, 916, 'TX1019 - FM 535 @ Watterson Road', 'TX1019 - 535 at Watterson Road', 'description', ST_MakePoint(-97.384438, 29.971060), ST_AsGeoJSON(ST_MakePoint(-97.384438, 29.971060)), '{9012}'),
(752, 917, 'P2034 - Barton Creek at Zapalac Rd', 'P2034 - Barton Creek at Zapalac Rd', 'description', ST_MakePoint(-97.145340, 29.945227), ST_AsGeoJSON(ST_MakePoint(-97.145340, 29.945227)), '{9012}'),
(753, 918, 'P2035 - Karisch Rd at Pin Oak Creek', 'P2035 - Karisch Rd at Pin Oak Creek', 'description', ST_MakePoint(-97.068565, 30.028528), ST_AsGeoJSON(ST_MakePoint(-97.068565, 30.028528)), '{9012}'),
(754, 919, 'Kirk Corner', 'Low water bridge', 'description', ST_MakePoint(-97.453590, 29.724924), ST_AsGeoJSON(ST_MakePoint(-97.453590, 29.724924)), '{9011}'),
(755, 920, 'Ramp from NB 183 to MoPac', 'Ramp from NB 183 to MoPac', 'description', ST_MakePoint(-97.738068, 30.378557), ST_AsGeoJSON(ST_MakePoint(-97.738068, 30.378557)), '{9002}'),
(756, 921, '2900-blk Bee Caves Rd', 'Travis County, TX', 'description', ST_MakePoint(-97.791901, 30.270645), ST_AsGeoJSON(ST_MakePoint(-97.791901, 30.270645)), '{9010}'),
(757, 922, '5400-blk Steiner Ranch Blvd', 'Travis County, TX', 'description', ST_MakePoint(-97.870270, 30.393028), ST_AsGeoJSON(ST_MakePoint(-97.870270, 30.393028)), '{9010}'),
(758, 923, '12500-blk FM 812 @ COTA', 'Travis County, TX', 'description', ST_MakePoint(-97.648224, 30.132597), ST_AsGeoJSON(ST_MakePoint(-97.648224, 30.132597)), '{9010}'),
(759, 924, '9000-blk FM 973 @ Gilleland Creek', 'Travis County, TX', 'description', ST_MakePoint(-97.570221, 30.294378), ST_AsGeoJSON(ST_MakePoint(-97.570221, 30.294378)), '{9010}'),
(760, 927, 'P4024 - Pleasant Grove RV Park &amp; Camp', 'P4024 - Pleasant Grove RV Park &amp; Camp', 'description', ST_MakePoint(-97.327621, 30.383915), ST_AsGeoJSON(ST_MakePoint(-97.327621, 30.383915)), '{9012}'),
(761, 928, 'COE1006 - 200 Block Kennedy', 'COE1006 - 200 Block Kennedy', 'description', ST_MakePoint(-97.375458, 30.343157), ST_AsGeoJSON(ST_MakePoint(-97.375458, 30.343157)), '{9012}'),
(762, 929, 'COE1007 - East 1st @ Avenue G', 'COE1007 - East 1st @ Avenue G', 'description', ST_MakePoint(-97.366875, 30.349821), ST_AsGeoJSON(ST_MakePoint(-97.366875, 30.349821)), '{9012}'),
(763, 930, 'TX1006 - FM 3000 at Mundine', 'TX1006 - FM 3000 at Mundine', 'description', ST_MakePoint(-97.321190, 30.362949), ST_AsGeoJSON(ST_MakePoint(-97.321190, 30.362949)), '{9012}'),
(764, 931, 'P4025 - Mundine Road near FM 3000', 'P4025 - Mundine Road near FM 3000', 'description', ST_MakePoint(-97.320808, 30.361727), ST_AsGeoJSON(ST_MakePoint(-97.320808, 30.361727)), '{9012}'),
(765, 932, 'Lund Carlson Rd @ Werchan Ln', 'Travis County, TX', 'description', ST_MakePoint(-97.427597, 30.419123), ST_AsGeoJSON(ST_MakePoint(-97.427597, 30.419123)), '{9010}'),
(766, 933, 'P4026 - Pleasant Grove Loop off FM 3000', 'P4026 - Pleasant Grove Loop off FM 3000', 'description', ST_MakePoint(-97.320610, 30.363451), ST_AsGeoJSON(ST_MakePoint(-97.320610, 30.363451)), '{9012}'),
(767, 934, 'Shadowglen Blvd @ Shadow Glen Trce', 'Travis County, TX', 'description', ST_MakePoint(-97.547478, 30.357580), ST_AsGeoJSON(ST_MakePoint(-97.547478, 30.357580)), '{9010}'),
(768, 935, 'TX1007 - FM 696 @ Big Sandy Creek', 'TX1007 - FM 696 @ Big Sandy Creek', 'description', ST_MakePoint(-97.290596, 30.321651), ST_AsGeoJSON(ST_MakePoint(-97.290596, 30.321651)), '{9012}'),
(769, 938, 'P4027 - Big Sandy Creek @ Old McDade Road', 'P4027 - Big Sandy Creek @ Old McDade Road', 'description', ST_MakePoint(-97.291664, 30.312466), ST_AsGeoJSON(ST_MakePoint(-97.291664, 30.312466)), '{9012}'),
(770, 941, 'P4028 - Lower Elgin Rd at Wilbarger Creek', 'P4028 - Lower Elgin Rd at Wilbarger Creek 1100 Blk', 'description', ST_MakePoint(-97.409508, 30.222675), ST_AsGeoJSON(ST_MakePoint(-97.409508, 30.222675)), '{9012}'),
(771, 942, 'P4029 - South Gates on Upper Elgin River Road @ Willbarger', 'P4029 - South Gates on Upper Elgin River Road @ Wi', 'description', ST_MakePoint(-97.441185, 30.281666), ST_AsGeoJSON(ST_MakePoint(-97.441185, 30.281666)), '{9012}'),
(772, 944, 'P2036 -Gonzales St @ 21', 'P2036 - Gonzales St @ 21', 'description', ST_MakePoint(-97.113991, 30.217197), ST_AsGeoJSON(ST_MakePoint(-97.113991, 30.217197)), '{9012}'),
(773, 945, 'P2037 - N Main @ 21 in Paige', 'P2037 - N Main @ 21 in Paige', 'description', ST_MakePoint(-97.112526, 30.217411), ST_AsGeoJSON(ST_MakePoint(-97.112526, 30.217411)), '{9012}'),
(774, 946, 'TX1008 - Hwy 21 @ RR Bridge in Paige', 'TX1008 - Hwy 21 @ RR Bridge in Paige', 'description', ST_MakePoint(-97.125130, 30.216251), ST_AsGeoJSON(ST_MakePoint(-97.125130, 30.216251)), '{9012}'),
(775, 948, 'TX1009 - Hwy 21 near Orts Lane', 'TX1009 - Hwy 21 near Orts Lane', 'description', ST_MakePoint(-97.084602, 30.227440), ST_AsGeoJSON(ST_MakePoint(-97.084602, 30.227440)), '{9012}'),
(776, 949, 'Melody Ln @ Belafonte Blvd', 'Travis County, TX', 'description', ST_MakePoint(-97.571640, 30.256123), ST_AsGeoJSON(ST_MakePoint(-97.571640, 30.256123)), '{9010}'),
(777, 950, 'P2039 - August-Anna Rd @ 21', 'P2039 - August-Anna Rd @ 21', 'description', ST_MakePoint(-97.074516, 30.227921), ST_AsGeoJSON(ST_MakePoint(-97.074516, 30.227921)), '{9012}'),
(778, 951, 'TX1010 - FM 2104 @ Turner Creek', 'TX1010 - FM 2104 @ Turner Creek', 'description', ST_MakePoint(-97.098907, 30.189865), ST_AsGeoJSON(ST_MakePoint(-97.098907, 30.189865)), '{9012}'),
(779, 952, 'P2040 - Old Pin Oak @ Long Branch', 'P2040 - Old Pin Oak @ Long Branch', 'description', ST_MakePoint(-97.131683, 30.165682), ST_AsGeoJSON(ST_MakePoint(-97.131683, 30.165682)), '{9012}'),
(780, 953, 'P2041 - 200 Block Lois Ln', 'P2041 - 200 Block Lois Ln', 'description', ST_MakePoint(-97.139793, 30.164679), ST_AsGeoJSON(ST_MakePoint(-97.139793, 30.164679)), '{9012}'),
(781, 954, 'P2042 - 200 Block Kinsey', 'P2042 - 200 Block Kinsey', 'description', ST_MakePoint(-97.191849, 30.161934), ST_AsGeoJSON(ST_MakePoint(-97.191849, 30.161934)), '{9012}'),
(782, 955, 'FM 112 & FM 486', '15400 FM 112', 'description', ST_MakePoint(-97.200211, 30.491579), ST_AsGeoJSON(ST_MakePoint(-97.200211, 30.491579)), '{9017}'),
(783, 956, 'P4030 - Littig near Central Ave', 'P4030 - Littig near Central Ave', 'description', ST_MakePoint(-97.390938, 30.342543), ST_AsGeoJSON(ST_MakePoint(-97.390938, 30.342543)), '{9012}'),
(784, 957, 'P4031 - Pleasant Grove at Roemer Rd', 'P4031 - Pleasant Grove at Roemer Rd', 'description', ST_MakePoint(-97.334602, 30.373798), ST_AsGeoJSON(ST_MakePoint(-97.334602, 30.373798)), '{9012}'),
(785, 958, 'P4032- Old McDade at Pistol Hill Ln', 'P4032- Old McDade at Pistol Hill Ln', 'description', ST_MakePoint(-97.356964, 30.343025), ST_AsGeoJSON(ST_MakePoint(-97.356964, 30.343025)), '{9012}'),
(786, 959, 'COE1008 - Old McDade at East Alamo', 'COE1008 - Old McDade at Pistol Hill Ln', 'description', ST_MakePoint(-97.362442, 30.345583), ST_AsGeoJSON(ST_MakePoint(-97.362442, 30.345583)), '{9012}'),
(787, 960, 'TX1011 - US 290 @ FM 1704', 'TX1011 - US 290 @ FM 1704', 'description', ST_MakePoint(-97.366959, 30.336290), ST_AsGeoJSON(ST_MakePoint(-97.366959, 30.336290)), '{9012}'),
(788, 961, 'COE1009 - Monterrey @ Monterrey Cove', 'COE1009 - Monterrey @ Monterrey Cove', 'description', ST_MakePoint(-97.370682, 30.335878), ST_AsGeoJSON(ST_MakePoint(-97.370682, 30.335878)), '{9012}'),
(789, 962, 'Tower Rd @ Suncrest Rd', 'Travis County, TX', 'description', ST_MakePoint(-97.528809, 30.368069), ST_AsGeoJSON(ST_MakePoint(-97.528809, 30.368069)), '{9010}'),
(790, 963, '7000-blk Blake Manor Rd', 'Travis County, TX', 'description', ST_MakePoint(-97.516068, 30.282986), ST_AsGeoJSON(ST_MakePoint(-97.516068, 30.282986)), '{9010}'),
(791, 964, 'P2043 - 200 Blk Frerich Rd near Nink Rd', 'P2043 - 200 Blk Frerich Rd near Nink Rd', 'description', ST_MakePoint(-97.098808, 30.133135), ST_AsGeoJSON(ST_MakePoint(-97.098808, 30.133135)), '{9012}'),
(792, 965, 'P2044 - 200 Mustang Dr', '200 Blk Mustang Dr @ Alum Creek', 'description', ST_MakePoint(-97.203239, 30.151155), ST_AsGeoJSON(ST_MakePoint(-97.203239, 30.151155)), '{9012}'),
(793, 967, 'P4033 - 500 Mundine Road', 'P4033 - 500 Mundine Rd', 'description', ST_MakePoint(-97.291496, 30.346506), ST_AsGeoJSON(ST_MakePoint(-97.291496, 30.346506)), '{9012}'),
(794, 968, 'P2045 - Antioch @ Rabbs Creek', 'P2045 - Antioch @ Rabbs Creek', 'description', ST_MakePoint(-97.139549, 30.174931), ST_AsGeoJSON(ST_MakePoint(-97.139549, 30.174931)), '{9012}'),
(795, 969, 'TX1012 - 2104 @ Old Pin Oak Creek', 'TX1012 - 2104 @ Old Pin Oak Creek', 'description', ST_MakePoint(-97.087181, 30.081264), ST_AsGeoJSON(ST_MakePoint(-97.087181, 30.081264)), '{9012}'),
(796, 970, 'CR 152 West of CR 140', 'CR152 west of CR140', 'description', ST_MakePoint(-97.629105, 30.693113), ST_AsGeoJSON(ST_MakePoint(-97.629105, 30.693113)), '{9017}'),
(797, 971, 'CR 442', 'CR442', 'description', ST_MakePoint(-97.187691, 30.504276), ST_AsGeoJSON(ST_MakePoint(-97.187691, 30.504276)), '{9017}'),
(798, 972, 'CR 464', 'CR464', 'description', ST_MakePoint(-97.327324, 30.454397), ST_AsGeoJSON(ST_MakePoint(-97.327324, 30.454397)), '{9017}'),
(799, 973, 'CR 467', 'CR467', 'description', ST_MakePoint(-97.296127, 30.452242), ST_AsGeoJSON(ST_MakePoint(-97.296127, 30.452242)), '{9017}'),
(800, 1011, 'Manda Carlson Rd @ New Sweden Church Rd', 'Travis County, TX', 'description', ST_MakePoint(-97.471161, 30.398260), ST_AsGeoJSON(ST_MakePoint(-97.471161, 30.398260)), '{9010}'),
(801, 1013, 'Hogeye Rd @ Bitting School Rd', 'Travis County, TX', 'description', ST_MakePoint(-97.465523, 30.291861), ST_AsGeoJSON(ST_MakePoint(-97.465523, 30.291861)), '{9010}'),
(802, 1015, 'CR 175 / Vista Isle', 'CR175/Vista Isle', 'description', ST_MakePoint(-97.762054, 30.547762), ST_AsGeoJSON(ST_MakePoint(-97.762054, 30.547762)), '{9017}'),
(803, 1019, '15900-blk Fuchs Grove Rd @ Cameron Rd', 'Travis County, TX', 'description', ST_MakePoint(-97.545616, 30.400818), ST_AsGeoJSON(ST_MakePoint(-97.545616, 30.400818)), '{9010}'),
(804, 1020, 'TX1013 - FM 812 @ County Line', 'TX1013 - FM 812 @ County Line', 'description', ST_MakePoint(-97.609650, 30.102629), ST_AsGeoJSON(ST_MakePoint(-97.609650, 30.102629)), '{9012}'),
(805, 1023, 'P4034 - 2100 Blk Upper Elgin River Rd', 'P4034 - 2100 Blk Upper Elgin River Rd', 'description', ST_MakePoint(-97.461067, 30.227066), ST_AsGeoJSON(ST_MakePoint(-97.461067, 30.227066)), '{9012}'),
(806, 1025, '6800-blk Wolf Ln', 'Travis County, TX', 'description', ST_MakePoint(-97.556290, 30.158638), ST_AsGeoJSON(ST_MakePoint(-97.556290, 30.158638)), '{9010}'),
(807, 1026, 'TX1018 - FM 1704 @ Youngs Prarie', 'TX1018 - FM 1704 @ Youngs Prarie', 'description', ST_MakePoint(-97.396027, 30.289129), ST_AsGeoJSON(ST_MakePoint(-97.396027, 30.289129)), '{9012}'),
(808, 1028, '200 Blk Lehman Road', 'City of Kyle', 'description', ST_MakePoint(-97.865913, 29.984184), ST_AsGeoJSON(ST_MakePoint(-97.865913, 29.984184)), '{9016}'),
(809, 1029, 'Scott St @ W 3rd St', 'City of Kyle', 'description', ST_MakePoint(-97.885918, 29.984274), ST_AsGeoJSON(ST_MakePoint(-97.885918, 29.984274)), '{9016}'),
(810, 1033, 'William Pettus Road', 'William Pettus near Tracks', 'description', ST_MakePoint(-97.827408, 29.879990), ST_AsGeoJSON(ST_MakePoint(-97.827408, 29.879990)), '{9011}'),
(811, 1034, 'P4035 - 30070 N. County Line Rd.', 'P4035 - 30070 N. County Line Rd.', 'description', ST_MakePoint(-97.369957, 30.418858), ST_AsGeoJSON(ST_MakePoint(-97.369957, 30.418858)), '{9012}'),
(812, 1035, 'CR 438 West CR 437', 'CR438 west of CR437', 'description', ST_MakePoint(-97.226730, 30.658031), ST_AsGeoJSON(ST_MakePoint(-97.226730, 30.658031)), '{9017}'),
(813, 1036, 'Burleson Manor Rd @ FM 969', 'Travis County, TX', 'description', ST_MakePoint(-97.532005, 30.254326), ST_AsGeoJSON(ST_MakePoint(-97.532005, 30.254326)), '{9010}'),
(814, 1037, 'E Access S of Brent Blvd ', 'City of Kyle ', 'description', ST_MakePoint(-97.866020, 30.002956), ST_AsGeoJSON(ST_MakePoint(-97.866020, 30.002956)), '{9016}'),
(815, 1038, '16600-blk Decker Lake Rd', 'Travis County, TX', 'description', ST_MakePoint(-97.559418, 30.259037), ST_AsGeoJSON(ST_MakePoint(-97.559418, 30.259037)), '{9010}'),
(816, 1039, 'Jacobson Rd @ Elroy Rd', 'Travis County, TX', 'description', ST_MakePoint(-97.618683, 30.137329), ST_AsGeoJSON(ST_MakePoint(-97.618683, 30.137329)), '{9010}'),
(817, 1040, 'CR 147 east of CR 234', 'CR147 east of CR234', 'description', ST_MakePoint(-97.657639, 30.741179), ST_AsGeoJSON(ST_MakePoint(-97.657639, 30.741179)), '{9017}'),
(818, 1041, 'Creek Side Dr @ W Valley Spring Rd', 'Hays County ', 'description', ST_MakePoint(-98.146629, 30.034313), ST_AsGeoJSON(ST_MakePoint(-98.146629, 30.034313)), '{9016}'),
(819, 1042, 'Slaughter Creek Trail @ Fm 1826', 'Travis County, Tx ', 'description', ST_MakePoint(-97.903458, 30.209475), ST_AsGeoJSON(ST_MakePoint(-97.903458, 30.209475)), '{9010}'),
(820, 1043, 'Old Colony Line Road', 'Old Colony Line Road', 'description', ST_MakePoint(-97.535477, 29.855839), ST_AsGeoJSON(ST_MakePoint(-97.535477, 29.855839)), '{9011}'),
(821, 1044, 'Bobwhite', 'Bobwhite', 'description', ST_MakePoint(-97.743202, 29.926085), ST_AsGeoJSON(ST_MakePoint(-97.743202, 29.926085)), '{9011}'),
(822, 1045, 'Mineral Springs Rd', 'Mineral Springs Rd', 'description', ST_MakePoint(-97.687584, 29.776640), ST_AsGeoJSON(ST_MakePoint(-97.687584, 29.776640)), '{9011}'),
(823, 1046, 'Washburn Rd', 'Washburn Rd', 'description', ST_MakePoint(-97.686104, 29.728392), ST_AsGeoJSON(ST_MakePoint(-97.686104, 29.728392)), '{9011}'),
(824, 1047, 'Longhollow Dr', 'Longhollow Dr', 'description', ST_MakePoint(-97.643532, 30.063047), ST_AsGeoJSON(ST_MakePoint(-97.643532, 30.063047)), '{9011}'),
(825, 1048, 'Dickerson Road', 'Dickerson Road', 'description', ST_MakePoint(-97.800499, 29.815166), ST_AsGeoJSON(ST_MakePoint(-97.800499, 29.815166)), '{9011}'),
(826, 1049, 'Acorn Rd', 'Acorn Rd', 'description', ST_MakePoint(-97.730522, 29.785095), ST_AsGeoJSON(ST_MakePoint(-97.730522, 29.785095)), '{9011}'),
(827, 1050, 'Cherryville Parkway', 'Cherryville Parkway', 'description', ST_MakePoint(-97.740112, 29.832033), ST_AsGeoJSON(ST_MakePoint(-97.740112, 29.832033)), '{9011}'),
(828, 1051, 'Rogers Ranch Road', 'Rogers Ranch Road', 'description', ST_MakePoint(-97.722588, 29.978737), ST_AsGeoJSON(ST_MakePoint(-97.722588, 29.978737)), '{9011}'),
(829, 1052, 'Taylorsville Road', 'Taylorsville Road', 'description', ST_MakePoint(-97.453850, 29.863132), ST_AsGeoJSON(ST_MakePoint(-97.453850, 29.863132)), '{9011}'),
(830, 1053, 'Payne Ln', 'Payne Ln', 'description', ST_MakePoint(-97.730827, 29.898817), ST_AsGeoJSON(ST_MakePoint(-97.730827, 29.898817)), '{9011}'),
(831, 1054, 'P2055 - 200 blk Hofferek Rd', 'P2055 - 200 blk Hofferek Rd', 'description', ST_MakePoint(-97.313454, 29.917870), ST_AsGeoJSON(ST_MakePoint(-97.313454, 29.917870)), '{9012}'),
(832, 1055, 'Barth Rd', 'Barth Rd', 'description', ST_MakePoint(-97.640068, 29.962645), ST_AsGeoJSON(ST_MakePoint(-97.640068, 29.962645)), '{9011}'),
(833, 1056, 'Scull Crossing', 'Scull Crossing', 'description', ST_MakePoint(-97.856781, 29.849546), ST_AsGeoJSON(ST_MakePoint(-97.856781, 29.849546)), '{9011}'),
(834, 1057, 'Sandy Fork Rd', 'Sandy Fork Rd', 'description', ST_MakePoint(-97.444473, 29.784872), ST_AsGeoJSON(ST_MakePoint(-97.444473, 29.784872)), '{9011}'),
(835, 1059, 'Young Lane', 'Wells Rd and Four Corners', 'description', ST_MakePoint(-97.584290, 29.821814), ST_AsGeoJSON(ST_MakePoint(-97.584290, 29.821814)), '{9011}'),
(836, 1060, 'Austin St ', 'Austin (CR 122)', 'description', ST_MakePoint(-97.686813, 29.693615), ST_AsGeoJSON(ST_MakePoint(-97.686813, 29.693615)), '{9011}'),
(837, 1061, 'Fifth Street', 'Fifth Street', 'description', ST_MakePoint(-97.784233, 29.891319), ST_AsGeoJSON(ST_MakePoint(-97.784233, 29.891319)), '{9011}'),
(838, 1062, 'Lay Road', 'Lay Road', 'description', ST_MakePoint(-97.657928, 29.858965), ST_AsGeoJSON(ST_MakePoint(-97.657928, 29.858965)), '{9011}'),
(839, 1063, 'Old McMahan Rd', 'Old McMahan @ Star Road', 'description', ST_MakePoint(-97.595230, 29.862389), ST_AsGeoJSON(ST_MakePoint(-97.595230, 29.862389)), '{9011}'),
(840, 1064, 'Rolling Ridge Rd', 'Rolling Ridge Rd', 'description', ST_MakePoint(-97.706573, 29.953789), ST_AsGeoJSON(ST_MakePoint(-97.706573, 29.953789)), '{9011}'),
(841, 1065, 'Farmers Road', 'Farmers Road', 'description', ST_MakePoint(-97.797600, 29.918646), ST_AsGeoJSON(ST_MakePoint(-97.797600, 29.918646)), '{9011}'),
(842, 1066, 'Valley Way Dr', 'Valley Way Dr', 'description', ST_MakePoint(-97.807579, 29.878147), ST_AsGeoJSON(ST_MakePoint(-97.807579, 29.878147)), '{9011}'),
(843, 1067, 'Biggs Road', 'Biggs Road', 'description', ST_MakePoint(-97.603905, 29.699467), ST_AsGeoJSON(ST_MakePoint(-97.603905, 29.699467)), '{9011}'),
(844, 1068, 'FM 1322', 'FM 1322 near Plum Creek', 'description', ST_MakePoint(-97.602592, 29.677752), ST_AsGeoJSON(ST_MakePoint(-97.602592, 29.677752)), '{9011}'),
(845, 1069, 'FM 1322', 'FM 1322 at Rolling Oaks', 'description', ST_MakePoint(-97.592827, 29.748737), ST_AsGeoJSON(ST_MakePoint(-97.592827, 29.748737)), '{9011}'),
(846, 1070, 'Hwy 86', 'Hwy 86 at Plum Creek', 'description', ST_MakePoint(-97.578583, 29.791092), ST_AsGeoJSON(ST_MakePoint(-97.578583, 29.791092)), '{9011}'),
(847, 1071, 'FM 672', 'FM 672 at Plum Creek', 'description', ST_MakePoint(-97.654930, 29.896231), ST_AsGeoJSON(ST_MakePoint(-97.654930, 29.896231)), '{9011}'),
(848, 1072, 'P2047 - 500 Blk St. Delight Rd', 'P2047 - 500 Blk St. Delight Rd', 'description', ST_MakePoint(-97.110825, 30.178963), ST_AsGeoJSON(ST_MakePoint(-97.110825, 30.178963)), '{9012}'),
(849, 1073, 'Ebbon Rd', 'Ebbon Rd at FM1322', 'description', ST_MakePoint(-97.588692, 29.739906), ST_AsGeoJSON(ST_MakePoint(-97.588692, 29.739906)), '{9011}'),
(850, 1079, 'Dale Lane', 'of FM 672', 'description', ST_MakePoint(-97.557838, 29.948521), ST_AsGeoJSON(ST_MakePoint(-97.557838, 29.948521)), '{9011}'),
(851, 1080, 'Cottonwood Trail', '228A', 'description', ST_MakePoint(-97.775963, 29.939159), ST_AsGeoJSON(ST_MakePoint(-97.775963, 29.939159)), '{9011}'),
(852, 1081, 'Old Luling Road', 'CR 213', 'description', ST_MakePoint(-97.663750, 29.832401), ST_AsGeoJSON(ST_MakePoint(-97.663750, 29.832401)), '{9011}'),
(853, 1082, 'Chalk Road', 'CR 152', 'description', ST_MakePoint(-97.439323, 29.750856), ST_AsGeoJSON(ST_MakePoint(-97.439323, 29.750856)), '{9011}'),
(854, 1083, 'River Park Road', 'CR 105', 'description', ST_MakePoint(-97.691940, 29.680948), ST_AsGeoJSON(ST_MakePoint(-97.691940, 29.680948)), '{9011}'),
(855, 1084, 'CR 201', 'CR 201', 'description', ST_MakePoint(-97.978905, 30.734472), ST_AsGeoJSON(ST_MakePoint(-97.978905, 30.734472)), '{9017}'),
(856, 1085, 'IH 35 SB @ Blanco River', 'City of San Marcos ', 'description', ST_MakePoint(-97.898483, 29.911884), ST_AsGeoJSON(ST_MakePoint(-97.898483, 29.911884)), '{9016}'),
(857, 1087, 'TX1014 - Hwy 535 East of Meduna', 'TX1014 - Hwy 535 East of Meduna', 'description', ST_MakePoint(-97.258881, 29.934404), ST_AsGeoJSON(ST_MakePoint(-97.258881, 29.934404)), '{9012}'),
(858, 1089, 'HWY 80 @ Blanco River ', 'City of San Marcos ', 'description', ST_MakePoint(-97.910706, 29.879633), ST_AsGeoJSON(ST_MakePoint(-97.910706, 29.879633)), '{9016}'),
(859, 1090, 'McNeil Creek Road', 'CR 138', 'description', ST_MakePoint(-97.572426, 29.708897), ST_AsGeoJSON(ST_MakePoint(-97.572426, 29.708897)), '{9011}'),
(860, 1091, 'Hommannville Trail', 'CR 179', 'description', ST_MakePoint(-97.664207, 29.985748), ST_AsGeoJSON(ST_MakePoint(-97.664207, 29.985748)), '{9011}'),
(861, 1092, 'HWY 21 @ CR 266', 'City of San Marcos', 'description', ST_MakePoint(-97.895767, 29.882484), ST_AsGeoJSON(ST_MakePoint(-97.895767, 29.882484)), '{9016}'),
(862, 1093, 'Fox Lane', 'CR 198', 'description', ST_MakePoint(-97.567802, 29.832830), ST_AsGeoJSON(ST_MakePoint(-97.567802, 29.832830)), '{9011}'),
(863, 1094, 'St Joseph Street', 'CR 247', 'description', ST_MakePoint(-97.753754, 29.728031), ST_AsGeoJSON(ST_MakePoint(-97.753754, 29.728031)), '{9011}'),
(864, 1095, 'Stairtown Road', 'CR 119', 'description', ST_MakePoint(-97.732597, 29.714302), ST_AsGeoJSON(ST_MakePoint(-97.732597, 29.714302)), '{9011}'),
(865, 1097, 'Old San Antonio @ 1626', 'Old San Antonio @ 1626', 'description', ST_MakePoint(-97.801559, 30.142878), ST_AsGeoJSON(ST_MakePoint(-97.801559, 30.142878)), '{9002}'),
(866, 1099, 'P2048 - 300 Block of Pine Valley', 'P2048 - 300 Block of Pine Valley', 'description', ST_MakePoint(-97.308968, 29.949093), ST_AsGeoJSON(ST_MakePoint(-97.308968, 29.949093)), '{9012}'),
(867, 1100, 'P4036 - Comanche Trl just of FM 969', 'P4036 - Comanche Trl just of FM 969', 'description', ST_MakePoint(-97.464035, 30.226383), ST_AsGeoJSON(ST_MakePoint(-97.464035, 30.226383)), '{9012}'),
(868, 1101, 'IH 35 SB @ San Marcos River', 'City of San Marcos', 'description', ST_MakePoint(-97.931763, 29.874996), ST_AsGeoJSON(ST_MakePoint(-97.931763, 29.874996)), '{9016}'),
(869, 1102, 'P2049 - 100 Blk Kellar Rd', 'P2049 - 100 Blk Kellar Rd', 'description', ST_MakePoint(-97.188866, 30.051336), ST_AsGeoJSON(ST_MakePoint(-97.188866, 30.051336)), '{9012}'),
(870, 1107, '1800 Blk 2nd St', 'Between Ave R & Ave S', 'description', ST_MakePoint(-98.288528, 30.576242), ST_AsGeoJSON(ST_MakePoint(-98.288528, 30.576242)), '{9006}'),
(871, 1108, 'RR 12 @ Blanco River ', 'Hays County ', 'description', ST_MakePoint(-98.088638, 29.993595), ST_AsGeoJSON(ST_MakePoint(-98.088638, 29.993595)), '{9016}'),
(872, 1112, 'Camp Craft Rd at West bank Dr ', ' Travis County, TX ', 'description', ST_MakePoint(-97.815819, 30.276579), ST_AsGeoJSON(ST_MakePoint(-97.815819, 30.276579)), '{9010}'),
(873, 1113, 'Darden Hill Rd @ Low Water Crossing', 'Hays County', 'description', ST_MakePoint(-98.021858, 30.153233), ST_AsGeoJSON(ST_MakePoint(-98.021858, 30.153233)), '{9016}'),
(874, 1115, 'FM 1660 / HWY 29', 'FM 1660, HWY 29', 'description', ST_MakePoint(-97.542717, 30.635281), ST_AsGeoJSON(ST_MakePoint(-97.542717, 30.635281)), '{9017}'),
(875, 1117, 'Garrison Rd @ Onion Creek', 'City of Buda ', 'description', ST_MakePoint(-97.838821, 30.094650), ST_AsGeoJSON(ST_MakePoint(-97.838821, 30.094650)), '{9016}'),
(876, 1118, 'CR 270', 'CR 270', 'description', ST_MakePoint(-97.846596, 30.616421), ST_AsGeoJSON(ST_MakePoint(-97.846596, 30.616421)), '{9017}'),
(877, 1119, 'FM 621 @ HWY 123', 'City of San Marcos', 'description', ST_MakePoint(-97.938522, 29.865286), ST_AsGeoJSON(ST_MakePoint(-97.938522, 29.865286)), '{9016}'),
(878, 1120, 'FM 621 @ Picasso Dr ', 'Hays County ', 'description', ST_MakePoint(-97.918701, 29.844730), ST_AsGeoJSON(ST_MakePoint(-97.918701, 29.844730)), '{9016}'),
(879, 1121, 'Redwood Rd @ Hwy 123', 'City of San Marcos ', 'description', ST_MakePoint(-97.940414, 29.845764), ST_AsGeoJSON(ST_MakePoint(-97.940414, 29.845764)), '{9016}'),
(880, 1122, 'Redwood Rd @ Cottonwood Pkwy', 'City of San Marcos ', 'description', ST_MakePoint(-97.932060, 29.837578), ST_AsGeoJSON(ST_MakePoint(-97.932060, 29.837578)), '{9016}'),
(881, 1123, 'Centerpoint Rd East OF Old Bastrop Hwy (CR 266)', 'Hays County ', 'description', ST_MakePoint(-97.968132, 29.813601), ST_AsGeoJSON(ST_MakePoint(-97.968132, 29.813601)), '{9016}'),
(882, 1124, 'Woodcreek Ranch Rd @ Lone Man Creek Dr', 'Hays County ', 'description', ST_MakePoint(-98.052094, 30.006845), ST_AsGeoJSON(ST_MakePoint(-98.052094, 30.006845)), '{9016}'),
(883, 1127, '11900-Blk Old San Antonio Rd', 'Travis County, TX ', 'description', ST_MakePoint(-97.809334, 30.134632), ST_AsGeoJSON(ST_MakePoint(-97.809334, 30.134632)), '{9010}'),
(884, 1129, '3700-Blk Wyldwood Rd', 'Travis County, TX ', 'description', ST_MakePoint(-94.835587, 32.622650), ST_AsGeoJSON(ST_MakePoint(-94.835587, 32.622650)), '{9010}'),
(885, 1130, '5700-Blk Jesse Bohls Dr', 'Travis County, TX', 'description', ST_MakePoint(-97.563698, 30.436340), ST_AsGeoJSON(ST_MakePoint(-97.563698, 30.436340)), '{9010}'),
(886, 1131, 'Cameron Rd @ Fuchs Grove Ln', 'Travis County, TX', 'description', ST_MakePoint(-97.545593, 30.400906), ST_AsGeoJSON(ST_MakePoint(-97.545593, 30.400906)), '{9010}'),
(887, 1132, 'Cameron Rd @ Schmidt Ln', 'Travis County, TX', 'description', ST_MakePoint(-97.541405, 30.407438), ST_AsGeoJSON(ST_MakePoint(-97.541405, 30.407438)), '{9010}'),
(888, 1133, '7300-Blk Taylor Ln', 'Travis County, TX', 'description', ST_MakePoint(-97.550438, 30.264381), ST_AsGeoJSON(ST_MakePoint(-97.550438, 30.264381)), '{9010}'),
(889, 1134, 'Taylor Ln @ Decker Lake Rd', 'Travis County, TX', 'description', ST_MakePoint(-97.554733, 30.256798), ST_AsGeoJSON(ST_MakePoint(-97.554733, 30.256798)), '{9010}'),
(890, 1135, '14400-Blk Kimbro West', 'Travis County, TX', 'description', ST_MakePoint(-97.482803, 30.376925), ST_AsGeoJSON(ST_MakePoint(-97.482803, 30.376925)), '{9010}'),
(891, 1136, '14900-Blk E US 290 HWY EB', 'Travis County, TX', 'description', ST_MakePoint(-97.479820, 30.351034), ST_AsGeoJSON(ST_MakePoint(-97.479820, 30.351034)), '{9010}'),
(892, 1138, 'E US 290 EB @ Abrahamson Rd', 'Travis County, TX', 'description', ST_MakePoint(-97.467377, 30.351313), ST_AsGeoJSON(ST_MakePoint(-97.467377, 30.351313)), '{9010}'),
(893, 1140, '16300-Blk Littig Rd', 'Travis County, TX', 'description', ST_MakePoint(-97.477806, 30.324608), ST_AsGeoJSON(ST_MakePoint(-97.477806, 30.324608)), '{9010}'),
(894, 1143, 'River Rd at Loma Vista', 'River Rd at Loma Vista', 'description', ST_MakePoint(-98.100533, 29.993029), ST_AsGeoJSON(ST_MakePoint(-98.100533, 29.993029)), '{9002}'),
(895, 1144, '11800-Blk Jones Rd', 'Travis County, TX', 'description', ST_MakePoint(-97.477959, 30.322590), ST_AsGeoJSON(ST_MakePoint(-97.477959, 30.322590)), '{9010}'),
(896, 1147, '15300-Blk Bois D Arc Rd', 'Travis County, TX', 'description', ST_MakePoint(-97.481369, 30.391319), ST_AsGeoJSON(ST_MakePoint(-97.481369, 30.391319)), '{9010}'),
(897, 1148, '17300-Blk FM 969', 'Travis County, TX', 'description', ST_MakePoint(-97.541321, 30.254087), ST_AsGeoJSON(ST_MakePoint(-97.541321, 30.254087)), '{9010}'),
(898, 1149, '15300-blk Jacobson Rd', 'Travis County, TX ', 'description', ST_MakePoint(-97.606773, 30.132109), ST_AsGeoJSON(ST_MakePoint(-97.606773, 30.132109)), '{9010}'),
(899, 1150, '16600-blk Decker Lake Rd', 'Travis County, TX ', 'description', ST_MakePoint(-97.556908, 30.258297), ST_AsGeoJSON(ST_MakePoint(-97.556908, 30.258297)), '{9010}'),
(900, 1151, '8300-blk Linden Rd', 'Travis County, TX', 'description', ST_MakePoint(-97.588615, 30.134829), ST_AsGeoJSON(ST_MakePoint(-97.588615, 30.134829)), '{9010}'),
(901, 1153, 'TX1015 - 1704 Bridge at Wilbarger Creek', 'TX1015 - 1704 Bridge at Wilbarger Creek', 'description', ST_MakePoint(-97.432655, 30.232073), ST_AsGeoJSON(ST_MakePoint(-97.432655, 30.232073)), '{9012}'),
(902, 1165, 'TX1017 - FM 2571 @ Wolf Creek', 'TX1017 - FM 2571 @ Wolf Creek', 'description', ST_MakePoint(-97.220116, 30.020525), ST_AsGeoJSON(ST_MakePoint(-97.220116, 30.020525)), '{9012}'),
(903, 1167, '8500-blk FM 1826', 'Travis County, TX ', 'description', ST_MakePoint(-97.902122, 30.210152), ST_AsGeoJSON(ST_MakePoint(-97.902122, 30.210152)), '{9010}'),
(904, 1168, 'Easley Rd @ Little Piney Creek ', '300 Blk Easley Rd @ Little Piney Creek ', 'description', ST_MakePoint(-97.279053, 29.963112), ST_AsGeoJSON(ST_MakePoint(-97.279053, 29.963112)), '{9012}'),
(905, 1169, 'Convict Hill near Latta', 'Convict Hill near Latta', 'description', ST_MakePoint(-97.850754, 30.217197), ST_AsGeoJSON(ST_MakePoint(-97.850754, 30.217197)), '{9002}'),
(906, 1170, 'P2050 100 Blk Peace Haven Ln', '100 Blk Peace Haven Ln', 'description', ST_MakePoint(-97.257645, 30.096045), ST_AsGeoJSON(ST_MakePoint(-97.257645, 30.096045)), '{9012}'),
(907, 1172, 'P2052 - 480 Blk Kelley Rd E', 'P2052 - 480 Blk Kelley Rd E', 'description', ST_MakePoint(-97.235573, 30.150024), ST_AsGeoJSON(ST_MakePoint(-97.235573, 30.150024)), '{9012}'),
(908, 1173, 'P4037 - Paint Creek and Railroad Track Rd', 'P4037 - Paint Creek and Railroad Track Rd', 'description', ST_MakePoint(-97.142967, 30.218374), ST_AsGeoJSON(ST_MakePoint(-97.142967, 30.218374)), '{9012}'),
(909, 1174, 'P4038 - Lincoln Lake Subdivision', 'P4038 - Lincoln Lake Subdivision', 'description', ST_MakePoint(-97.091125, 30.249611), ST_AsGeoJSON(ST_MakePoint(-97.091125, 30.249611)), '{9012}'),
(910, 1176, '1100 CR 450', '1100 CR 450', 'description', ST_MakePoint(-97.292862, 30.539791), ST_AsGeoJSON(ST_MakePoint(-97.292862, 30.539791)), '{9017}'),
(911, 1177, 'P1017 - Shiloh Rd at S Fitzwilliams Ln', 'P1017- Shiloh Rd at S Fitzwilliams Ln', 'description', ST_MakePoint(-97.358566, 30.092052), ST_AsGeoJSON(ST_MakePoint(-97.358566, 30.092052)), '{9012}'),
(912, 1178, '800 blk CR 139', '800 blk CR139', 'description', ST_MakePoint(-97.537354, 30.489376), ST_AsGeoJSON(ST_MakePoint(-97.537354, 30.489376)), '{9017}'),
(913, 1179, 'CR 123 @ Twin Ridge Pkwy', 'CR123 @ Twin Ridge Pkwy', 'description', ST_MakePoint(-97.604385, 30.528866), ST_AsGeoJSON(ST_MakePoint(-97.604385, 30.528866)), '{9017}'),
(914, 1180, '4000 blk CR405', '4000 blk CR405', 'description', ST_MakePoint(-97.437141, 30.471769), ST_AsGeoJSON(ST_MakePoint(-97.437141, 30.471769)), '{9017}'),
(915, 1181, 'CR406 @ CR407', 'CR406 @ CR407', 'description', ST_MakePoint(-97.418816, 30.502846), ST_AsGeoJSON(ST_MakePoint(-97.418816, 30.502846)), '{9017}'),
(916, 1182, 'CR404', 'CR404', 'description', ST_MakePoint(-97.436241, 30.532572), ST_AsGeoJSON(ST_MakePoint(-97.436241, 30.532572)), '{9017}'),
(917, 1183, 'CR448', 'CR448', 'description', ST_MakePoint(-97.320244, 30.548414), ST_AsGeoJSON(ST_MakePoint(-97.320244, 30.548414)), '{9017}'),
(918, 1184, 'CR421', 'CR421', 'description', ST_MakePoint(-97.201279, 30.693382), ST_AsGeoJSON(ST_MakePoint(-97.201279, 30.693382)), '{9017}'),
(919, 1185, 'CR429', 'CR429', 'description', ST_MakePoint(-97.081200, 30.710455), ST_AsGeoJSON(ST_MakePoint(-97.081200, 30.710455)), '{9017}'),
(920, 1186, 'CR349', 'CR349', 'description', ST_MakePoint(-97.401009, 30.714083), ST_AsGeoJSON(ST_MakePoint(-97.401009, 30.714083)), '{9017}'),
(921, 1187, 'CR 417 @ Turkey Creek', 'CR 417 @ Turkey Creek', 'description', ST_MakePoint(-97.357239, 30.653259), ST_AsGeoJSON(ST_MakePoint(-97.357239, 30.653259)), '{9017}'),
(922, 1188, 'P2054 - KLBJ Rd 65-278 Blk ', 'P2054 - KLBJ Rd 65-278 Blk', 'description', ST_MakePoint(-97.158798, 30.038326), ST_AsGeoJSON(ST_MakePoint(-97.158798, 30.038326)), '{9012}'),
(923, 1189, 'P2055 - KLBJ Rd 65-278 Blk', 'P2055 - KLBJ Rd 65-278 Blk', 'description', ST_MakePoint(-97.168030, 30.041939), ST_AsGeoJSON(ST_MakePoint(-97.168030, 30.041939)), '{9012}'),
(924, 1190, 'P2056 - Alum Creek just South of Gotier Trace Rd', 'P2056 - Alum Creek just South of Gotier Trace Rd', 'description', ST_MakePoint(-97.220306, 30.099607), ST_AsGeoJSON(ST_MakePoint(-97.220306, 30.099607)), '{9012}'),
(925, 1191, 'P2059 - Meduna Rd North of High Crossing Rd', 'P2059 - Meduna Rd North of High Crossing Rd', 'description', ST_MakePoint(-97.250000, 29.927925), ST_AsGeoJSON(ST_MakePoint(-97.250000, 29.927925)), '{9012}'),
(926, 1194, 'CR 226', 'CR226', 'description', ST_MakePoint(-97.814201, 30.836020), ST_AsGeoJSON(ST_MakePoint(-97.814201, 30.836020)), '{9017}'),
(927, 1196, 'FM 32 S OF FM 473', 'Blanco County', 'description', ST_MakePoint(-98.330643, 30.020653), ST_AsGeoJSON(ST_MakePoint(-98.330643, 30.020653)), '{9016}'),
(928, 1197, '900 Blk of Nink Road', '900 Blk of Nink Road', 'description', ST_MakePoint(-97.100548, 30.120358), ST_AsGeoJSON(ST_MakePoint(-97.100548, 30.120358)), '{9012}'),
(929, 1200, 'P2060 - 1000 Blk Saint Delight Rd', 'Approx 1020 Saint Delight', 'description', ST_MakePoint(-97.113388, 30.145144), ST_AsGeoJSON(ST_MakePoint(-97.113388, 30.145144)), '{9012}'),
(930, 1203, 'Schulze Rd, Fayette County', 'Schulze Rd near Guettermann Ehler Rd', 'description', ST_MakePoint(-96.999619, 29.764311), ST_AsGeoJSON(ST_MakePoint(-96.999619, 29.764311)), '{9018}'),
(931, 1204, 'Anders Bottom Rd, Fayette County', 'Anders Bottom Rd - 1 1/4 mi S of FM 155', 'description', ST_MakePoint(-96.826996, 29.830805), ST_AsGeoJSON(ST_MakePoint(-96.826996, 29.830805)), '{9018}'),
(932, 1205, 'Baumgarten Rd, Fayette County', 'Baumgarten Rd near Wolters Rd', 'description', ST_MakePoint(-96.956383, 29.667870), ST_AsGeoJSON(ST_MakePoint(-96.956383, 29.667870)), '{9018}'),
(933, 1206, 'Bilimek Rd, Fayette County', 'Bilimek Rd near Oakland Rd', 'description', ST_MakePoint(-96.878899, 29.676725), ST_AsGeoJSON(ST_MakePoint(-96.878899, 29.676725)), '{9018}'),
(934, 1207, 'Bohuslav Rd, Fayette County', 'Bohuslav Rd near Anders Bottom Rd', 'description', ST_MakePoint(-96.836906, 29.813789), ST_AsGeoJSON(ST_MakePoint(-96.836906, 29.813789)), '{9018}'),
(935, 1208, 'Brandt River Bottom Rd, Fayette County', 'Brandt River Bottom Rd - 3/4 mi NE of FM 155', 'description', ST_MakePoint(-96.782684, 29.824234), ST_AsGeoJSON(ST_MakePoint(-96.782684, 29.824234)), '{9018}'),
(936, 1209, 'Bruno Rd, Fayette County', 'Bruno Rd near FM 956', 'description', ST_MakePoint(-96.949646, 29.745979), ST_AsGeoJSON(ST_MakePoint(-96.949646, 29.745979)), '{9018}'),
(937, 1210, 'Bryant Rd, Fayette County', 'Bryant Rd - 3/4 mi N of IH 10', 'description', ST_MakePoint(-96.969498, 29.703325), ST_AsGeoJSON(ST_MakePoint(-96.969498, 29.703325)), '{9018}'),
(938, 1211, 'Clark Ln, Fayette County', 'Clark Ln near FM 957', 'description', ST_MakePoint(-96.919731, 29.664957), ST_AsGeoJSON(ST_MakePoint(-96.919731, 29.664957)), '{9018}'),
(939, 1212, 'Gebert Rd, Fayette County', 'Gebert Rd between Salem Freyburg Rd &amp; Schulze ', 'description', ST_MakePoint(-97.011337, 29.768200), ST_AsGeoJSON(ST_MakePoint(-97.011337, 29.768200)), '{9018}'),
(940, 1213, 'Guenther Rd, Fayette County', 'Guenther Rd at Lane Pool Creek', 'description', ST_MakePoint(-96.855621, 29.869698), ST_AsGeoJSON(ST_MakePoint(-96.855621, 29.869698)), '{9018}'),
(941, 1215, 'Krischke Rd, Fayette County', 'Krischke Rd near FM 2238', 'description', ST_MakePoint(-96.967438, 29.738708), ST_AsGeoJSON(ST_MakePoint(-96.967438, 29.738708)), '{9018}'),
(942, 1216, 'Lane Pool Rd, Fayette County', 'Lane Pool Rd at Lane Pool Creek', 'description', ST_MakePoint(-96.836411, 29.870905), ST_AsGeoJSON(ST_MakePoint(-96.836411, 29.870905)), '{9018}'),
(943, 1217, 'Lidiak Rd, Fayette County', 'Lidiak Rd - 1/2 mi E of Radhost School Rd', 'description', ST_MakePoint(-96.863083, 29.814957), ST_AsGeoJSON(ST_MakePoint(-96.863083, 29.814957)), '{9018}'),
(944, 1218, 'Loehr Rd, Fayette County', 'Loehr Rd near Mullins Prairie Loop', 'description', ST_MakePoint(-96.808350, 29.852669), ST_AsGeoJSON(ST_MakePoint(-96.808350, 29.852669)), '{9018}'),
(945, 1219, 'Mensik Rd, Fayette County', 'Mensik Rd near Middle Creek Rd', 'description', ST_MakePoint(-96.864502, 29.749830), ST_AsGeoJSON(ST_MakePoint(-96.864502, 29.749830)), '{9018}'),
(946, 1220, 'Munke Rd, Fayette County', 'Munke Rd at Williams Creek', 'description', ST_MakePoint(-96.847633, 29.831059), ST_AsGeoJSON(ST_MakePoint(-96.847633, 29.831059)), '{9018}'),
(947, 1221, 'Oakland Rd, Fayette County', 'Oakland near Bilimek Rd', 'description', ST_MakePoint(-96.876198, 29.669636), ST_AsGeoJSON(ST_MakePoint(-96.876198, 29.669636)), '{9018}'),
(948, 1222, 'Oakland Rd, Fayette County', 'Oakland Rd at East Navidad', 'description', ST_MakePoint(-96.855209, 29.658689), ST_AsGeoJSON(ST_MakePoint(-96.855209, 29.658689)), '{9018}'),
(949, 1223, 'Ohnheiser Kaase Rd, Fayette County', 'Ohnheiser Kaase Rd near Niesner Rd', 'description', ST_MakePoint(-96.952095, 29.795063), ST_AsGeoJSON(ST_MakePoint(-96.952095, 29.795063)), '{9018}'),
(950, 1224, 'Petter Rainosek Loop (south), Fayette County', 'Petter Rainosek Loop (S) near Kruppa Rd', 'description', ST_MakePoint(-96.895187, 29.848938), ST_AsGeoJSON(ST_MakePoint(-96.895187, 29.848938)), '{9018}'),
(951, 1225, 'Schilhab Bottom Loop, Fayette County', 'Schilhab Bottom Loop near FM 2238', 'description', ST_MakePoint(-96.974731, 29.750624), ST_AsGeoJSON(ST_MakePoint(-96.974731, 29.750624)), '{9018}'),
(952, 1226, 'Seidel Rd, Fayette County', 'Seidel Rd at West Navidad Creek', 'description', ST_MakePoint(-96.955742, 29.705790), ST_AsGeoJSON(ST_MakePoint(-96.955742, 29.705790)), '{9018}'),
(953, 1227, 'Seydler Rd, Fayette County', 'Seydler Rd - 1 1/4 mi SE of Brandt River Bottom Rd', 'description', ST_MakePoint(-96.777687, 29.808804), ST_AsGeoJSON(ST_MakePoint(-96.777687, 29.808804)), '{9018}'),
(954, 1228, 'Piano Bridge Rd, Fayette County', 'Piano Bridge Rd at East Navidad', 'description', ST_MakePoint(-96.850853, 29.723860), ST_AsGeoJSON(ST_MakePoint(-96.850853, 29.723860)), '{9018}'),
(955, 1229, 'Bartons Creek Rd, Fayette County', 'Bartons Creek Rd - 3/4 mi S of S Kirtley Rd', 'description', ST_MakePoint(-97.111908, 29.958767), ST_AsGeoJSON(ST_MakePoint(-97.111908, 29.958767)), '{9018}'),
(956, 1230, 'Bell Settlement Rd, Fayette County', 'Bell Settlement Rd near Wendler Rd', 'description', ST_MakePoint(-96.807854, 30.115679), ST_AsGeoJSON(ST_MakePoint(-96.807854, 30.115679)), '{9018}'),
(957, 1231, 'Camelback Rd, Fayette County', 'Camelback Rd at Little Pin Oak', 'description', ST_MakePoint(-97.033607, 30.025095), ST_AsGeoJSON(ST_MakePoint(-97.033607, 30.025095)), '{9018}'),
(958, 1232, 'Davis Rd, Fayette County', 'Davis Rd at Jack Young Creek', 'description', ST_MakePoint(-97.060089, 29.877958), ST_AsGeoJSON(ST_MakePoint(-97.060089, 29.877958)), '{9018}'),
(959, 1233, 'Owl Creek Rd, Fayette County', 'Owl Creek Rd at Rabbs Creek', 'description', ST_MakePoint(-96.893555, 30.049114), ST_AsGeoJSON(ST_MakePoint(-96.893555, 30.049114)), '{9018}'),
(960, 1234, 'Spring Branch Ln, Fayette County', 'Spring Branch Ln at Spring Branch Creek', 'description', ST_MakePoint(-97.017456, 29.987932), ST_AsGeoJSON(ST_MakePoint(-97.017456, 29.987932)), '{9018}'),
(961, 1235, 'West Point Loop, Fayette County', 'West Point Loop at Criswell Creek', 'description', ST_MakePoint(-97.028481, 29.950809), ST_AsGeoJSON(ST_MakePoint(-97.028481, 29.950809)), '{9018}'),
(962, 1236, 'Airport Rd, Fayette County', 'Airport Rd near FM 609', 'description', ST_MakePoint(-96.931297, 29.875782), ST_AsGeoJSON(ST_MakePoint(-96.931297, 29.875782)), '{9018}'),
(963, 1237, 'Burke Rd, Fayette County', 'Burke Rd near FM 2762', 'description', ST_MakePoint(-97.135796, 29.713629), ST_AsGeoJSON(ST_MakePoint(-97.135796, 29.713629)), '{9018}'),
(964, 1238, 'Creamer Creek Rd, Fayette County', 'Creamer Creek Rd at Creamer Creek', 'description', ST_MakePoint(-96.924736, 29.860077), ST_AsGeoJSON(ST_MakePoint(-96.924736, 29.860077)), '{9018}'),
(965, 1239, 'Dozier Rd, Fayette County', 'Dozier Rd at Little Five Mile Creek', 'description', ST_MakePoint(-97.195892, 29.723896), ST_AsGeoJSON(ST_MakePoint(-97.195892, 29.723896)), '{9018}'),
(966, 1240, 'Ehler Grasshoff Rd, Fayette County', 'Ehler Grasshoff Rd at Cold Creek', 'description', ST_MakePoint(-97.043289, 29.742416), ST_AsGeoJSON(ST_MakePoint(-97.043289, 29.742416)), '{9018}'),
(967, 1241, 'Elm Creek Rd, Fayette County', 'Elm Creek Rd at Elm Creek', 'description', ST_MakePoint(-97.278183, 29.775389), ST_AsGeoJSON(ST_MakePoint(-97.278183, 29.775389)), '{9018}'),
(968, 1242, 'Farek Loth Rd, Fayette County', 'Farek Loth Rd near Olle Ln', 'description', ST_MakePoint(-97.030907, 29.720430), ST_AsGeoJSON(ST_MakePoint(-97.030907, 29.720430)), '{9018}'),
(969, 1243, 'Father Anders Loop, Fayette County', 'Father Anders Loop near FM 1115', 'description', ST_MakePoint(-97.255203, 29.754507), ST_AsGeoJSON(ST_MakePoint(-97.255203, 29.754507)), '{9018}'),
(970, 1244, 'Freyburg Engle Rd, Fayette County', 'Freyburg Engle Rd at Cold Creek', 'description', ST_MakePoint(-97.019188, 29.709305), ST_AsGeoJSON(ST_MakePoint(-97.019188, 29.709305)), '{9018}'),
(971, 1245, 'Freyburg Engle Rd, Fayette County', 'Freyburg Engle Rd at Rocky Creek', 'description', ST_MakePoint(-97.021317, 29.703732), ST_AsGeoJSON(ST_MakePoint(-97.021317, 29.703732)), '{9018}'),
(972, 1246, 'Hurlock Rd, Fayette County', 'Hurlock Rd at Buckners Creek', 'description', ST_MakePoint(-97.150253, 29.865511), ST_AsGeoJSON(ST_MakePoint(-97.150253, 29.865511)), '{9018}'),
(973, 1247, 'Jeddo Rd, Fayette County', 'Jeddo Rd at Peach Creek', 'description', ST_MakePoint(-97.254112, 29.818254), ST_AsGeoJSON(ST_MakePoint(-97.254112, 29.818254)), '{9018}'),
(974, 1248, 'Jurica Rd, Fayette County', 'Jurica Rd at Mulberry Creek', 'description', ST_MakePoint(-97.021851, 29.651196), ST_AsGeoJSON(ST_MakePoint(-97.021851, 29.651196)), '{9018}'),
(975, 1250, 'Ladewig Ln, Fayette County', 'Ladewig Ln at Rocky Creek Rd', 'description', ST_MakePoint(-97.039963, 29.701662), ST_AsGeoJSON(ST_MakePoint(-97.039963, 29.701662)), '{9018}'),
(976, 1251, 'Louis Herzik Rd, Fayette County', 'Louis Herzik Rd at Brushy Creek', 'description', ST_MakePoint(-97.026833, 29.680021), ST_AsGeoJSON(ST_MakePoint(-97.026833, 29.680021)), '{9018}'),
(977, 1252, 'Maynard Hallmark Rd, Fayette County', 'Maynard Hallmark Rd at Father Anders Loop', 'description', ST_MakePoint(-97.259644, 29.783844), ST_AsGeoJSON(ST_MakePoint(-97.259644, 29.783844)), '{9018}'),
(978, 1253, 'Mulberry Creek Rd, Fayette County', 'Mulberry Creek Rd at Mulberry Creek', 'description', ST_MakePoint(-97.083008, 29.673367), ST_AsGeoJSON(ST_MakePoint(-97.083008, 29.673367)), '{9018}'),
(979, 1254, 'S Old Smithville Rd, Fayette County', 'S Old Smithville Rd near Cherry Rd', 'description', ST_MakePoint(-97.135643, 29.797997), ST_AsGeoJSON(ST_MakePoint(-97.135643, 29.797997)), '{9018}'),
(980, 1255, 'S Old Smithville Rd, Fayette County', 'S Old Smithville Rd near Holstein Rd', 'description', ST_MakePoint(-97.139442, 29.826315), ST_AsGeoJSON(ST_MakePoint(-97.139442, 29.826315)), '{9018}'),
(981, 1256, 'N Old Smithville Rd, Fayette County', 'N Old Smithville Rd near FM 2237', 'description', ST_MakePoint(-97.133881, 29.851349), ST_AsGeoJSON(ST_MakePoint(-97.133881, 29.851349)), '{9018}'),
(982, 1257, 'Old Waelder Rd, Fayette County', 'Old Waelder Rd near Webb Ln', 'description', ST_MakePoint(-97.185829, 29.694319), ST_AsGeoJSON(ST_MakePoint(-97.185829, 29.694319)), '{9018}'),
(983, 1258, 'E Parker Rd, Fayette County', 'E Parker Rd at Pin Oak Creek', 'description', ST_MakePoint(-97.079895, 29.769745), ST_AsGeoJSON(ST_MakePoint(-97.079895, 29.769745)), '{9018}'),
(984, 1259, 'Parkerville Rd, Fayette County', 'Parkerville Rd at Live Oak Creek', 'description', ST_MakePoint(-97.115257, 29.808664), ST_AsGeoJSON(ST_MakePoint(-97.115257, 29.808664)), '{9018}'),
(985, 1260, 'Pavlica Rd, Fayette County', 'Pavlica Rd - 1/2 mi N of FM 2762', 'description', ST_MakePoint(-97.163322, 29.718809), ST_AsGeoJSON(ST_MakePoint(-97.163322, 29.718809)), '{9018}'),
(986, 1261, 'Pine Springs Rd, Fayette County', 'Pine Springs Rd at Rocky Creek', 'description', ST_MakePoint(-97.052620, 29.709864), ST_AsGeoJSON(ST_MakePoint(-97.052620, 29.709864)), '{9018}'),
(987, 1262, 'Rauder Rd, Fayette County', 'Rauder Rd at Buckners Creek', 'description', ST_MakePoint(-97.153214, 29.870218), ST_AsGeoJSON(ST_MakePoint(-97.153214, 29.870218)), '{9018}'),
(988, 1263, 'Salem Freyburg Rd, Fayette County', 'Salem Freyburg Rd at Cold Creek', 'description', ST_MakePoint(-97.033913, 29.750130), ST_AsGeoJSON(ST_MakePoint(-97.033913, 29.750130)), '{9018}'),
(989, 1264, 'Smith Marek Rd, Fayette County', 'Smith Marek Rd - 1/2 mi N of County Line Rd', 'description', ST_MakePoint(-97.001511, 29.637358), ST_AsGeoJSON(ST_MakePoint(-97.001511, 29.637358)), '{9018}'),
(990, 1265, 'Sparta Field Rd, Fayette County', 'Sparta Field Rd at Pin Oak Creek', 'description', ST_MakePoint(-97.232910, 29.723412), ST_AsGeoJSON(ST_MakePoint(-97.232910, 29.723412)), '{9018}'),
(991, 1267, 'Zimmermann Ln, Fayette County', 'Zimmermann Ln - 1/4 mi SE of FM 609', 'description', ST_MakePoint(-96.942070, 29.841038), ST_AsGeoJSON(ST_MakePoint(-96.942070, 29.841038)), '{9018}'),
(992, 1268, 'Round Top Rd, Fayette County', 'Round Top Rd - 3/4 mi NW of Schoenst Rd', 'description', ST_MakePoint(-96.744064, 30.113024), ST_AsGeoJSON(ST_MakePoint(-96.744064, 30.113024)), '{9018}'),
(993, 1269, 'Round Top Rd, Fayette County', 'Round Top Rd - 1/4 mi SE of Schoenst Rd', 'description', ST_MakePoint(-96.734428, 30.100958), ST_AsGeoJSON(ST_MakePoint(-96.734428, 30.100958)), '{9018}'),
(994, 1271, 'Albers Rd, Fayette County', 'Albers Rd NE of Waldeck Cemetery Rd', 'description', ST_MakePoint(-96.785408, 30.059515), ST_AsGeoJSON(ST_MakePoint(-96.785408, 30.059515)), '{9018}'),
(995, 1272, 'Hills Rd, Fayette County', 'Hills Rd at Carmine Cemetery Rd', 'description', ST_MakePoint(-96.715797, 30.125071), ST_AsGeoJSON(ST_MakePoint(-96.715797, 30.125071)), '{9018}'),
(996, 1273, 'Wunderlich Rd, Fayette County', 'Wunderlich Rd - 1 mi NW of FM 954', 'description', ST_MakePoint(-96.614159, 29.991854), ST_AsGeoJSON(ST_MakePoint(-96.614159, 29.991854)), '{9018}'),
(997, 1274, 'Wunderlich Rd, Fayette County', 'Wunderlich Rd - 1/2 mi NW of FM 954', 'description', ST_MakePoint(-96.612572, 29.983192), ST_AsGeoJSON(ST_MakePoint(-96.612572, 29.983192)), '{9018}'),
(998, 1275, 'Willow Springs Rd, Fayette County', 'Willow Springs Rd at Cummins Creek', 'description', ST_MakePoint(-96.633530, 29.954845), ST_AsGeoJSON(ST_MakePoint(-96.633530, 29.954845)), '{9018}'),
(999, 1276, 'Minarcik Rd, Fayette County', 'Minarcik Rd at Willow Branch', 'description', ST_MakePoint(-96.589134, 29.958265), ST_AsGeoJSON(ST_MakePoint(-96.589134, 29.958265)), '{9018}'),
(1000, 1277, 'Kovar Rd, Fayette County', 'Kovar Rd at Cummins Creek', 'description', ST_MakePoint(-96.624779, 29.931026), ST_AsGeoJSON(ST_MakePoint(-96.624779, 29.931026)), '{9018}'),
(1001, 1278, 'Rek Hill Rd, Fayette County', 'Rek Hill Rd near Josie Ln', 'description', ST_MakePoint(-96.629501, 29.915571), ST_AsGeoJSON(ST_MakePoint(-96.629501, 29.915571)), '{9018}'),
(1002, 1279, 'Brushy Rd, Fayette County', 'Brushy Rd near FM 2503', 'description', ST_MakePoint(-96.662354, 29.877438), ST_AsGeoJSON(ST_MakePoint(-96.662354, 29.877438)), '{9018}'),
(1003, 1280, 'Jurekca Rd, Fayette County', 'Jurekca Rd at Vasut Rd', 'description', ST_MakePoint(-96.703804, 29.893847), ST_AsGeoJSON(ST_MakePoint(-96.703804, 29.893847)), '{9018}'),
(1004, 1281, 'Wolff Rd, Fayette County', 'Wolff Rd - 3/4 mi SW of FM 1457', 'description', ST_MakePoint(-96.655464, 30.061186), ST_AsGeoJSON(ST_MakePoint(-96.655464, 30.061186)), '{9018}'),
(1005, 1282, 'N Nassau Rd, Fayette County', 'N Nassau Rd 3/4/ mi NE of Noak Rd', 'description', ST_MakePoint(-96.645569, 30.037617), ST_AsGeoJSON(ST_MakePoint(-96.645569, 30.037617)), '{9018}'),
(1006, 1283, 'Gebhard Rd, Fayette County', 'Gebhard Rd - 1/2 mi NW of FM 954', 'description', ST_MakePoint(-96.666145, 30.001312), ST_AsGeoJSON(ST_MakePoint(-96.666145, 30.001312)), '{9018}'),
(1007, 1284, 'Gebhard Rd, Fayette County', 'Gebhard Rd - 1/2 mi NW of FM 389', 'description', ST_MakePoint(-96.640785, 30.008059), ST_AsGeoJSON(ST_MakePoint(-96.640785, 30.008059)), '{9018}'),
(1008, 1285, 'Noak Rd, Fayette County', 'Noak Rd near Nassau Rd', 'description', ST_MakePoint(-96.657608, 30.031691), ST_AsGeoJSON(ST_MakePoint(-96.657608, 30.031691)), '{9018}'),
(1009, 1286, 'Kneip Rd, Fayette County', 'Kneip Rd NW of Hackemack Rd', 'description', ST_MakePoint(-96.684494, 30.056654), ST_AsGeoJSON(ST_MakePoint(-96.684494, 30.056654)), '{9018}'),
(1010, 1287, 'Bauer Rd, Fayette County', 'Bauer Rd NW of SH 237', 'description', ST_MakePoint(-96.769791, 29.987169), ST_AsGeoJSON(ST_MakePoint(-96.769791, 29.987169)), '{9018}'),
(1011, 1288, 'Bauer Rd, Fayette County', 'Bauer Rd - 1 mi E of SH 237', 'description', ST_MakePoint(-96.750259, 29.980183), ST_AsGeoJSON(ST_MakePoint(-96.750259, 29.980183)), '{9018}'),
(1012, 1289, 'Biegel Rd, Fayette County', 'Biegel Rd - 3/4 mi NW of FM 955', 'description', ST_MakePoint(-96.727882, 29.872675), ST_AsGeoJSON(ST_MakePoint(-96.727882, 29.872675)), '{9018}'),
(1013, 1291, 'Coufal Rd, Fayette County', 'Coufal Rd - 1 mi NW of SH 159', 'description', ST_MakePoint(-96.648018, 29.951349), ST_AsGeoJSON(ST_MakePoint(-96.648018, 29.951349)), '{9018}'),
(1014, 1292, 'Florida Chapel Rd, Fayette County', 'Florida Chapel Rd - 1/4 mi N of FM 954', 'description', ST_MakePoint(-96.696213, 30.013075), ST_AsGeoJSON(ST_MakePoint(-96.696213, 30.013075)), '{9018}'),
(1015, 1293, 'Halamicek Loop, Fayette County', 'Halamicek Loop (north) near FM 1291', 'description', ST_MakePoint(-96.694817, 29.981316), ST_AsGeoJSON(ST_MakePoint(-96.694817, 29.981316)), '{9018}'),
(1016, 1294, 'Halamicek Loop, Fayette County', 'Halamicek Loop (south) near FM 1291', 'description', ST_MakePoint(-96.709984, 29.986668), ST_AsGeoJSON(ST_MakePoint(-96.709984, 29.986668)), '{9018}'),
(1017, 1295, 'Halstedt Rd, Fayette County', 'Halstedt Rd at Baylor Creek', 'description', ST_MakePoint(-96.774040, 29.911163), ST_AsGeoJSON(ST_MakePoint(-96.774040, 29.911163)), '{9018}'),
(1018, 1296, 'Halstedt Rd, Fayette County', 'Halstedt Rd near Tietjen Rd', 'description', ST_MakePoint(-96.776314, 29.913155), ST_AsGeoJSON(ST_MakePoint(-96.776314, 29.913155)), '{9018}'),
(1019, 1297, 'Hattermann Rd, Fayette County', 'Hattermann Rd - 1/4 mi W of Baumbach Rd', 'description', ST_MakePoint(-96.796333, 29.905788), ST_AsGeoJSON(ST_MakePoint(-96.796333, 29.905788)), '{9018}'),
(1020, 1298, 'Haw Creek Rd, Fayette County', 'Haw Creek Rd near FM 1291', 'description', ST_MakePoint(-96.679878, 29.962914), ST_AsGeoJSON(ST_MakePoint(-96.679878, 29.962914)), '{9018}'),
(1021, 1299, 'Janssen Ln, Fayette County', 'Janssen Ln - 3/4 mi NW of SH 159', 'description', ST_MakePoint(-96.859009, 29.930933), ST_AsGeoJSON(ST_MakePoint(-96.859009, 29.930933)), '{9018}'),
(1022, 1300, 'Joiner Rd, Fayette County', 'Joiner Rd - 3/4 mi S of SH 71', 'description', ST_MakePoint(-96.788010, 29.889730), ST_AsGeoJSON(ST_MakePoint(-96.788010, 29.889730)), '{9018}'),
(1023, 1301, 'Jurecka Rd, Fayette County', 'Jurecka Rd at Ross Creek', 'description', ST_MakePoint(-96.722237, 29.895878), ST_AsGeoJSON(ST_MakePoint(-96.722237, 29.895878)), '{9018}'),
(1024, 1302, 'Kramr Rd, Fayette County', 'Kramr Rd near Ross Prairie Church Rd', 'description', ST_MakePoint(-96.673958, 29.880827), ST_AsGeoJSON(ST_MakePoint(-96.673958, 29.880827)), '{9018}'),
(1025, 1303, 'McCormick Rd, Fayette County', 'McCormick Rd at Clear Creek', 'description', ST_MakePoint(-96.795174, 29.999363), ST_AsGeoJSON(ST_MakePoint(-96.795174, 29.999363)), '{9018}'),
(1026, 1304, 'Rocky Creek Rd, Fayette County', 'Rocky Creek Rd at Ruether Rd', 'description', ST_MakePoint(-96.805496, 29.934692), ST_AsGeoJSON(ST_MakePoint(-96.805496, 29.934692)), '{9018}'),
(1027, 1305, 'Rocky Creek Rd, Fayette County', 'Rocky Creek Rd - 1/4 mi E of SH 71', 'description', ST_MakePoint(-96.841522, 29.913063), ST_AsGeoJSON(ST_MakePoint(-96.841522, 29.913063)), '{9018}'),
(1028, 1306, 'Rocky Creek Rd, Fayette County', 'Rocky Creek Rd - 1 1/2 mi E of SH 71', 'description', ST_MakePoint(-96.821503, 29.913198), ST_AsGeoJSON(ST_MakePoint(-96.821503, 29.913198)), '{9018}'),
(1029, 1307, 'Rocky Creek Rd, Fayette County', 'Rocky Creek Rd at High Hill Creek', 'description', ST_MakePoint(-96.831070, 29.913774), ST_AsGeoJSON(ST_MakePoint(-96.831070, 29.913774)), '{9018}'),
(1030, 1308, 'Rohde Rd, Fayette County', 'Rohde Rd SE of Weyand Rd', 'description', ST_MakePoint(-96.739403, 30.051666), ST_AsGeoJSON(ST_MakePoint(-96.739403, 30.051666)), '{9018}'),
(1031, 1309, 'Roznov Rd, Fayette County', 'Roznov Rd - 3/4 mi SW of FM 1291', 'description', ST_MakePoint(-96.726379, 29.981155), ST_AsGeoJSON(ST_MakePoint(-96.726379, 29.981155)), '{9018}'),
(1032, 1310, 'Sand Rock Rd, Fayette County', 'Sand Rock Rd NW of Wied Rd', 'description', ST_MakePoint(-96.809959, 29.957270), ST_AsGeoJSON(ST_MakePoint(-96.809959, 29.957270)), '{9018}'),
(1033, 1311, 'Shumacher Rd, Fayette County', 'Shumacher Rd near FM 955', 'description', ST_MakePoint(-96.715393, 29.861704), ST_AsGeoJSON(ST_MakePoint(-96.715393, 29.861704)), '{9018}'),
(1034, 1312, 'Shumacher Rd, Fayette County', 'Shumacher Rd at Ellinger Branch', 'description', ST_MakePoint(-96.708549, 29.844414), ST_AsGeoJSON(ST_MakePoint(-96.708549, 29.844414)), '{9018}'),
(1035, 1313, 'Schuster Rd, Fayette County', 'Schuster Rd near FM 2145', 'description', ST_MakePoint(-96.821907, 30.043056), ST_AsGeoJSON(ST_MakePoint(-96.821907, 30.043056)), '{9018}'),
(1036, 1314, 'Teitjen Rd, Fayette County', 'Teitjen Rd - 1/2 mi N of Halstedt Rd', 'description', ST_MakePoint(-96.781181, 29.920481), ST_AsGeoJSON(ST_MakePoint(-96.781181, 29.920481)), '{9018}'),
(1037, 1315, 'Tobias Rd, Fayette County', 'Tobias Rd - 1/2 mi SE of FM 2503', 'description', ST_MakePoint(-96.694000, 29.837164), ST_AsGeoJSON(ST_MakePoint(-96.694000, 29.837164)), '{9018}'),
(1038, 1316, 'Waldeck Cemetery Rd, Fayette County', 'Waldeck Cemetery Rd SE of Albers Rd', 'description', ST_MakePoint(-96.773354, 30.055632), ST_AsGeoJSON(ST_MakePoint(-96.773354, 30.055632)), '{9018}'),
(1039, 1317, 'Schoenst Rd, Fayette County', 'Schoenst Rd - 1/2 mi SW of Round Top Rd', 'description', ST_MakePoint(-96.741203, 30.099192), ST_AsGeoJSON(ST_MakePoint(-96.741203, 30.099192)), '{9018}'),
(1040, 1318, 'Haw Creek Rd, Fayette County', 'Haw Creek Rd at Cummins Creek', 'description', ST_MakePoint(-96.661728, 29.977539), ST_AsGeoJSON(ST_MakePoint(-96.661728, 29.977539)), '{9018}'),
(1041, 1319, 'W Old Lockhart Rd, Fayette County', 'W Old Lockhart Rd west of N Old Smithville Rd', 'description', ST_MakePoint(-97.158577, 29.891462), ST_AsGeoJSON(ST_MakePoint(-97.158577, 29.891462)), '{9018}'),
(1042, 1320, 'Laird Rd, Fayette County', 'Laird Rd NE of Rauch Rd', 'description', ST_MakePoint(-96.814827, 30.015747), ST_AsGeoJSON(ST_MakePoint(-96.814827, 30.015747)), '{9018}'),
(1043, 1321, 'Falke Heinrich Rd, Fayette County', 'Falke Heinrich Rd N of FM 956', 'description', ST_MakePoint(-96.929237, 29.771662), ST_AsGeoJSON(ST_MakePoint(-96.929237, 29.771662)), '{9018}'),
(1044, 1322, 'Demel Rd, Fayette County', 'Demel Rd between FM 615 &amp; Holub Rd', 'description', ST_MakePoint(-96.880470, 29.711819), ST_AsGeoJSON(ST_MakePoint(-96.880470, 29.711819)), '{9018}'),
(1045, 1323, 'Vivial Rd, Fayette County', 'Vivial Rd between Hermis Rd & FM 957', 'description', ST_MakePoint(-96.947975, 29.644331), ST_AsGeoJSON(ST_MakePoint(-96.947975, 29.644331)), '{9018}'),
(1046, 1324, 'Camelback Rd, Fayette County', 'Camelback Rd near Prairie St', 'description', ST_MakePoint(-97.019402, 30.016361), ST_AsGeoJSON(ST_MakePoint(-97.019402, 30.016361)), '{9018}'),
(1047, 1325, 'Davis Rd, Fayette County', 'Davis Rd at FM 154', 'description', ST_MakePoint(-97.043564, 29.850992), ST_AsGeoJSON(ST_MakePoint(-97.043564, 29.850992)), '{9018}'),
(1048, 1326, 'Fritsch Rd, Fayette County', 'Fritsch Rd SE of Ruether Rd', 'description', ST_MakePoint(-96.786438, 29.938890), ST_AsGeoJSON(ST_MakePoint(-96.786438, 29.938890)), '{9018}'),
(1049, 1327, 'Bittner Rd, Fayette County', 'Boehnke Rd', 'description', ST_MakePoint(-97.052383, 29.777975), ST_AsGeoJSON(ST_MakePoint(-97.052383, 29.777975)), '{9018}'),
(1050, 1328, 'Boulton Creek, Fayette County', 'Boulton Creek near FM 154', 'description', ST_MakePoint(-97.043266, 29.833757), ST_AsGeoJSON(ST_MakePoint(-97.043266, 29.833757)), '{9018}'),
(1051, 1329, 'Branecky Rd, Fayette County', 'Branecky Rd - 1/2 mi S of US 90', 'description', ST_MakePoint(-97.151627, 29.683523), ST_AsGeoJSON(ST_MakePoint(-97.151627, 29.683523)), '{9018}'),
(1052, 1330, 'Brown Rd, Fayette County', 'Brown Rd - 1 1/4 mi W of SH 95', 'description', ST_MakePoint(-97.195679, 29.760820), ST_AsGeoJSON(ST_MakePoint(-97.195679, 29.760820)), '{9018}'),
(1053, 1331, 'Cowan Rd, Fayette County', 'Cowan Rd near FM 2762', 'description', ST_MakePoint(-97.174759, 29.735744), ST_AsGeoJSON(ST_MakePoint(-97.174759, 29.735744)), '{9018}'),
(1054, 1332, 'Farek Loth Rd, Fayette County', 'Farek Loth Rd near Ragsdale Rd', 'description', ST_MakePoint(-97.056183, 29.715862), ST_AsGeoJSON(ST_MakePoint(-97.056183, 29.715862)), '{9018}'),
(1055, 1333, 'Klekar Gin Rd, Fayette County', 'Klekar Gin Rd near S Knezek Rd', 'description', ST_MakePoint(-97.051956, 29.668795), ST_AsGeoJSON(ST_MakePoint(-97.051956, 29.668795)), '{9018}'),
(1056, 1334, 'Klekar Gin Rd, Fayette County', 'Klekar Gin Rd near Cook Ln', 'description', ST_MakePoint(-97.041016, 29.667583), ST_AsGeoJSON(ST_MakePoint(-97.041016, 29.667583)), '{9018}'),
(1057, 1335, 'Mach Rd, Fayette County', 'Mach Rd near FM 609', 'description', ST_MakePoint(-96.988739, 29.813374), ST_AsGeoJSON(ST_MakePoint(-96.988739, 29.813374)), '{9018}'),
(1058, 1337, 'W Old Lockhart Rd, Fayette County', 'W Old Lockhart Rd - 1 mi W of Boehnke Rd', 'description', ST_MakePoint(-97.103561, 29.887270), ST_AsGeoJSON(ST_MakePoint(-97.103561, 29.887270)), '{9018}'),
(1059, 1339, 'P3063 Sand Hills @ Sandy Creek', 'P3063 Sand Hills @ Sandy Creek', 'description', ST_MakePoint(-97.378700, 29.930490), ST_AsGeoJSON(ST_MakePoint(-97.378700, 29.930490)), '{9012}'),
(1060, 1340, 'Country Club Drive, Fayette County', 'Country Club', 'description', ST_MakePoint(-96.891785, 29.897743), ST_AsGeoJSON(ST_MakePoint(-96.891785, 29.897743)), '{9018}'),
(1061, 1341, 'River Drive, Fayette County', 'River Drive at Country Club', 'description', ST_MakePoint(-96.890381, 29.896120), ST_AsGeoJSON(ST_MakePoint(-96.890381, 29.896120)), '{9018}'),
(1062, 1344, 'Eilers St, Schulenburg', 'Eilers at West', 'description', ST_MakePoint(-96.910873, 29.684460), ST_AsGeoJSON(ST_MakePoint(-96.910873, 29.684460)), '{9018}'),
(1063, 1350, 'CH Allen Rd, Fayette County', 'CH Allen SW 1291', 'description', ST_MakePoint(-96.698143, 29.951544), ST_AsGeoJSON(ST_MakePoint(-96.698143, 29.951544)), '{9018}'),
(1064, 1351, 'CR 256', 'CR 256', 'description', ST_MakePoint(-97.862946, 30.702238), ST_AsGeoJSON(ST_MakePoint(-97.862946, 30.702238)), '{9017}'),
(1065, 1353, 'Goehring Rd, Fayette County', 'Goehring Rd @ Cummins Creek', 'description', ST_MakePoint(-96.799767, 30.134729), ST_AsGeoJSON(ST_MakePoint(-96.799767, 30.134729)), '{9018}'),
(1066, 1354, 'Kainer Rd, Fayette County', 'Kainer Rd near Baumgarten Rd', 'description', ST_MakePoint(-96.972443, 29.654898), ST_AsGeoJSON(ST_MakePoint(-96.972443, 29.654898)), '{9018}'),
(1067, 1356, '7000-blk Daffan Ln', 'Travis County, TX', 'description', ST_MakePoint(-97.627022, 30.320177), ST_AsGeoJSON(ST_MakePoint(-97.627022, 30.320177)), '{9010}'),
(1068, 1357, '7900-blk Daffan Ln', 'Travis County, TX', 'description', ST_MakePoint(-97.620514, 30.314550), ST_AsGeoJSON(ST_MakePoint(-97.620514, 30.314550)), '{9010}'),
(1069, 1358, '8900-blk Decker Ln', 'Travis County, TX', 'description', ST_MakePoint(-97.609390, 30.320089), ST_AsGeoJSON(ST_MakePoint(-97.609390, 30.320089)), '{9010}'),
(1070, 1359, 'MLK @ Clifford', 'MLK @ Clifford', 'description', ST_MakePoint(-97.707939, 30.281923), ST_AsGeoJSON(ST_MakePoint(-97.707939, 30.281923)), '{9009}'),
(1071, 1360, 'Berkman @ 290', 'Berkman @ 290', 'description', ST_MakePoint(-97.688995, 30.320995), ST_AsGeoJSON(ST_MakePoint(-97.688995, 30.320995)), '{9009}'),
(1072, 1361, 'Red River @ 12th', 'Red River @ 12th', 'description', ST_MakePoint(-97.735596, 30.272472), ST_AsGeoJSON(ST_MakePoint(-97.735596, 30.272472)), '{9009}'),
(1073, 1362, '10291 FM 969, Austin, TX', '10291 FM 969, Austin, TX', 'description', ST_MakePoint(-97.623116, 30.264412), ST_AsGeoJSON(ST_MakePoint(-97.623116, 30.264412)), '{9009}'),
(1074, 1363, 'Cameron Rd &amp; Corona Dr', 'Cameron Rd &amp; Corona Dr', 'description', ST_MakePoint(-97.705025, 30.313068), ST_AsGeoJSON(ST_MakePoint(-97.705025, 30.313068)), '{9009}'),
(1075, 1364, '10600-blk Gregg Ln', 'Travis County, TX', 'description', ST_MakePoint(-97.606178, 30.381409), ST_AsGeoJSON(ST_MakePoint(-97.606178, 30.381409)), '{9010}'),
(1076, 1365, '6900-blk N FM 973', 'Travis County, TX', 'description', ST_MakePoint(-97.595169, 30.283392), ST_AsGeoJSON(ST_MakePoint(-97.595169, 30.283392)), '{9010}'),
(1077, 1366, 'Blue Bluff @ Catherine', 'Travis County, TX', 'description', ST_MakePoint(-97.616997, 30.269400), ST_AsGeoJSON(ST_MakePoint(-97.616997, 30.269400)), '{9010}'),
(1078, 1367, 'Blue Bluff @ FM 969', 'Travis County, TX', 'description', ST_MakePoint(-97.621246, 30.262726), ST_AsGeoJSON(ST_MakePoint(-97.621246, 30.262726)), '{9010}'),
(1079, 1368, '10200-blk FM 969', 'Travis County, TX', 'description', ST_MakePoint(-97.623459, 30.264671), ST_AsGeoJSON(ST_MakePoint(-97.623459, 30.264671)), '{9010}'),
(1080, 1370, 'Rosewood @ Hargrave', 'Rosewood @ Hargrave', 'description', ST_MakePoint(-97.711288, 30.270990), ST_AsGeoJSON(ST_MakePoint(-97.711288, 30.270990)), '{9009}'),
(1081, 1371, '10300-blk N FM 973', 'Travis County, TX', 'description', ST_MakePoint(-97.565536, 30.301477), ST_AsGeoJSON(ST_MakePoint(-97.565536, 30.301477)), '{9010}'),
(1082, 1372, 'N FM 973 @ Murchinson', 'Travis County, TX', 'description', ST_MakePoint(-97.559921, 30.332191), ST_AsGeoJSON(ST_MakePoint(-97.559921, 30.332191)), '{9010}'),
(1083, 1373, 'N FM 973 @ SH 130', 'Travis County, TX', 'description', ST_MakePoint(-97.576569, 30.288204), ST_AsGeoJSON(ST_MakePoint(-97.576569, 30.288204)), '{9010}'),
(1084, 1374, 'CR 385', 'CR 385', 'description', ST_MakePoint(-97.429527, 30.739199), ST_AsGeoJSON(ST_MakePoint(-97.429527, 30.739199)), '{9017}'),
(1085, 1376, 'Fuchs Grove Rd @ Gregg Ln', 'Travis County, TX', 'description', ST_MakePoint(-97.553474, 30.387609), ST_AsGeoJSON(ST_MakePoint(-97.553474, 30.387609)), '{9010}'),
(1086, 1378, 'Wayside Dr @ River Rd', 'Hays County ', 'description', ST_MakePoint(-98.107933, 29.985838), ST_AsGeoJSON(ST_MakePoint(-98.107933, 29.985838)), '{9016}'),
(1087, 1383, 'Baca Loop Fayette County', 'Baca Loop at Hwy 90, Flatonia', 'description', ST_MakePoint(-97.066162, 29.680094), ST_AsGeoJSON(ST_MakePoint(-97.066162, 29.680094)), '{9018}'),
(1088, 1394, 'West Access @ Heldenfels Concrete ', 'Hays County ', 'description', ST_MakePoint(-98.006706, 29.809183), ST_AsGeoJSON(ST_MakePoint(-98.006706, 29.809183)), '{9016}'),
(1089, 1399, 'Redbud Trail East of Westlake Dr', '96 Redbud Trail', 'description', ST_MakePoint(-97.797920, 30.291903), ST_AsGeoJSON(ST_MakePoint(-97.797920, 30.291903)), '{9005}'),
(1090, 1400, 'Laurel Valley Rd at Westlake Dr', '101 Laurel Valley Rd', 'description', ST_MakePoint(-97.799545, 30.291838), ST_AsGeoJSON(ST_MakePoint(-97.799545, 30.291838)), '{9005}'),
(1091, 1401, 'Laurel Valley Rd West of Westlake Dr', '106 Laurel Valley Rd', 'description', ST_MakePoint(-97.801224, 30.292801), ST_AsGeoJSON(ST_MakePoint(-97.801224, 30.292801)), '{9005}'),
(1092, 1402, 'Laurel Valley Rd at Ledgeway St', '400 Laurel Valley Rd', 'description', ST_MakePoint(-97.805611, 30.293880), ST_AsGeoJSON(ST_MakePoint(-97.805611, 30.293880)), '{9005}'),
(1093, 1403, 'Laurel Valley Rd West of Double Fork Rd', '607 Laurel Valley Rd', 'description', ST_MakePoint(-97.808762, 30.294653), ST_AsGeoJSON(ST_MakePoint(-97.808762, 30.294653)), '{9005}'),
(1094, 1404, 'Laurel Valley Rd North of Yaupon Valley Rd', '705 Laurel Valley Rd ', 'description', ST_MakePoint(-97.809998, 30.294134), ST_AsGeoJSON(ST_MakePoint(-97.809998, 30.294134)), '{9005}'),
(1095, 1405, 'Yaupon Valley Rd at Allegro Ln', '1200 Yaupon Valley Rd', 'description', ST_MakePoint(-97.817253, 30.296549), ST_AsGeoJSON(ST_MakePoint(-97.817253, 30.296549)), '{9005}'),
(1096, 1406, 'Eanes Creek at Sundown Pkwy', '1 Sundown Pkwy', 'description', ST_MakePoint(-97.820404, 30.289833), ST_AsGeoJSON(ST_MakePoint(-97.820404, 30.289833)), '{9005}'),
(1097, 1407, 'Eanes Creek at Camp Craft Rd', '301 Camp Craft Rd', 'description', ST_MakePoint(-97.811913, 30.280071), ST_AsGeoJSON(ST_MakePoint(-97.811913, 30.280071)), '{9005}'),
(1098, 1408, 'Eanes Creek at Eanes School Rd', '301 Eanes School Rd', 'description', ST_MakePoint(-97.812881, 30.281258), ST_AsGeoJSON(ST_MakePoint(-97.812881, 30.281258)), '{9005}'),
(1099, 1409, 'Westlake Dr at Hull Cir', '1506 Westlake Dr', 'description', ST_MakePoint(-97.794174, 30.296299), ST_AsGeoJSON(ST_MakePoint(-97.794174, 30.296299)), '{9005}'),
(1100, 1410, 'Westlake Dr at Terrace Mountain Dr', '1628 Westlake Dr.', 'description', ST_MakePoint(-97.796349, 30.300865), ST_AsGeoJSON(ST_MakePoint(-97.796349, 30.300865)), '{9005}'),
(1101, 1411, 'Bee Creek at Westlake Dr.', '1803 Westlake Dr.', 'description', ST_MakePoint(-97.795525, 30.302979), ST_AsGeoJSON(ST_MakePoint(-97.795525, 30.302979)), '{9005}'),
(1102, 1412, 'Terrace Mountain Dr at Spurlock Valley', '600 Terrace Mountain Dr', 'description', ST_MakePoint(-97.799545, 30.302811), ST_AsGeoJSON(ST_MakePoint(-97.799545, 30.302811)), '{9005}'),
(1103, 1413, 'Spurlock Valley', '605 Spurlock Valley', 'description', ST_MakePoint(-97.800575, 30.303293), ST_AsGeoJSON(ST_MakePoint(-97.800575, 30.303293)), '{9005}'),
(1104, 1414, 'Bay West Blvd @ Dry Branch of Pecan Creek', '403 Bay West Blvd', 'description', ST_MakePoint(-98.400703, 30.532116), ST_AsGeoJSON(ST_MakePoint(-98.400703, 30.532116)), '{9005}'),
(1105, 1415, 'Broken Hills Dr West of Buffalo Peak Dr', '100 Broken Hills Dr', 'description', ST_MakePoint(-98.407494, 30.547190), ST_AsGeoJSON(ST_MakePoint(-98.407494, 30.547190)), '{9005}'),
(1106, 1416, 'Douglas Dr East of Apache Tears', '3511 Douglas Dr', 'description', ST_MakePoint(-98.399536, 30.555742), ST_AsGeoJSON(ST_MakePoint(-98.399536, 30.555742)), '{9005}'),
(1107, 1417, 'Hi Circle N @ Slickrock Creek', '617 Hi Cir N', 'description', ST_MakePoint(-98.367409, 30.545195), ST_AsGeoJSON(ST_MakePoint(-98.367409, 30.545195)), '{9005}'),
(1108, 1418, 'Hi Stirrup @ Slickrock Creek', '810 Hi Stirrup', 'description', ST_MakePoint(-98.367561, 30.542070), ST_AsGeoJSON(ST_MakePoint(-98.367561, 30.542070)), '{9005}'),
(1109, 1419, 'Hi Circle S @ Slickrock Creek', '899 Hi Circle S', 'description', ST_MakePoint(-98.366119, 30.537415), ST_AsGeoJSON(ST_MakePoint(-98.366119, 30.537415)), '{9005}'),
(1110, 1420, 'Hi Mesa @ Slickrock Creek', 'Hi Mesa West of Purple Sage', 'description', ST_MakePoint(-98.368713, 30.523552), ST_AsGeoJSON(ST_MakePoint(-98.368713, 30.523552)), '{9005}'),
(1111, 1421, 'Apache Tears ', 'Apache Tears West of Black Hawk', 'description', ST_MakePoint(-98.409851, 30.554749), ST_AsGeoJSON(ST_MakePoint(-98.409851, 30.554749)), '{9005}'),
(1112, 1422, 'Buntline Special @ Tiger Creek', 'Buntline Special South of Dew Drop', 'description', ST_MakePoint(-98.336769, 30.539410), ST_AsGeoJSON(ST_MakePoint(-98.336769, 30.539410)), '{9005}'),
(1113, 1423, 'Dew Drop @ Tiger Creek', 'Dew Drop near Thanksgiving Mountain Rd', 'description', ST_MakePoint(-98.335136, 30.540316), ST_AsGeoJSON(ST_MakePoint(-98.335136, 30.540316)), '{9005}'),
(1114, 1424, 'Thanksgiving Mountain Rd @ Tiger Creek Tributary', 'Thanksgiving Mountain Rd East of Range Rider', 'description', ST_MakePoint(-98.334618, 30.542349), ST_AsGeoJSON(ST_MakePoint(-98.334618, 30.542349)), '{9005}'),
(1115, 1425, 'Dew Drop @ Tiger Creek (W)', 'Dew Drop South of Pinkerton Loop', 'description', ST_MakePoint(-98.340546, 30.538282), ST_AsGeoJSON(ST_MakePoint(-98.340546, 30.538282)), '{9005}'),
(1116, 1426, 'Mountain Dew Rd @ Tiger Creek', '3705 Mountain Dew Rd', 'description', ST_MakePoint(-98.329834, 30.534346), ST_AsGeoJSON(ST_MakePoint(-98.329834, 30.534346)), '{9005}'),
(1117, 1427, 'Pronghorn @ Tiger Creek', 'Pronghorn @ 11th St.', 'description', ST_MakePoint(-98.330391, 30.532995), ST_AsGeoJSON(ST_MakePoint(-98.330391, 30.532995)), '{9005}'),
(1118, 1428, 'Edgegrove @ Bee Caves', 'Travis County, TX', 'description', ST_MakePoint(-97.788307, 30.271288), ST_AsGeoJSON(ST_MakePoint(-97.788307, 30.271288)), '{9010}'),
(1119, 1429, '13400-blk FM 2769', 'Travis County, TX', 'description', ST_MakePoint(-97.861382, 30.445993), ST_AsGeoJSON(ST_MakePoint(-97.861382, 30.445993)), '{9010}'),
(1120, 1430, 'E Morrow St at Chamber Way', 'City of Georgetown', 'description', ST_MakePoint(-97.673347, 30.648214), ST_AsGeoJSON(ST_MakePoint(-97.673347, 30.648214)), '{9015}'),
(1121, 1431, 'Lower Park Rd at Chamber Way', 'City of Georgetown', 'description', ST_MakePoint(-97.672600, 30.647177), ST_AsGeoJSON(ST_MakePoint(-97.672600, 30.647177)), '{9015}'),
(1122, 1432, '118 N Austin Ave', 'City of Georgetown', 'description', ST_MakePoint(-97.669640, 30.657619), ST_AsGeoJSON(ST_MakePoint(-97.669640, 30.657619)), '{9015}'),
(1123, 1433, 'NE Inner Loop at Pecan Branch', 'City of Georgetown', 'description', ST_MakePoint(-97.654427, 30.665009), ST_AsGeoJSON(ST_MakePoint(-97.654427, 30.665009)), '{9015}'),
(1124, 1435, 'Airport Rd at Pecan Branch', 'City of Georgetown', 'description', ST_MakePoint(-97.669922, 30.670174), ST_AsGeoJSON(ST_MakePoint(-97.669922, 30.670174)), '{9015}'),
(1125, 1436, 'Lakeway Dr at Pecan Branch E', 'City of Georgetown', 'description', ST_MakePoint(-97.678024, 30.669321), ST_AsGeoJSON(ST_MakePoint(-97.678024, 30.669321)), '{9015}'),
(1126, 1437, 'Journey Parkway', '2900 Journey Parkway', 'description', ST_MakePoint(-97.797203, 30.561832), ST_AsGeoJSON(ST_MakePoint(-97.797203, 30.561832)), '{9001}'),
(1127, 1438, 'Northwest Blvd at Pecan Branch', 'City of Georgetown', 'description', ST_MakePoint(-97.685280, 30.667620), ST_AsGeoJSON(ST_MakePoint(-97.685280, 30.667620)), '{9015}'),
(1128, 1439, 'Country Club Rd at North Fork San Gabriel', 'City of Georgetown', 'description', ST_MakePoint(-97.696632, 30.653574), ST_AsGeoJSON(ST_MakePoint(-97.696632, 30.653574)), '{9015}'),
(1129, 1440, 'Golf Cart Path', 'City of Georgetown', 'description', ST_MakePoint(-97.696442, 30.653463), ST_AsGeoJSON(ST_MakePoint(-97.696442, 30.653463)), '{9015}'),
(1130, 1441, '13200-blk FM 2769', 'Travis County, TX', 'description', ST_MakePoint(-97.850914, 30.452543), ST_AsGeoJSON(ST_MakePoint(-97.850914, 30.452543)), '{9010}'),
(1131, 1442, 'Blue Hole Park Pedestrian Bridge', 'City of Georgetown', 'description', ST_MakePoint(-97.679306, 30.642992), ST_AsGeoJSON(ST_MakePoint(-97.679306, 30.642992)), '{9015}'),
(1132, 1443, 'E 21st St at Church St', 'City of Georgetown', 'description', ST_MakePoint(-97.672836, 30.624292), ST_AsGeoJSON(ST_MakePoint(-97.672836, 30.624292)), '{9015}'),
(1133, 1444, 'Maple St at West Fork Smith Branch', 'City of Georgetown', 'description', ST_MakePoint(-97.665604, 30.624847), ST_AsGeoJSON(ST_MakePoint(-97.665604, 30.624847)), '{9015}'),
(1134, 1445, 'Pine St near San Jose St', 'City of Georgetown', 'description', ST_MakePoint(-97.667747, 30.625050), ST_AsGeoJSON(ST_MakePoint(-97.667747, 30.625050)), '{9015}'),
(1135, 1446, '2100 Pine St', 'City of Georgetown', 'description', ST_MakePoint(-97.669060, 30.625511), ST_AsGeoJSON(ST_MakePoint(-97.669060, 30.625511)), '{9015}'),
(1136, 1447, 'Greenbranch Dr at Trails End Dr', 'City of Georgetown', 'description', ST_MakePoint(-97.658417, 30.623985), ST_AsGeoJSON(ST_MakePoint(-97.658417, 30.623985)), '{9015}'),
(1137, 1448, 'Greenbranch Dr at Quail Meadow Dr', 'City of Georgetown', 'description', ST_MakePoint(-97.658157, 30.624723), ST_AsGeoJSON(ST_MakePoint(-97.658157, 30.624723)), '{9015}'),
(1138, 1449, 'Greenbranch Dr at Hunters Glen Dr', 'City of Georgetown', 'description', ST_MakePoint(-97.657806, 30.625563), ST_AsGeoJSON(ST_MakePoint(-97.657806, 30.625563)), '{9015}'),
(1139, 1450, 'Quail Valley Dr at W Fork Smith Branch', 'City of Georgetown', 'description', ST_MakePoint(-97.657928, 30.626856), ST_AsGeoJSON(ST_MakePoint(-97.657928, 30.626856)), '{9015}'),
(1140, 1451, 'DB Wood Rd at Mid Fork SG', 'City of Georgetown', 'description', ST_MakePoint(-97.716736, 30.647963), ST_AsGeoJSON(ST_MakePoint(-97.716736, 30.647963)), '{9015}'),
(1141, 1452, 'Patriot Way at Mankins Branch', 'City of Georgetown', 'description', ST_MakePoint(-97.610146, 30.629190), ST_AsGeoJSON(ST_MakePoint(-97.610146, 30.629190)), '{9015}'),
(1142, 1453, 'Patriot Way at Mankins Branch 2', 'City of Georgetown', 'description', ST_MakePoint(-97.612816, 30.625858), ST_AsGeoJSON(ST_MakePoint(-97.612816, 30.625858)), '{9015}'),
(1143, 1454, 'S Austin Ave at Tasus Way', 'City of Georgetown', 'description', ST_MakePoint(-97.680878, 30.620138), ST_AsGeoJSON(ST_MakePoint(-97.680878, 30.620138)), '{9015}'),
(1144, 1455, 'N Austin Ave at Pecan Branch', 'City of Georgetown', 'description', ST_MakePoint(-97.665314, 30.668755), ST_AsGeoJSON(ST_MakePoint(-97.665314, 30.668755)), '{9015}'),
(1145, 1456, 'Stadium Dr at Pecan Branch', 'City of Georgetown', 'description', ST_MakePoint(-97.664528, 30.667238), ST_AsGeoJSON(ST_MakePoint(-97.664528, 30.667238)), '{9015}'),
(1146, 1457, 'Lakeway Dr at Pecan Branch W', 'City of Georgetown', 'description', ST_MakePoint(-97.683746, 30.669878), ST_AsGeoJSON(ST_MakePoint(-97.683746, 30.669878)), '{9015}'),
(1147, 1458, 'Northwest Blvd North of Hedgewood Dr', 'City of Georgetown', 'description', ST_MakePoint(-97.688141, 30.676853), ST_AsGeoJSON(ST_MakePoint(-97.688141, 30.676853)), '{9015}'),
(1148, 1459, 'Flume at N Fork SG River', 'City of Georgetown', 'description', ST_MakePoint(-97.690567, 30.651691), ST_AsGeoJSON(ST_MakePoint(-97.690567, 30.651691)), '{9015}'),
(1149, 1460, 'Pedestrian Bridge at SG Park', 'City of Georgetown', 'description', ST_MakePoint(-97.671524, 30.646799), ST_AsGeoJSON(ST_MakePoint(-97.671524, 30.646799)), '{9015}'),
(1150, 1461, 'River Road Between Leveritts Loop &amp; Rockwood Dr', 'Hays County ', 'description', ST_MakePoint(-98.103745, 29.991608), ST_AsGeoJSON(ST_MakePoint(-98.103745, 29.991608)), '{9016}'),
(1151, 1462, 'Golf Cart Path SW of Oak Tree Dr/Berry Creek Dr', 'City of Georgetown', 'description', ST_MakePoint(-97.672470, 30.705669), ST_AsGeoJSON(ST_MakePoint(-97.672470, 30.705669)), '{9015}'),
(1152, 1463, 'Luna Trl at Logan Ranch Rd', 'City of Georgetown', 'description', ST_MakePoint(-97.686913, 30.694065), ST_AsGeoJSON(ST_MakePoint(-97.686913, 30.694065)), '{9015}'),
(1153, 1464, 'Old Bridge at SG Park', 'City of Georgetown', 'description', ST_MakePoint(-97.664444, 30.652023), ST_AsGeoJSON(ST_MakePoint(-97.664444, 30.652023)), '{9015}'),
(1154, 1465, 'E 6th St at Ash St', 'City of Georgetown', 'description', ST_MakePoint(-97.673187, 30.638376), ST_AsGeoJSON(ST_MakePoint(-97.673187, 30.638376)), '{9015}'),
(1155, 1466, 'E 5th St at Ash St', 'City of Georgetown', 'description', ST_MakePoint(-97.673233, 30.639217), ST_AsGeoJSON(ST_MakePoint(-97.673233, 30.639217)), '{9015}'),
(1156, 1467, '111 N College St', 'City of Georgetown', 'description', ST_MakePoint(-97.672211, 30.643299), ST_AsGeoJSON(ST_MakePoint(-97.672211, 30.643299)), '{9015}'),
(1157, 1468, 'Blue Hole Park Rd East', 'City of Georgetown', 'description', ST_MakePoint(-97.679092, 30.642372), ST_AsGeoJSON(ST_MakePoint(-97.679092, 30.642372)), '{9015}'),
(1158, 1469, 'Blue Hole Park Rd West', 'City of Georgetown', 'description', ST_MakePoint(-97.682266, 30.642031), ST_AsGeoJSON(ST_MakePoint(-97.682266, 30.642031)), '{9015}'),
(1159, 1470, 'N College St at WL Walden Dr', 'City of Georgetown', 'description', ST_MakePoint(-97.665733, 30.650404), ST_AsGeoJSON(ST_MakePoint(-97.665733, 30.650404)), '{9015}'),
(1160, 1471, 'E Morrow St (lower)', 'City of Georgetown', 'description', ST_MakePoint(-97.663879, 30.653698), ST_AsGeoJSON(ST_MakePoint(-97.663879, 30.653698)), '{9015}'),
(1161, 1472, 'Spring Valley Rd at Starview Dr', 'City of Georgetown', 'description', ST_MakePoint(-97.701103, 30.654078), ST_AsGeoJSON(ST_MakePoint(-97.701103, 30.654078)), '{9015}'),
(1162, 1474, 'Dry Creek Road', 'Dry Creek Road', 'description', ST_MakePoint(-97.653114, 29.919506), ST_AsGeoJSON(ST_MakePoint(-97.653114, 29.919506)), '{9011}'),
(1163, 1475, '7400-blk Elroy Rd', 'Travis County, TX', 'description', ST_MakePoint(-97.629898, 30.149193), ST_AsGeoJSON(ST_MakePoint(-97.629898, 30.149193)), '{9010}'),
(1164, 1476, 'TX1018 Park Road 1A @ Copperas Creek', 'TX1018 Park Road 1A @ Copperas Creek', 'description', ST_MakePoint(-97.272743, 30.100201), ST_AsGeoJSON(ST_MakePoint(-97.272743, 30.100201)), '{9012}'),
(1165, 1477, '9200-blk N FM 973', 'Travis County, TX', 'description', ST_MakePoint(-97.567200, 30.298935), ST_AsGeoJSON(ST_MakePoint(-97.567200, 30.298935)), '{9010}'),
(1166, 1479, '12800-blk Lexington', 'Travis County, TX', 'description', ST_MakePoint(-97.555908, 30.349340), ST_AsGeoJSON(ST_MakePoint(-97.555908, 30.349340)), '{9010}'),
(1167, 1483, 'RR 12 & Sports Park Rd ', 'Hays County ', 'description', ST_MakePoint(-98.086433, 30.185272), ST_AsGeoJSON(ST_MakePoint(-98.086433, 30.185272)), '{9016}'),
(1168, 1484, 'RR 12 & Storm Ranch Rd ', 'Hays County ', 'description', ST_MakePoint(-98.095993, 30.102058), ST_AsGeoJSON(ST_MakePoint(-98.095993, 30.102058)), '{9016}'),
(1169, 1485, 'W Hwy 290 @ McGregor LN ', 'Hays County ', 'description', ST_MakePoint(-98.143745, 30.206472), ST_AsGeoJSON(ST_MakePoint(-98.143745, 30.206472)), '{9016}'),
(1170, 1488, 'R O Dr @ Bee Creek Rd', 'Travis County, TX', 'description', ST_MakePoint(-98.038773, 30.368221), ST_AsGeoJSON(ST_MakePoint(-98.038773, 30.368221)), '{9010}'),
(1171, 1490, 'Scudder Ln @ RR 12', 'Hays County ', 'description', ST_MakePoint(-98.104034, 30.013184), ST_AsGeoJSON(ST_MakePoint(-98.104034, 30.013184)), '{9016}'),
(1172, 1491, 'Cypress Crk @ RR 12', 'Hays County ', 'description', ST_MakePoint(-98.097603, 29.996849), ST_AsGeoJSON(ST_MakePoint(-98.097603, 29.996849)), '{9016}'),
(1173, 1492, 'Goforth Rd @ Cotton Gin Rd', 'Hays County ', 'description', ST_MakePoint(-97.834625, 29.999376), ST_AsGeoJSON(ST_MakePoint(-97.834625, 29.999376)), '{9016}'),
(1174, 1493, '300 Block of Mill Race Ln ', 'Hays County ', 'description', ST_MakePoint(-98.093407, 29.999655), ST_AsGeoJSON(ST_MakePoint(-98.093407, 29.999655)), '{9016}'),
(1175, 1494, 'Yarrington Rd @ Hwy 21', 'Hays County', 'description', ST_MakePoint(-97.849213, 29.915997), ST_AsGeoJSON(ST_MakePoint(-97.849213, 29.915997)), '{9016}'),
(1176, 1496, 'West Access @ Kohlers Xing', 'Hays County', 'description', ST_MakePoint(-97.851273, 30.027210), ST_AsGeoJSON(ST_MakePoint(-97.851273, 30.027210)), '{9016}'),
(1177, 1497, 'FM 1626 N OF FM 967', 'Hays County ', 'description', ST_MakePoint(-97.875053, 30.099247), ST_AsGeoJSON(ST_MakePoint(-97.875053, 30.099247)), '{9016}'),
(1178, 1498, 'Old Bastrop Hwy @ Hwy 123', 'City of San Marcos', 'description', ST_MakePoint(-97.942131, 29.830742), ST_AsGeoJSON(ST_MakePoint(-97.942131, 29.830742)), '{9016}'),
(1179, 1499, 'FM 150 @ Moss Rose ln ', 'Hays County ', 'description', ST_MakePoint(-97.989655, 30.057116), ST_AsGeoJSON(ST_MakePoint(-97.989655, 30.057116)), '{9016}'),
(1180, 1500, 'FM 1626 @ Cole Springs Rd', 'Hays County ', 'description', ST_MakePoint(-97.874641, 30.080069), ST_AsGeoJSON(ST_MakePoint(-97.874641, 30.080069)), '{9016}'),
(1181, 1501, '2600-blk Frate Barker', 'Travis County, TX ', 'description', ST_MakePoint(-97.852180, 30.149420), ST_AsGeoJSON(ST_MakePoint(-97.852180, 30.149420)), '{9010}'),
(1182, 1502, 'Garlic Creek Dr @ Talley Lp', 'City of Buda ', 'description', ST_MakePoint(-97.858871, 30.099506), ST_AsGeoJSON(ST_MakePoint(-97.858871, 30.099506)), '{9016}'),
(1183, 1504, 'FM 2770 @ Buda Fire Station #1', 'City of Buda ', 'description', ST_MakePoint(-97.853378, 30.074072), ST_AsGeoJSON(ST_MakePoint(-97.853378, 30.074072)), '{9016}'),
(1184, 1505, 'Whitetail Dr@ Hunter Rd ', 'Hays County', 'description', ST_MakePoint(-98.003174, 29.825994), ST_AsGeoJSON(ST_MakePoint(-98.003174, 29.825994)), '{9016}'),
(1185, 1506, 'Windy Hill Rd @ East Access ', 'City of Kyle', 'description', ST_MakePoint(-97.844795, 30.035791), ST_AsGeoJSON(ST_MakePoint(-97.844795, 30.035791)), '{9016}'),
(1186, 1508, '5800 Block FM 2770', 'Hays County ', 'description', ST_MakePoint(-97.889923, 30.024014), ST_AsGeoJSON(ST_MakePoint(-97.889923, 30.024014)), '{9016}'),
(1187, 1509, 'Waterleaf Blvd @ FM 150', 'City of Kyle ', 'description', ST_MakePoint(-97.845245, 29.961163), ST_AsGeoJSON(ST_MakePoint(-97.845245, 29.961163)), '{9016}'),
(1188, 1510, 'FM 1966 @ Hwy 21', 'Caldwell County ', 'description', ST_MakePoint(-97.835999, 29.922729), ST_AsGeoJSON(ST_MakePoint(-97.835999, 29.922729)), '{9016}'),
(1189, 1512, 'Wonder World Dr South of Stagecoach Trl ', 'City of San Marcos', 'description', ST_MakePoint(-97.959061, 29.862103), ST_AsGeoJSON(ST_MakePoint(-97.959061, 29.862103)), '{9016}'),
(1190, 1513, 'High Rd @ Hwy 21', 'Hays County ', 'description', ST_MakePoint(-97.778000, 29.963634), ST_AsGeoJSON(ST_MakePoint(-97.778000, 29.963634)), '{9016}'),
(1191, 1514, '6700-blk fm 1327', 'Travis county,TX', 'description', ST_MakePoint(-97.724808, 30.090246), ST_AsGeoJSON(ST_MakePoint(-97.724808, 30.090246)), '{9010}'),
(1192, 1515, 'Hwy 21 @ Cotton Gin Rd ', 'Hays County ', 'description', ST_MakePoint(-97.786476, 29.957630), ST_AsGeoJSON(ST_MakePoint(-97.786476, 29.957630)), '{9016}'),
(1193, 1516, 'Aquarena Springs Dr @Sessom Dr ', 'City of San Marcos', 'description', ST_MakePoint(-97.934532, 29.888977), ST_AsGeoJSON(ST_MakePoint(-97.934532, 29.888977)), '{9016}'),
(1194, 1517, '6800-blk mc kinney Falls Pkwy', 'Travis County, TX ', 'description', ST_MakePoint(-97.722099, 30.172237), ST_AsGeoJSON(ST_MakePoint(-97.722099, 30.172237)), '{9010}'),
(1195, 1518, 'Moore St @ Oscar Smith St ', 'City of San Marcos', 'description', ST_MakePoint(-97.949593, 29.885239), ST_AsGeoJSON(ST_MakePoint(-97.949593, 29.885239)), '{9016}'),
(1196, 1519, 'River Rd @ Cape Rd', 'City of San Marcos', 'description', ST_MakePoint(-97.927925, 29.869963), ST_AsGeoJSON(ST_MakePoint(-97.927925, 29.869963)), '{9016}'),
(1197, 1520, 'FM 1826 @ Towering Cedar Dr ', 'Hays County ', 'description', ST_MakePoint(-98.002426, 30.139467), ST_AsGeoJSON(ST_MakePoint(-98.002426, 30.139467)), '{9016}'),
(1198, 1521, 'Jackman St @ Gravel St', 'City of San Marcos', 'description', ST_MakePoint(-97.943306, 29.875898), ST_AsGeoJSON(ST_MakePoint(-97.943306, 29.875898)), '{9016}'),
(1199, 1522, '300 Block LBJ Dr', 'City of San Marcos', 'description', ST_MakePoint(-97.939552, 29.879135), ST_AsGeoJSON(ST_MakePoint(-97.939552, 29.879135)), '{9016}'),
(1200, 1523, 'Post Rd @ Uhland Rd', 'City of San Marcos', 'description', ST_MakePoint(-97.918823, 29.899097), ST_AsGeoJSON(ST_MakePoint(-97.918823, 29.899097)), '{9016}'),
(1201, 1524, '1500 Block IH35 N', 'City of San Marcos', 'description', ST_MakePoint(-97.979225, 29.833261), ST_AsGeoJSON(ST_MakePoint(-97.979225, 29.833261)), '{9016}'),
(1202, 1525, 'Hunter Rd @ Foxtail Run', 'City of San Marcos', 'description', ST_MakePoint(-97.969528, 29.857412), ST_AsGeoJSON(ST_MakePoint(-97.969528, 29.857412)), '{9016}'),
(1203, 1527, 'Hunter Rd @ McCarty Ln', 'City of San Marcos ', 'description', ST_MakePoint(-97.980110, 29.846466), ST_AsGeoJSON(ST_MakePoint(-97.980110, 29.846466)), '{9016}'),
(1204, 1528, 'FM 1826 @ FM 967', 'Hays County', 'description', ST_MakePoint(-98.010147, 30.131914), ST_AsGeoJSON(ST_MakePoint(-98.010147, 30.131914)), '{9016}'),
(1205, 1529, 'Thorpe Ln @ Big HEB', 'City of San Marcos ', 'description', ST_MakePoint(-97.925415, 29.886112), ST_AsGeoJSON(ST_MakePoint(-97.925415, 29.886112)), '{9016}'),
(1206, 1530, 'High Rd @ GoForth Rd ', 'Hays County ', 'description', ST_MakePoint(-97.820251, 29.999285), ST_AsGeoJSON(ST_MakePoint(-97.820251, 29.999285)), '{9016}'),
(1207, 1531, 'Cheatham St @ Rio Vista Park ', 'City of San Marcos', 'description', ST_MakePoint(-97.933548, 29.877554), ST_AsGeoJSON(ST_MakePoint(-97.933548, 29.877554)), '{9016}'),
(1208, 1532, 'RR 12 @ Baptist Academy', 'Hays County ', 'description', ST_MakePoint(-97.991524, 29.903349), ST_AsGeoJSON(ST_MakePoint(-97.991524, 29.903349)), '{9016}'),
(1209, 1533, '7800-blk Burleson rd', 'Travis County, TX ', 'description', ST_MakePoint(-97.695152, 30.188860), ST_AsGeoJSON(ST_MakePoint(-97.695152, 30.188860)), '{9010}'),
(1210, 1534, 'Hopkins ST @ San Antonio ST', 'City of San Marcos', 'description', ST_MakePoint(-97.945457, 29.882484), ST_AsGeoJSON(ST_MakePoint(-97.945457, 29.882484)), '{9016}'),
(1211, 1535, 'HWY 21@ Gary Job CORP', 'City of San Marcos', 'description', ST_MakePoint(-97.890671, 29.885975), ST_AsGeoJSON(ST_MakePoint(-97.890671, 29.885975)), '{9016}'),
(1212, 1536, 'FM 2770 @ Cement Plant Rd', 'Hays County ', 'description', ST_MakePoint(-97.857071, 30.059864), ST_AsGeoJSON(ST_MakePoint(-97.857071, 30.059864)), '{9016}'),
(1213, 1537, 'FM 2770 @ Meadow Woods Dr', 'Hays County ', 'description', ST_MakePoint(-97.889709, 30.020615), ST_AsGeoJSON(ST_MakePoint(-97.889709, 30.020615)), '{9016}'),
(1214, 1538, 'Post Rd @ West Access ', 'City of Kyle', 'description', ST_MakePoint(-97.878143, 29.956236), ST_AsGeoJSON(ST_MakePoint(-97.878143, 29.956236)), '{9016}'),
(1215, 1540, 'Us 183/SH 130', 'Travis County, TX', 'description', ST_MakePoint(-97.690643, 30.056627), ST_AsGeoJSON(ST_MakePoint(-97.690643, 30.056627)), '{9010}'),
(1216, 1542, 'RR 12 @ Hugo Rd ', 'Hays County', 'description', ST_MakePoint(-98.048515, 29.916479), ST_AsGeoJSON(ST_MakePoint(-98.048515, 29.916479)), '{9016}'),
(1217, 1544, '10200-blk N 973', 'Travis County, TX ', 'description', ST_MakePoint(-97.564491, 30.309437), ST_AsGeoJSON(ST_MakePoint(-97.564491, 30.309437)), '{9010}'),
(1218, 1545, 'Palomino Rd @ Foster Pl', 'Hays County ', 'description', ST_MakePoint(-97.800377, 30.023178), ST_AsGeoJSON(ST_MakePoint(-97.800377, 30.023178)), '{9016}'),
(1219, 1546, '8700-blk Lockwood', 'Travis County, TX', 'description', ST_MakePoint(-97.522331, 30.304361), ST_AsGeoJSON(ST_MakePoint(-97.522331, 30.304361)), '{9010}'),
(1220, 1547, '7100-blk Ross rd ', 'Travis County, TX', 'description', ST_MakePoint(-97.633141, 30.169382), ST_AsGeoJSON(ST_MakePoint(-97.633141, 30.169382)), '{9010}'),
(1221, 1548, 'HWY 80 @ River Rd ', 'City of San Marcos', 'description', ST_MakePoint(-97.913010, 29.880709), ST_AsGeoJSON(ST_MakePoint(-97.913010, 29.880709)), '{9016}'),
(1222, 1549, 'RR 12 @ Wimberley Glass Works ', 'Hays County', 'description', ST_MakePoint(-98.048561, 29.916443), ST_AsGeoJSON(ST_MakePoint(-98.048561, 29.916443)), '{9016}'),
(1223, 1550, 'Hero Way and CR 270', 'Hero Way and CR 270', 'description', ST_MakePoint(-97.830788, 30.589802), ST_AsGeoJSON(ST_MakePoint(-97.830788, 30.589802)), '{9001}'),
(1224, 1553, 'University Dr @ CM Allen Pkwy ', 'City of San Marcos', 'description', ST_MakePoint(-97.936935, 29.885935), ST_AsGeoJSON(ST_MakePoint(-97.936935, 29.885935)), '{9016}'),
(1225, 1554, 'River Rd @ Aquarena Springs Rd', 'City of San Marcos', 'description', ST_MakePoint(-97.900673, 29.893599), ST_AsGeoJSON(ST_MakePoint(-97.900673, 29.893599)), '{9016}'),
(1226, 1555, 'N LBJ Dr @ W Sessom Dr', 'City of San Marcos', 'description', ST_MakePoint(-97.941353, 29.891516), ST_AsGeoJSON(ST_MakePoint(-97.941353, 29.891516)), '{9016}'),
(1227, 1556, 'TX1020 Hwy 71 at Berdoll', 'TX1020 Hwy 71 at Berdoll', 'description', ST_MakePoint(-97.511711, 30.166477), ST_AsGeoJSON(ST_MakePoint(-97.511711, 30.166477)), '{9012}'),
(1228, 1557, 'Old Stagecoach Rd @ Cemetary', 'Hays County', 'description', ST_MakePoint(-97.898697, 29.963764), ST_AsGeoJSON(ST_MakePoint(-97.898697, 29.963764)), '{9016}'),
(1229, 1558, 'GoForth Rd N of Mondragon Ln', 'Hays County ', 'description', ST_MakePoint(-97.805763, 30.020725), ST_AsGeoJSON(ST_MakePoint(-97.805763, 30.020725)), '{9016}'),
(1230, 1559, 'Green Meadows Ln @ Subdivision Park', 'City of Buda', 'description', ST_MakePoint(-97.815659, 30.062613), ST_AsGeoJSON(ST_MakePoint(-97.815659, 30.062613)), '{9016}'),
(1231, 1560, 'RR 12 @ Rightwater Preserve ', 'Hays County ', 'description', ST_MakePoint(-98.089737, 30.145210), ST_AsGeoJSON(ST_MakePoint(-98.089737, 30.145210)), '{9016}'),
(1232, 1561, 'TX1021 1704 at 969', 'TX1021 1704 @ 969', 'description', ST_MakePoint(-97.445938, 30.211784), ST_AsGeoJSON(ST_MakePoint(-97.445938, 30.211784)), '{9012}'),
(1233, 1562, 'Caldwell Ln @ River Timber Dr', 'Travis County, TX', 'description', ST_MakePoint(-97.535400, 30.219641), ST_AsGeoJSON(ST_MakePoint(-97.535400, 30.219641)), '{9010}'),
(1234, 1563, 'TX1022 1704 @ VFW', 'TX1022 1st blk of 1704 ', 'description', ST_MakePoint(-97.367043, 30.335829), ST_AsGeoJSON(ST_MakePoint(-97.367043, 30.335829)), '{9012}'),
(1235, 1565, 'COE1010 Williams St', 'COE1010 400 Blk Williams St', 'description', ST_MakePoint(-97.374283, 30.343109), ST_AsGeoJSON(ST_MakePoint(-97.374283, 30.343109)), '{9012}'),
(1236, 1566, 'RR 12 @ Little Barton Creek ', 'Hays County ', 'description', ST_MakePoint(-98.061050, 30.245073), ST_AsGeoJSON(ST_MakePoint(-98.061050, 30.245073)), '{9016}'),
(1237, 1567, '1116 Block Red Hawk Rd', 'Hays County ', 'description', ST_MakePoint(-98.028770, 30.005936), ST_AsGeoJSON(ST_MakePoint(-98.028770, 30.005936)), '{9016}'),
(1238, 1568, '1000 Block Lime Kiln Rd ', 'Hays County ', 'description', ST_MakePoint(-97.933418, 29.916721), ST_AsGeoJSON(ST_MakePoint(-97.933418, 29.916721)), '{9016}'),
(1239, 1569, 'TX1023 200 Blk Hwy 95', 'TX1023 200 Blk Hwy 95', 'description', ST_MakePoint(-97.361771, 30.333887), ST_AsGeoJSON(ST_MakePoint(-97.361771, 30.333887)), '{9012}'),
(1240, 1570, 'P4040 Lower Elgin @ 969', 'P4040 Lower Elgin River Rd @ 969', 'description', ST_MakePoint(-97.427040, 30.196119), ST_AsGeoJSON(ST_MakePoint(-97.427040, 30.196119)), '{9012}'),
(1241, 1571, 'P3064 S Pope Bend @ Lois Ln', 'P3064 S Pope Bend @ Lois Ln', 'description', ST_MakePoint(-97.478523, 30.135187), ST_AsGeoJSON(ST_MakePoint(-97.478523, 30.135187)), '{9012}'),
(1242, 1573, 'Union Street', '1730 Union St.', 'description', ST_MakePoint(-97.841156, 30.558001), ST_AsGeoJSON(ST_MakePoint(-97.841156, 30.558001)), '{9001}'),
(1243, 1574, 'TX1024 1209 @ Bluebonnet Elem', 'TX1024 1209 @ Bluebonnet Elem', 'description', ST_MakePoint(-97.428055, 30.133759), ST_AsGeoJSON(ST_MakePoint(-97.428055, 30.133759)), '{9012}'),
(1244, 1575, '1660 West of 95', '1660 West of 95', 'description', ST_MakePoint(-97.437660, 30.476223), ST_AsGeoJSON(ST_MakePoint(-97.437660, 30.476223)), '{9017}'),
(1245, 1576, 'TX1025 812 @ Hwy 21', 'TX1025 812 @ Hwy 21', 'description', ST_MakePoint(-97.572433, 30.071671), ST_AsGeoJSON(ST_MakePoint(-97.572433, 30.071671)), '{9012}'),
(1246, 1577, 'TX1026 Hwy 21 @ Mt. Olive', 'TX1026 Hwy 21 @ Mt. Olive', 'description', ST_MakePoint(-97.418625, 30.110399), ST_AsGeoJSON(ST_MakePoint(-97.418625, 30.110399)), '{9012}'),
(1247, 1578, 'Brushy Crk &amp; Champion Park', '3830 Brushy Creek Rd', 'description', ST_MakePoint(-97.762207, 30.511795), ST_AsGeoJSON(ST_MakePoint(-97.762207, 30.511795)), '{9017}'),
(1248, 1579, 'Bebee RD @ Fountain Grove Dr', 'City of Kyle ', 'description', ST_MakePoint(-97.847046, 30.017550), ST_AsGeoJSON(ST_MakePoint(-97.847046, 30.017550)), '{9016}'),
(1249, 1580, 'P4041 Hillcrest off 969', 'P4041 126 Hillcrest', 'description', ST_MakePoint(-97.470131, 30.233458), ST_AsGeoJSON(ST_MakePoint(-97.470131, 30.233458)), '{9012}'),
(1250, 1581, 'Windy Hill Rd  @ Indian Paintbrush Dr', 'Hays County ', 'description', ST_MakePoint(-97.837524, 30.031965), ST_AsGeoJSON(ST_MakePoint(-97.837524, 30.031965)), '{9016}'),
(1251, 1582, 'TX1027 FM 535 at Maha Creek', 'TX1027 FM 535 at Maha Creek', 'description', ST_MakePoint(-97.498329, 30.079931), ST_AsGeoJSON(ST_MakePoint(-97.498329, 30.079931)), '{9012}'),
(1252, 1584, 'Indian Creek &amp; Long Knife', 'Indian Crk &amp; Long Knife', 'description', ST_MakePoint(-97.634315, 30.637003), ST_AsGeoJSON(ST_MakePoint(-97.634315, 30.637003)), '{9017}'),
(1253, 1586, '800 Block Petras Way ', 'Hays County ', 'description', ST_MakePoint(-97.753281, 30.039286), ST_AsGeoJSON(ST_MakePoint(-97.753281, 30.039286)), '{9016}'),
(1254, 1587, 'TX1028 812 @ Old San Antonio', 'TX1028 812 @ Old San Antonio', 'description', ST_MakePoint(-97.545784, 30.049198), ST_AsGeoJSON(ST_MakePoint(-97.545784, 30.049198)), '{9012}'),
(1255, 1593, 'Spoke Hollow Rd @ Hidden Valley Rd ', 'Hays County', 'description', ST_MakePoint(-98.069054, 29.984119), ST_AsGeoJSON(ST_MakePoint(-98.069054, 29.984119)), '{9016}'),
(1256, 1594, 'P4042 Upper Elgin River Rd @ Old Austin Trl', 'P4042 Upper Elgin River Rd @ Old Austin Trl', 'description', ST_MakePoint(-97.451180, 30.242487), ST_AsGeoJSON(ST_MakePoint(-97.451180, 30.242487)), '{9012}'),
(1257, 1596, 'CR 324 &amp; CR 342', 'CR 324 &amp; CR 342', 'description', ST_MakePoint(-97.494026, 30.740080), ST_AsGeoJSON(ST_MakePoint(-97.494026, 30.740080)), '{9017}'),
(1258, 1597, 'TX1029 290 @ Big Sandy ', 'TX1029 290 @ Big Sandy', 'description', ST_MakePoint(-97.297005, 30.304695), ST_AsGeoJSON(ST_MakePoint(-97.297005, 30.304695)), '{9012}'),
(1259, 1599, 'Brandt Rd @ Bluff Springs Rd', 'Travis County, TX', 'description', ST_MakePoint(-97.768532, 30.171251), ST_AsGeoJSON(ST_MakePoint(-97.768532, 30.171251)), '{9010}'),
(1260, 1600, 'RR 12 @ Blanco River', 'Hays County', 'description', ST_MakePoint(-98.088623, 29.993856), ST_AsGeoJSON(ST_MakePoint(-98.088623, 29.993856)), '{9016}'),
(1261, 1601, 'Hunter Rd @ Dixon St', 'City of San Marcos', 'description', ST_MakePoint(-97.958199, 29.871227), ST_AsGeoJSON(ST_MakePoint(-97.958199, 29.871227)), '{9016}'),
(1262, 1602, 'Knox St @ Patton St.', 'City of San Marcos', 'description', ST_MakePoint(-97.941460, 29.870222), ST_AsGeoJSON(ST_MakePoint(-97.941460, 29.870222)), '{9016}'),
(1263, 1603, 'Lime Kiln Rd @ Hillard Rd ', 'Hays County', 'description', ST_MakePoint(-97.935608, 29.921242), ST_AsGeoJSON(ST_MakePoint(-97.935608, 29.921242)), '{9016}'),
(1264, 1604, 'S Mitchell St @ Gravel St', 'City of San Marcos', 'description', ST_MakePoint(-97.946098, 29.872530), ST_AsGeoJSON(ST_MakePoint(-97.946098, 29.872530)), '{9016}'),
(1265, 1605, 'Cole Springs Rd @ FM 967', 'Hays County', 'description', ST_MakePoint(-97.848961, 30.085917), ST_AsGeoJSON(ST_MakePoint(-97.848961, 30.085917)), '{9016}'),
(1266, 1606, 'Twin Creeks @ Arroyo Doble', 'Travis County, TX', 'description', ST_MakePoint(-97.821754, 30.127005), ST_AsGeoJSON(ST_MakePoint(-97.821754, 30.127005)), '{9010}'),
(1267, 1607, 'TX1030 Hwy 21 West @ Maha', 'TX1030 Hwy 21 West @ Maha', 'description', ST_MakePoint(-97.505463, 30.086143), ST_AsGeoJSON(ST_MakePoint(-97.505463, 30.086143)), '{9012}'),
(1268, 1608, 'FM 150 @ Sierra West PHASE 2&3', 'Hays County', 'description', ST_MakePoint(-97.989937, 30.059847), ST_AsGeoJSON(ST_MakePoint(-97.989937, 30.059847)), '{9016}'),
(1269, 1609, 'Bliss Spillar Rd @ Chaparral Rd', 'Hays County ', 'description', ST_MakePoint(-97.874512, 30.138557), ST_AsGeoJSON(ST_MakePoint(-97.874512, 30.138557)), '{9016}'),
(1270, 1610, 'Dee Gabriel Collins Rd @ Cottonmouth School rd', 'Travis County, TX', 'description', ST_MakePoint(-97.701195, 30.172562), ST_AsGeoJSON(ST_MakePoint(-97.701195, 30.172562)), '{9010}'),
(1271, 1611, '9800 S US 183', 'Travis County, TX', 'description', ST_MakePoint(-97.694687, 30.107519), ST_AsGeoJSON(ST_MakePoint(-97.694687, 30.107519)), '{9010}'),
(1272, 1612, '11100-11500 Cow Creek', 'Travis County, TX', 'description', ST_MakePoint(-98.062798, 30.589186), ST_AsGeoJSON(ST_MakePoint(-98.062798, 30.589186)), '{9010}'),
(1273, 1613, 'fallwell @ sh 130', 'Travis County, TX', 'description', ST_MakePoint(-97.621841, 30.209429), ST_AsGeoJSON(ST_MakePoint(-97.621841, 30.209429)), '{9010}'),
(1274, 1614, 'SH 130 @ Pearce', 'Travis County, TX', 'description', ST_MakePoint(-97.636894, 30.176794), ST_AsGeoJSON(ST_MakePoint(-97.636894, 30.176794)), '{9010}'),
(1275, 1616, '3000-blk Bee Cave Rd', 'Travis County, TX', 'description', ST_MakePoint(-97.793686, 30.271036), ST_AsGeoJSON(ST_MakePoint(-97.793686, 30.271036)), '{9010}'),
(1276, 1617, 'Apple Blossom St @ Dacy ln', 'Hays County', 'description', ST_MakePoint(-97.828583, 30.047428), ST_AsGeoJSON(ST_MakePoint(-97.828583, 30.047428)), '{9016}'),
(1277, 1619, 'TX1031 FM 969 @ Colorado River', 'TX1031 FM 969 @ Colorado River', 'description', ST_MakePoint(-97.403946, 30.168530), ST_AsGeoJSON(ST_MakePoint(-97.403946, 30.168530)), '{9012}'),
(1278, 1620, 'Wells Branch Pkwy @ Killingsworth Ln', 'Travis County, TX', 'description', ST_MakePoint(-97.612885, 30.417486), ST_AsGeoJSON(ST_MakePoint(-97.612885, 30.417486)), '{9010}'),
(1279, 1624, 'Cotton Gin Rd @ Summer Sun Cv', 'Hays County', 'description', ST_MakePoint(-97.789948, 29.960678), ST_AsGeoJSON(ST_MakePoint(-97.789948, 29.960678)), '{9016}'),
(1280, 1625, 'Old San Antonio Rd (South of Puryear)', 'Travis County, TX', 'description', ST_MakePoint(-97.811577, 30.111149), ST_AsGeoJSON(ST_MakePoint(-97.811577, 30.111149)), '{9010}'),
(1281, 1626, 'Bluff Springs Rd @ Onion Creek', 'Travis County, TX', 'description', ST_MakePoint(-97.769737, 30.159344), ST_AsGeoJSON(ST_MakePoint(-97.769737, 30.159344)), '{9010}'),
(1282, 1628, 'CR 158 West of Drue Dr', 'Hays County', 'description', ST_MakePoint(-97.845329, 29.946920), ST_AsGeoJSON(ST_MakePoint(-97.845329, 29.946920)), '{9016}'),
(1283, 1629, 'Goforth Rd @ Sunrise Dr', 'Hays County', 'description', ST_MakePoint(-97.829376, 30.006929), ST_AsGeoJSON(ST_MakePoint(-97.829376, 30.006929)), '{9016}'),
(1284, 1631, 'Kyle Crossing behind 3rd coast auto', 'City of Kyle', 'description', ST_MakePoint(-97.858627, 30.018225), ST_AsGeoJSON(ST_MakePoint(-97.858627, 30.018225)), '{9016}'),
(1285, 1632, 'East William Cannon and Pleasant Valley', 'East William Cannon and Pleasant Valley', 'description', ST_MakePoint(-97.746414, 30.181608), ST_AsGeoJSON(ST_MakePoint(-97.746414, 30.181608)), '{9009}'),
(1286, 1633, 'Pleasant Valley and Quicksilver Dr', 'Pleasant Valley and Quicksilver Dr', 'description', ST_MakePoint(-97.752357, 30.172297), ST_AsGeoJSON(ST_MakePoint(-97.752357, 30.172297)), '{9009}'),
(1287, 1634, 'P1018 300 Block Reids Bend', 'P1018 300 Block Reids Bend', 'description', ST_MakePoint(-97.330460, 30.127987), ST_AsGeoJSON(ST_MakePoint(-97.330460, 30.127987)), '{9012}'),
(1288, 1636, 'P1019 Al Jones St', 'P1019 Al Jones St.', 'description', ST_MakePoint(-97.332298, 30.120579), ST_AsGeoJSON(ST_MakePoint(-97.332298, 30.120579)), '{9012}'),
(1289, 1637, 'P1020 Lower Wood Ln', 'P1020 Lower Wood Ln', 'description', ST_MakePoint(-97.340408, 30.123716), ST_AsGeoJSON(ST_MakePoint(-97.340408, 30.123716)), '{9012}'),
(1290, 1638, 'P1021 Shoreline Drive', 'P1021 Shoreline Drive', 'description', ST_MakePoint(-97.335197, 30.118780), ST_AsGeoJSON(ST_MakePoint(-97.335197, 30.118780)), '{9012}'),
(1291, 1639, 'Fagerquest/Wolf', 'Fagerquest/Wolf', 'description', ST_MakePoint(-97.572929, 30.132200), ST_AsGeoJSON(ST_MakePoint(-97.572929, 30.132200)), '{9012}'),
(1292, 1640, 'Uhland Rd @ Low Water Crossing', 'San Marcos/Hays County', 'description', ST_MakePoint(-97.900597, 29.894661), ST_AsGeoJSON(ST_MakePoint(-97.900597, 29.894661)), '{9016}'),
(1293, 1641, 'Cape Rd @ San Marcos River', 'City of San Marcos', 'description', ST_MakePoint(-97.930176, 29.869444), ST_AsGeoJSON(ST_MakePoint(-97.930176, 29.869444)), '{9016}'),
(1294, 1643, '12900-blk Wright Rd', 'Travis County, TX', 'description', ST_MakePoint(-97.756691, 30.091007), ST_AsGeoJSON(ST_MakePoint(-97.756691, 30.091007)), '{9010}'),
(1295, 1644, 'CR 103 @ Elm Creek', 'Lee County', 'description', ST_MakePoint(-97.050545, 30.211090), ST_AsGeoJSON(ST_MakePoint(-97.050545, 30.211090)), '{9013}'),
(1296, 1645, 'CR 104 @ Dead Mans Hole Creek', 'Lee County', 'description', ST_MakePoint(-97.021927, 30.219378), ST_AsGeoJSON(ST_MakePoint(-97.021927, 30.219378)), '{9013}'),
(1297, 1646, 'CR 104 @ Elm Creek', 'Lee County', 'description', ST_MakePoint(-97.019073, 30.202868), ST_AsGeoJSON(ST_MakePoint(-97.019073, 30.202868)), '{9013}'),
(1298, 1648, 'CR 108 @ Bluff Creek', 'Lee County', 'description', ST_MakePoint(-97.059273, 30.288042), ST_AsGeoJSON(ST_MakePoint(-97.059273, 30.288042)), '{9013}'),
(1299, 1649, 'CR 108 @ West Yegua Creek', 'Lee County', 'description', ST_MakePoint(-97.083405, 30.305321), ST_AsGeoJSON(ST_MakePoint(-97.083405, 30.305321)), '{9013}'),
(1300, 1651, 'CR 109 @ Mier Branch', 'Lee County', 'description', ST_MakePoint(-97.012245, 30.260092), ST_AsGeoJSON(ST_MakePoint(-97.012245, 30.260092)), '{9013}'),
(1301, 1652, 'CR 109 @ Schilling Branch', 'Lee County', 'description', ST_MakePoint(-97.029968, 30.242050), ST_AsGeoJSON(ST_MakePoint(-97.029968, 30.242050)), '{9013}'),
(1302, 1653, 'CR 113 @ Elm Creek', 'Lee County', 'description', ST_MakePoint(-96.985680, 30.237471), ST_AsGeoJSON(ST_MakePoint(-96.985680, 30.237471)), '{9013}'),
(1303, 1654, 'CR 113 @ Nails Creek', 'Lee County', 'description', ST_MakePoint(-96.957947, 30.215399), ST_AsGeoJSON(ST_MakePoint(-96.957947, 30.215399)), '{9013}'),
(1304, 1656, 'CR 114 @ Willy Branch', 'Lee County', 'description', ST_MakePoint(-96.929131, 30.239904), ST_AsGeoJSON(ST_MakePoint(-96.929131, 30.239904)), '{9013}'),
(1305, 1657, 'CR 114 @ Nails Creek', 'Lee County', 'description', ST_MakePoint(-96.936272, 30.219763), ST_AsGeoJSON(ST_MakePoint(-96.936272, 30.219763)), '{9013}'),
(1306, 1658, 'CR 116 @ Little Hickory Creek', 'Lee County', 'description', ST_MakePoint(-96.894165, 30.212481), ST_AsGeoJSON(ST_MakePoint(-96.894165, 30.212481)), '{9013}'),
(1307, 1659, 'CR 116 @ Persimmons Branch', 'Lee County', 'description', ST_MakePoint(-96.883797, 30.203848), ST_AsGeoJSON(ST_MakePoint(-96.883797, 30.203848)), '{9013}'),
(1308, 1661, 'CR 117 @ Big Branch', 'Lee County', 'description', ST_MakePoint(-96.884056, 30.255596), ST_AsGeoJSON(ST_MakePoint(-96.884056, 30.255596)), '{9013}'),
(1309, 1663, 'CR 117 @ Turkey Creek', 'Lee County', 'description', ST_MakePoint(-96.890755, 30.274912), ST_AsGeoJSON(ST_MakePoint(-96.890755, 30.274912)), '{9013}'),
(1310, 1664, 'CR 118 @ Nails Creek', 'Lee County', 'description', ST_MakePoint(-96.906158, 30.233433), ST_AsGeoJSON(ST_MakePoint(-96.906158, 30.233433)), '{9013}'),
(1311, 1665, 'CR 118 @ Willow Branch', 'Lee County', 'description', ST_MakePoint(-96.901031, 30.244741), ST_AsGeoJSON(ST_MakePoint(-96.901031, 30.244741)), '{9013}'),
(1312, 1666, 'CR 119 @ Nails Creek', 'Lee County', 'description', ST_MakePoint(-96.777527, 30.234684), ST_AsGeoJSON(ST_MakePoint(-96.777527, 30.234684)), '{9013}'),
(1313, 1668, 'CR 124 @ Yegua Creek', 'Lee County', 'description', ST_MakePoint(-96.741318, 30.319473), ST_AsGeoJSON(ST_MakePoint(-96.741318, 30.319473)), '{9013}'),
(1314, 1672, 'CR 127 @ Flat Rock Creek', 'Lee County', 'description', ST_MakePoint(-96.805611, 30.179604), ST_AsGeoJSON(ST_MakePoint(-96.805611, 30.179604)), '{9013}'),
(1315, 1674, 'CR 127 @ Nails Creek', 'Lee County', 'description', ST_MakePoint(-96.798683, 30.234751), ST_AsGeoJSON(ST_MakePoint(-96.798683, 30.234751)), '{9013}'),
(1316, 1675, 'CR 127 @ Pin Oak Creek', 'Lee County', 'description', ST_MakePoint(-96.805725, 30.220579), ST_AsGeoJSON(ST_MakePoint(-96.805725, 30.220579)), '{9013}'),
(1317, 1676, 'CR 130 @ Hog Branch', 'Lee County', 'description', ST_MakePoint(-96.760712, 30.215097), ST_AsGeoJSON(ST_MakePoint(-96.760712, 30.215097)), '{9013}'),
(1318, 1677, 'CR 130 @ Turkey Creek', 'Lee County', 'description', ST_MakePoint(-96.781517, 30.169985), ST_AsGeoJSON(ST_MakePoint(-96.781517, 30.169985)), '{9013}'),
(1319, 1678, 'CR 131 @ Cedar Creek', 'Lee County', 'description', ST_MakePoint(-96.737190, 30.233255), ST_AsGeoJSON(ST_MakePoint(-96.737190, 30.233255)), '{9013}'),
(1320, 1679, 'CR 133 @ Stuber Creek', 'Lee County', 'description', ST_MakePoint(-96.874001, 30.198463), ST_AsGeoJSON(ST_MakePoint(-96.874001, 30.198463)), '{9013}'),
(1321, 1680, 'Cr 133 @ Water Hole Branch', 'Lee County', 'description', ST_MakePoint(-96.850182, 30.196384), ST_AsGeoJSON(ST_MakePoint(-96.850182, 30.196384)), '{9013}'),
(1322, 1681, 'CR 203 @ Rabbs Creek', 'Lee County', 'description', ST_MakePoint(-97.050476, 30.179405), ST_AsGeoJSON(ST_MakePoint(-97.050476, 30.179405)), '{9013}'),
(1323, 1682, 'CR 205 @ Little Bullfrog Creek', 'Lee County', 'description', ST_MakePoint(-96.990295, 30.175426), ST_AsGeoJSON(ST_MakePoint(-96.990295, 30.175426)), '{9013}'),
(1324, 1683, 'CR 205 @ Knobbs Creek', 'Lee County', 'description', ST_MakePoint(-97.038078, 30.142265), ST_AsGeoJSON(ST_MakePoint(-97.038078, 30.142265)), '{9013}'),
(1325, 1684, 'CR 205 @ Bullfrog Creek', 'Lee County', 'description', ST_MakePoint(-96.998543, 30.170876), ST_AsGeoJSON(ST_MakePoint(-96.998543, 30.170876)), '{9013}'),
(1326, 1685, 'CR 205 @ Rabbs Creek', 'Lee County', 'description', ST_MakePoint(-97.016098, 30.156984), ST_AsGeoJSON(ST_MakePoint(-97.016098, 30.156984)), '{9013}'),
(1327, 1686, 'CR 208 @ Bullfrog Creek', 'Lee County', 'description', ST_MakePoint(-96.972565, 30.153500), ST_AsGeoJSON(ST_MakePoint(-96.972565, 30.153500)), '{9013}'),
(1328, 1687, 'CR 208 @ Rabbs Creek', 'Lee County', 'description', ST_MakePoint(-96.996559, 30.145313), ST_AsGeoJSON(ST_MakePoint(-96.996559, 30.145313)), '{9013}'),
(1329, 1688, 'CR 208 @ Wolf Branch', 'Lee County', 'description', ST_MakePoint(-96.961891, 30.163271), ST_AsGeoJSON(ST_MakePoint(-96.961891, 30.163271)), '{9013}'),
(1330, 1689, 'CR 209 @ Knobbs Creek', 'Lee County', 'description', ST_MakePoint(-97.020515, 30.101318), ST_AsGeoJSON(ST_MakePoint(-97.020515, 30.101318)), '{9013}'),
(1331, 1690, 'CR 210 @ Knobbs Creek', 'Lee County', 'description', ST_MakePoint(-97.018204, 30.089941), ST_AsGeoJSON(ST_MakePoint(-97.018204, 30.089941)), '{9013}'),
(1332, 1691, 'CR 213 @ Knobbs Creek', 'Lee County', 'description', ST_MakePoint(-97.006798, 30.066362), ST_AsGeoJSON(ST_MakePoint(-97.006798, 30.066362)), '{9013}'),
(1333, 1692, 'CR 213 @ Little Pin Oak Creek', 'Lee County', 'description', ST_MakePoint(-96.999519, 30.072908), ST_AsGeoJSON(ST_MakePoint(-96.999519, 30.072908)), '{9013}'),
(1334, 1693, 'CR 216 @ Rabbs Creek', 'Lee County', 'description', ST_MakePoint(-96.940231, 30.118050), ST_AsGeoJSON(ST_MakePoint(-96.940231, 30.118050)), '{9013}'),
(1335, 1694, 'CR 216 @ Sandy Creek', 'Lee County', 'description', ST_MakePoint(-96.938278, 30.122393), ST_AsGeoJSON(ST_MakePoint(-96.938278, 30.122393)), '{9013}'),
(1336, 1695, 'CR 217 @ Rabbs Creek', 'Lee County', 'description', ST_MakePoint(-96.952034, 30.126257), ST_AsGeoJSON(ST_MakePoint(-96.952034, 30.126257)), '{9013}'),
(1337, 1696, 'CR 217 @ Sandy Creek', 'Lee County', 'description', ST_MakePoint(-96.939537, 30.137663), ST_AsGeoJSON(ST_MakePoint(-96.939537, 30.137663)), '{9013}'),
(1338, 1697, 'CR 220 @ Rabbs Creek', 'Lee County', 'description', ST_MakePoint(-96.929756, 30.109024), ST_AsGeoJSON(ST_MakePoint(-96.929756, 30.109024)), '{9013}'),
(1339, 1698, 'CR 221 @ Pin Oak Creek', 'Lee County', 'description', ST_MakePoint(-96.910652, 30.121639), ST_AsGeoJSON(ST_MakePoint(-96.910652, 30.121639)), '{9013}'),
(1340, 1699, 'CR 223 @ Pin Oak Creek', 'Lee County', 'description', ST_MakePoint(-96.914116, 30.148920), ST_AsGeoJSON(ST_MakePoint(-96.914116, 30.148920)), '{9013}'),
(1341, 1700, 'CR 223 @ Rocky Branch', 'Lee County', 'description', ST_MakePoint(-96.862648, 30.108444), ST_AsGeoJSON(ST_MakePoint(-96.862648, 30.108444)), '{9013}'),
(1342, 1701, 'CR 223 @ Small Greens Creek', 'Lee County', 'description', ST_MakePoint(-96.888893, 30.124683), ST_AsGeoJSON(ST_MakePoint(-96.888893, 30.124683)), '{9013}'),
(1343, 1702, 'CR 226 @ Cummins Creek', 'Lee County', 'description', ST_MakePoint(-96.880585, 30.159863), ST_AsGeoJSON(ST_MakePoint(-96.880585, 30.159863)), '{9013}'),
(1344, 1703, 'CR 233 @ Cummins Creek', 'Lee County', 'description', ST_MakePoint(-96.856689, 30.156799), ST_AsGeoJSON(ST_MakePoint(-96.856689, 30.156799)), '{9013}'),
(1345, 1704, 'CR 304 @ Middle Yegua Creek', 'Lee County', 'description', ST_MakePoint(-97.236710, 30.423727), ST_AsGeoJSON(ST_MakePoint(-97.236710, 30.423727)), '{9013}'),
(1346, 1705, 'CR 304 @ Mine Creek', 'Lee County', 'description', ST_MakePoint(-97.213989, 30.360558), ST_AsGeoJSON(ST_MakePoint(-97.213989, 30.360558)), '{9013}'),
(1347, 1706, 'CR 304 @ Willow Creek', 'Lee County', 'description', ST_MakePoint(-97.226395, 30.376293), ST_AsGeoJSON(ST_MakePoint(-97.226395, 30.376293)), '{9013}'),
(1348, 1707, 'CR 306 @ Middle Yegua Creek (South)', 'Lee County', 'description', ST_MakePoint(-97.191315, 30.402718), ST_AsGeoJSON(ST_MakePoint(-97.191315, 30.402718)), '{9013}'),
(1349, 1708, 'CR 306 @ Middle Yegua Creek (North)', 'Lee County', 'description', ST_MakePoint(-97.222565, 30.413513), ST_AsGeoJSON(ST_MakePoint(-97.222565, 30.413513)), '{9013}'),
(1350, 1709, 'CR 309 @ Burns Branch', 'Lee County', 'description', ST_MakePoint(-97.148094, 30.402805), ST_AsGeoJSON(ST_MakePoint(-97.148094, 30.402805)), '{9013}'),
(1351, 1710, 'CR 309 @ Middle Yegua Creek', 'Lee County', 'description', ST_MakePoint(-97.156403, 30.410339), ST_AsGeoJSON(ST_MakePoint(-97.156403, 30.410339)), '{9013}'),
(1352, 1711, 'CR 311 @ Blue Branch', 'Lee County', 'description', ST_MakePoint(-97.170204, 30.361956), ST_AsGeoJSON(ST_MakePoint(-97.170204, 30.361956)), '{9013}'),
(1353, 1712, 'CR 311 @ Marshy Branch', 'Lee County', 'description', ST_MakePoint(-97.185104, 30.361397), ST_AsGeoJSON(ST_MakePoint(-97.185104, 30.361397)), '{9013}'),
(1354, 1713, 'CR 314 @ Cottonwood Creek', 'Lee County', 'description', ST_MakePoint(-97.129578, 30.450672), ST_AsGeoJSON(ST_MakePoint(-97.129578, 30.450672)), '{9013}'),
(1355, 1714, 'CR 314 @ Cross Creek', 'Lee County', 'description', ST_MakePoint(-97.141655, 30.435314), ST_AsGeoJSON(ST_MakePoint(-97.141655, 30.435314)), '{9013}'),
(1356, 1715, 'CR 314A @ Cross Creek', 'Lee County', 'description', ST_MakePoint(-97.149963, 30.454733), ST_AsGeoJSON(ST_MakePoint(-97.149963, 30.454733)), '{9013}'),
(1357, 1716, 'CR 315 @ Camp Branch', 'Lee County', 'description', ST_MakePoint(-97.093811, 30.464424), ST_AsGeoJSON(ST_MakePoint(-97.093811, 30.464424)), '{9013}'),
(1358, 1717, 'CR 316 @ Cross Creek', 'Lee County', 'description', ST_MakePoint(-97.123238, 30.423174), ST_AsGeoJSON(ST_MakePoint(-97.123238, 30.423174)), '{9013}'),
(1359, 1718, 'CR 317 @ Brushy Creek', 'Lee County', 'description', ST_MakePoint(-97.038086, 30.437950), ST_AsGeoJSON(ST_MakePoint(-97.038086, 30.437950)), '{9013}'),
(1360, 1719, 'CR 318 @ Camp Branch', 'Lee County', 'description', ST_MakePoint(-97.090744, 30.470179), ST_AsGeoJSON(ST_MakePoint(-97.090744, 30.470179)), '{9013}'),
(1361, 1720, 'CR 320 @ Brushy Creek', 'Lee County', 'description', ST_MakePoint(-97.020164, 30.452997), ST_AsGeoJSON(ST_MakePoint(-97.020164, 30.452997)), '{9013}'),
(1362, 1721, 'CR 320 @ Pucker Springs Branch', 'Lee County', 'description', ST_MakePoint(-97.037086, 30.475197), ST_AsGeoJSON(ST_MakePoint(-97.037086, 30.475197)), '{9013}'),
(1363, 1722, 'CR 320 @ Rouse Creek', 'Lee County', 'description', ST_MakePoint(-97.050606, 30.502571), ST_AsGeoJSON(ST_MakePoint(-97.050606, 30.502571)), '{9013}'),
(1364, 1723, 'CR 322 @ West Rocky Branch', 'Lee County', 'description', ST_MakePoint(-97.082260, 30.360727), ST_AsGeoJSON(ST_MakePoint(-97.082260, 30.360727)), '{9013}'),
(1365, 1724, 'CR 323 @ Middle Yegua Creek', 'Lee County', 'description', ST_MakePoint(-97.048912, 30.367773), ST_AsGeoJSON(ST_MakePoint(-97.048912, 30.367773)), '{9013}'),
(1366, 1725, 'CR 326 @ West Yegua Creek', 'Lee County', 'description', ST_MakePoint(-97.005585, 30.295628), ST_AsGeoJSON(ST_MakePoint(-97.005585, 30.295628)), '{9013}'),
(1367, 1726, 'CR 326 @ Shaw Branch', 'Lee County', 'description', ST_MakePoint(-97.012558, 30.395409), ST_AsGeoJSON(ST_MakePoint(-97.012558, 30.395409)), '{9013}'),
(1368, 1727, 'CR 326 @ Middle Yegua Creek', 'Lee County', 'description', ST_MakePoint(-97.024666, 30.367445), ST_AsGeoJSON(ST_MakePoint(-97.024666, 30.367445)), '{9013}'),
(1369, 1728, 'CR 329 @ Middle Yegua Creek', 'Lee County', 'description', ST_MakePoint(-96.987915, 30.353991), ST_AsGeoJSON(ST_MakePoint(-96.987915, 30.353991)), '{9013}'),
(1370, 1729, 'CR 333 @ Willie Branch', 'Lee County', 'description', ST_MakePoint(-97.129280, 30.320852), ST_AsGeoJSON(ST_MakePoint(-97.129280, 30.320852)), '{9013}'),
(1371, 1730, 'CR 337 @ Coupland Branch', 'Lee County', 'description', ST_MakePoint(-97.075485, 30.405525), ST_AsGeoJSON(ST_MakePoint(-97.075485, 30.405525)), '{9013}'),
(1372, 1731, 'CR 343 @ Coupland Branch', 'Lee County', 'description', ST_MakePoint(-97.102318, 30.354233), ST_AsGeoJSON(ST_MakePoint(-97.102318, 30.354233)), '{9013}'),
(1373, 1732, 'CR 345 @ Allen Creek', 'Lee County', 'description', ST_MakePoint(-97.016090, 30.528376), ST_AsGeoJSON(ST_MakePoint(-97.016090, 30.528376)), '{9013}'),
(1374, 1733, 'CR 404 @ Boggy Creek', 'Lee County', 'description', ST_MakePoint(-96.865067, 30.382130), ST_AsGeoJSON(ST_MakePoint(-96.865067, 30.382130)), '{9013}'),
(1375, 1734, 'CR 405 @ Indian Camp Branch', 'Lee County', 'description', ST_MakePoint(-96.989288, 30.396210), ST_AsGeoJSON(ST_MakePoint(-96.989288, 30.396210)), '{9013}'),
(1376, 1735, 'CR 405 @ Warsaw Branch', 'Lee County', 'description', ST_MakePoint(-96.972519, 30.395802), ST_AsGeoJSON(ST_MakePoint(-96.972519, 30.395802)), '{9013}'),
(1377, 1736, 'CR 405 @ Pin Oak Creek', 'Lee County', 'description', ST_MakePoint(-96.955132, 30.405678), ST_AsGeoJSON(ST_MakePoint(-96.955132, 30.405678)), '{9013}'),
(1378, 1737, 'CR 413 @ Allen Creek', 'Lee County', 'description', ST_MakePoint(-96.933594, 30.525551), ST_AsGeoJSON(ST_MakePoint(-96.933594, 30.525551)), '{9013}'),
(1379, 1738, 'CR 415W @ Spring Branch', 'Lee County', 'description', ST_MakePoint(-97.000549, 30.499523), ST_AsGeoJSON(ST_MakePoint(-97.000549, 30.499523)), '{9013}'),
(1380, 1739, 'CR 417 @ Spring Branch', 'Lee County', 'description', ST_MakePoint(-96.988731, 30.517321), ST_AsGeoJSON(ST_MakePoint(-96.988731, 30.517321)), '{9013}'),
(1381, 1740, 'CR 418 @ Allen Creek', 'Lee County', 'description', ST_MakePoint(-97.000137, 30.526342), ST_AsGeoJSON(ST_MakePoint(-97.000137, 30.526342)), '{9013}'),
(1382, 1741, 'CR 418 @ Spring Branch', 'Lee County', 'description', ST_MakePoint(-96.993858, 30.510744), ST_AsGeoJSON(ST_MakePoint(-96.993858, 30.510744)), '{9013}'),
(1383, 1742, 'CR 424 @ Brushy Creek (North)', 'Lee County', 'description', ST_MakePoint(-96.809837, 30.370800), ST_AsGeoJSON(ST_MakePoint(-96.809837, 30.370800)), '{9013}'),
(1384, 1743, 'JCR 424 @ Brushy Creek (South)', 'Lee County', 'description', ST_MakePoint(-96.834259, 30.346251), ST_AsGeoJSON(ST_MakePoint(-96.834259, 30.346251)), '{9013}'),
(1385, 1744, 'CR 424 @ East Yegua Creek', 'Lee County', 'description', ST_MakePoint(-96.788017, 30.387001), ST_AsGeoJSON(ST_MakePoint(-96.788017, 30.387001)), '{9013}'),
(1386, 1745, 'CR 426 @ Brushy Creek', 'Lee County', 'description', ST_MakePoint(-96.801727, 30.370295), ST_AsGeoJSON(ST_MakePoint(-96.801727, 30.370295)), '{9013}'),
(1387, 1746, 'CR 428 @ Boggy Branch', 'Lee County', 'description', ST_MakePoint(-96.855919, 30.355844), ST_AsGeoJSON(ST_MakePoint(-96.855919, 30.355844)), '{9013}'),
(1388, 1747, 'CR 428 @ Brushy Creek', 'Lee County', 'description', ST_MakePoint(-96.839722, 30.369522), ST_AsGeoJSON(ST_MakePoint(-96.839722, 30.369522)), '{9013}'),
(1389, 1748, 'CR 430 @ East Yegua Creek', 'Lee County', 'description', ST_MakePoint(-96.761047, 30.344315), ST_AsGeoJSON(ST_MakePoint(-96.761047, 30.344315)), '{9013}'),
(1390, 1749, 'CR 430 @ Boggy Branch', 'Lee County', 'description', ST_MakePoint(-96.856148, 30.354189), ST_AsGeoJSON(ST_MakePoint(-96.856148, 30.354189)), '{9013}'),
(1391, 1750, 'CR 430 @ Brushy Creek', 'Lee County', 'description', ST_MakePoint(-96.837189, 30.338240), ST_AsGeoJSON(ST_MakePoint(-96.837189, 30.338240)), '{9013}'),
(1392, 1751, 'CR 436 @ Copperas Creek', 'Lee County', 'description', ST_MakePoint(-96.909355, 30.389839), ST_AsGeoJSON(ST_MakePoint(-96.909355, 30.389839)), '{9013}'),
(1393, 1752, 'CR 455 @ Indian Camp Branch', 'Lee County', 'description', ST_MakePoint(-96.984497, 30.371523), ST_AsGeoJSON(ST_MakePoint(-96.984497, 30.371523)), '{9013}'),
(1394, 1753, 'CR 455 @ Warsaw Branch', 'Lee County', 'description', ST_MakePoint(-96.980118, 30.372948), ST_AsGeoJSON(ST_MakePoint(-96.980118, 30.372948)), '{9013}'),
(1395, 1758, 'Deer Valley Dr. @ Willow Creek', 'Lee County', 'description', ST_MakePoint(-97.265465, 30.371374), ST_AsGeoJSON(ST_MakePoint(-97.265465, 30.371374)), '{9013}'),
(1396, 1759, 'Post Oak Dr. @ Tributary to Middle Yegua Creek', 'Lee County', 'description', ST_MakePoint(-97.232536, 30.432079), ST_AsGeoJSON(ST_MakePoint(-97.232536, 30.432079)), '{9013}'),
(1397, 1760, 'Post Oak Dr. @ Tributary to Middle Yegua Creek', 'Lee County', 'description', ST_MakePoint(-97.226562, 30.430269), ST_AsGeoJSON(ST_MakePoint(-97.226562, 30.430269)), '{9013}'),
(1398, 1761, 'Road B @ Two Mile Branch', 'Lee County', 'description', ST_MakePoint(-97.124008, 30.373522), ST_AsGeoJSON(ST_MakePoint(-97.124008, 30.373522)), '{9013}'),
(1399, 1762, 'Road C @ Two Mile Creek', 'Lee County', 'description', ST_MakePoint(-97.122643, 30.379416), ST_AsGeoJSON(ST_MakePoint(-97.122643, 30.379416)), '{9013}'),
(1400, 1763, 'Wilson Boyd Ln. @ Red Branch', 'Lee County', 'description', ST_MakePoint(-97.029266, 30.389349), ST_AsGeoJSON(ST_MakePoint(-97.029266, 30.389349)), '{9013}'),
(1401, 1764, 'FM 141 @ Middle Yegua Creek', 'Lee County', 'description', ST_MakePoint(-96.786461, 30.321545), ST_AsGeoJSON(ST_MakePoint(-96.786461, 30.321545)), '{9013}'),
(1402, 1765, 'FM 1624 @ Middle Yegua Creek', 'Lee County', 'description', ST_MakePoint(-97.064156, 30.388115), ST_AsGeoJSON(ST_MakePoint(-97.064156, 30.388115)), '{9013}'),
(1403, 1766, 'FM 1624 @ West Yegua Creek', 'Lee County', 'description', ST_MakePoint(-97.050720, 30.303663), ST_AsGeoJSON(ST_MakePoint(-97.050720, 30.303663)), '{9013}'),
(1404, 1767, 'CR 477', 'CR 477', 'description', ST_MakePoint(-97.080772, 31.209778), ST_AsGeoJSON(ST_MakePoint(-97.080772, 31.209778)), '{9017}'),
(1405, 1768, 'Huelsebusch Rd, Fayette County', 'Huelsebusch Rd SW of Old Plum Hwy', 'description', ST_MakePoint(-96.932274, 29.922003), ST_AsGeoJSON(ST_MakePoint(-96.932274, 29.922003)), '{9018}'),
(1406, 1769, 'Goehring Rd, Fayette County', 'Goehring Rd N of Wendler Rd', 'description', ST_MakePoint(-96.824440, 30.113573), ST_AsGeoJSON(ST_MakePoint(-96.824440, 30.113573)), '{9018}'),
(1407, 1770, 'Gregg @ fm 973', 'Travis County, TX ', 'description', ST_MakePoint(-97.529198, 30.375914), ST_AsGeoJSON(ST_MakePoint(-97.529198, 30.375914)), '{9010}'),
(1408, 1771, 'CR 117 @ Persimmon Branch', 'Lee County', 'description', ST_MakePoint(-96.861954, 30.235029), ST_AsGeoJSON(ST_MakePoint(-96.861954, 30.235029)), '{9013}'),
(1409, 1772, ' Niederwald Strasse Rd @ Camino Real', 'Hays County ', 'description', ST_MakePoint(-97.728111, 30.009392), ST_AsGeoJSON(ST_MakePoint(-97.728111, 30.009392)), '{9016}'),
(1410, 1773, 'CR 337 @ HWY 29', 'CR 337 @ HWY 29', 'description', ST_MakePoint(-97.456779, 30.643402), ST_AsGeoJSON(ST_MakePoint(-97.456779, 30.643402)), '{9017}'),
(1411, 1774, 'CR 337 @ CR  124', 'CR 337 @ CR 124', 'description', ST_MakePoint(-97.466133, 30.666071), ST_AsGeoJSON(ST_MakePoint(-97.466133, 30.666071)), '{9017}'),
(1412, 1775, 'River Trail Bridge MM3.3', 'City of Georgetown', 'description', ST_MakePoint(-97.706497, 30.662779), ST_AsGeoJSON(ST_MakePoint(-97.706497, 30.662779)), '{9015}'),
(1413, 1776, 'River Trail Bridge under IH35', 'City of Georgetown', 'description', ST_MakePoint(-97.683403, 30.645309), ST_AsGeoJSON(ST_MakePoint(-97.683403, 30.645309)), '{9015}'),
(1414, 1777, 'Lower Park Rd at Chamber Way', 'City of Georgetown', 'description', ST_MakePoint(-97.672668, 30.647072), ST_AsGeoJSON(ST_MakePoint(-97.672668, 30.647072)), '{9015}'),
(1415, 1778, 'CR 356', 'CR 356', 'description', ST_MakePoint(-97.373032, 30.734707), ST_AsGeoJSON(ST_MakePoint(-97.373032, 30.734707)), '{9017}'),
(1416, 1779, 'CR 230', 'CR 230', 'description', ST_MakePoint(-97.750427, 30.871168), ST_AsGeoJSON(ST_MakePoint(-97.750427, 30.871168)), '{9017}'),
(1417, 1780, 'Ave G & 11th St', 'AVE G & 11TH ST; MARBLE FALLS, TX 78654', 'description', ST_MakePoint(-98.270241, 30.578327), ST_AsGeoJSON(ST_MakePoint(-98.270241, 30.578327)), '{9006}'),
(1418, 1781, 'River Rd @ Loma Vista ', 'Hays County', 'description', ST_MakePoint(-98.100525, 29.993076), ST_AsGeoJSON(ST_MakePoint(-98.100525, 29.993076)), '{9016}'),
(1419, 1783, '610 Shady Hollow Dr - SW side', 'Wilco', 'description', ST_MakePoint(-97.682587, 30.665737), ST_AsGeoJSON(ST_MakePoint(-97.682587, 30.665737)), '{9015}'),
(1420, 1784, '811 Shady Hollow Dr - NW side', 'Wilco', 'description', ST_MakePoint(-97.674622, 30.668791), ST_AsGeoJSON(ST_MakePoint(-97.674622, 30.668791)), '{9015}'),
(1421, 1785, '608 Golden Oaks Rd - SE side', 'Wilco', 'description', ST_MakePoint(-97.679573, 30.665003), ST_AsGeoJSON(ST_MakePoint(-97.679573, 30.665003)), '{9015}'),
(1422, 1786, '709 Golden Oaks Rd', 'Wilco', 'description', ST_MakePoint(-97.676056, 30.665386), ST_AsGeoJSON(ST_MakePoint(-97.676056, 30.665386)), '{9015}'),
(1423, 1787, 'P2051 170 Blk Cassel Way', 'P2051 170 Blk Cassel Way', 'description', ST_MakePoint(-97.237305, 30.155321), ST_AsGeoJSON(ST_MakePoint(-97.237305, 30.155321)), '{9012}'),
(1424, 1788, 'CR 309 @ Pin Oak', 'Lee County', 'description', ST_MakePoint(-97.137146, 30.385496), ST_AsGeoJSON(ST_MakePoint(-97.137146, 30.385496)), '{9013}'),
(1425, 1790, 'Henry Marx @ Barton Creek ', 'Travis County, TX ', 'description', ST_MakePoint(-97.887207, 30.270620), ST_AsGeoJSON(ST_MakePoint(-97.887207, 30.270620)), '{9010}'),
(1426, 1791, 'Big Sandy @ Round Mountain ', 'Travis County, TX ', 'description', ST_MakePoint(-97.947975, 30.571045), ST_AsGeoJSON(ST_MakePoint(-97.947975, 30.571045)), '{9010}'),
(1427, 1793, 'FM 1826 @ Zyle ', 'Travis County, TX ', 'description', ST_MakePoint(-97.921150, 30.198986), ST_AsGeoJSON(ST_MakePoint(-97.921150, 30.198986)), '{9010}'),
(1428, 1794, 'Oak Hill Cemetery Rd West of Herron Tr', 'Oak Hill Cemetery Rd West of Herron Tr', 'description', ST_MakePoint(-97.263367, 30.222258), ST_AsGeoJSON(ST_MakePoint(-97.263367, 30.222258)), '{9012}'),
(1429, 1795, 'Herron Trail', 'Herron Trail', 'description', ST_MakePoint(-97.258026, 30.223463), ST_AsGeoJSON(ST_MakePoint(-97.258026, 30.223463)), '{9012}'),
(1430, 1796, 'Oriole Loop', 'Caldwell County', 'description', ST_MakePoint(-97.406296, 29.798838), ST_AsGeoJSON(ST_MakePoint(-97.406296, 29.798838)), '{9011}'),
(1431, 1797, '391 Porter Road', '391 Porter Road', 'description', ST_MakePoint(-97.259186, 30.158215), ST_AsGeoJSON(ST_MakePoint(-97.259186, 30.158215)), '{9012}'),
(1432, 1798, 'Buck Branch', 'Caldwell County', 'description', ST_MakePoint(-97.406151, 29.756336), ST_AsGeoJSON(ST_MakePoint(-97.406151, 29.756336)), '{9011}'),
(1433, 1799, 'Sandy Fork Rd', 'Caldwell County', 'description', ST_MakePoint(-97.421875, 29.769947), ST_AsGeoJSON(ST_MakePoint(-97.421875, 29.769947)), '{9011}'),
(1434, 1800, 'FM 619 &amp; CR 415', 'FM 619 &amp; CR 415', 'description', ST_MakePoint(-97.390236, 30.643354), ST_AsGeoJSON(ST_MakePoint(-97.390236, 30.643354)), '{9017}'),
(1435, 1801, 'WoodCreek Dr @ Cypress Point', 'Hays County', 'description', ST_MakePoint(-98.117538, 30.021112), ST_AsGeoJSON(ST_MakePoint(-98.117538, 30.021112)), '{9016}'),
(1436, 1802, 'CR 333 & FM 971', 'CR 333 & FM 971', 'description', ST_MakePoint(-97.503838, 30.684809), ST_AsGeoJSON(ST_MakePoint(-97.503838, 30.684809)), '{9017}'),
(1437, 1803, 'CR 314', 'CR 314', 'description', ST_MakePoint(-97.601936, 30.794815), ST_AsGeoJSON(ST_MakePoint(-97.601936, 30.794815)), '{9017}'),
(1438, 1804, 'FM 1826 @ Lewis Mountain ', 'Travis County, TX', 'description', ST_MakePoint(-97.911179, 30.206848), ST_AsGeoJSON(ST_MakePoint(-97.911179, 30.206848)), '{9010}'),
(1439, 1806, '1100 Blk Lower Elgin Rd', '1100 Blk Lower Elgin Rd', 'description', ST_MakePoint(-97.409477, 30.222834), ST_AsGeoJSON(ST_MakePoint(-97.409477, 30.222834)), '{9012}'),
(1440, 1807, 'Pine Valley Loop', '200 Blk', 'description', ST_MakePoint(-97.303185, 29.953863), ST_AsGeoJSON(ST_MakePoint(-97.303185, 29.953863)), '{9012}'),
(1441, 1808, 'East side of Tahitian Dr at Kaanapali', 'East side of Tahitian Dr at Kaanapali', 'description', ST_MakePoint(-97.284248, 30.088430), ST_AsGeoJSON(ST_MakePoint(-97.284248, 30.088430)), '{9012}'),
(1442, 1809, '500 Blk Lower Elgin Rd', '500 Blk Lower Elgin Rd', 'description', ST_MakePoint(-97.398445, 30.277292), ST_AsGeoJSON(ST_MakePoint(-97.398445, 30.277292)), '{9012}'),
(1443, 1810, '304 South of 535', '304 South of 535', 'description', ST_MakePoint(-97.310127, 29.931849), ST_AsGeoJSON(ST_MakePoint(-97.310127, 29.931849)), '{9012}'),
(1444, 1811, 'CR 117 @ Trubitary to Nails Creek', 'Lee County', 'description', ST_MakePoint(-96.847595, 30.235800), ST_AsGeoJSON(ST_MakePoint(-96.847595, 30.235800)), '{9013}'),
(1445, 1812, '200 Blk FM 2571 ', '200 Blk FM 2571 ', 'description', ST_MakePoint(-97.171227, 30.013432), ST_AsGeoJSON(ST_MakePoint(-97.171227, 30.013432)), '{9012}'),
(1446, 1813, 'CR 426', 'CR 426', 'description', ST_MakePoint(-97.241882, 30.628513), ST_AsGeoJSON(ST_MakePoint(-97.241882, 30.628513)), '{9017}'),
(1447, 1814, '800 Blk Stockade Ranch Rd', '800 Blk Stockade Ranch Rd', 'description', ST_MakePoint(-97.147392, 30.261410), ST_AsGeoJSON(ST_MakePoint(-97.147392, 30.261410)), '{9012}'),
(1448, 1815, 'Turkey Ridge Rd Riddle Rd', 'Turkey Ridge Rd Riddle Rd', 'description', ST_MakePoint(-97.539978, 30.015995), ST_AsGeoJSON(ST_MakePoint(-97.539978, 30.015995)), '{9012}'),
(1449, 1816, 'CR 428', 'CR 428', 'description', ST_MakePoint(-97.278870, 30.694860), ST_AsGeoJSON(ST_MakePoint(-97.278870, 30.694860)), '{9017}'),
(1450, 1817, '1200 Blk Old McDade Rd', '1200 Blk Old McDade Rd', 'description', ST_MakePoint(-97.329803, 30.334721), ST_AsGeoJSON(ST_MakePoint(-97.329803, 30.334721)), '{9012}'),
(1451, 1818, 'OLD PIN OAK', '650 BLK near Antioch Rd', 'description', ST_MakePoint(-97.131813, 30.176414), ST_AsGeoJSON(ST_MakePoint(-97.131813, 30.176414)), '{9012}'),
(1452, 1819, '200 Blk Roland Ln', 'City of Kyle ', 'description', ST_MakePoint(-97.878647, 29.960945), ST_AsGeoJSON(ST_MakePoint(-97.878647, 29.960945)), '{9016}'),
(1453, 1821, '100 Blk Winfield Thicket', '100 Blk Winfield Thicket', 'description', ST_MakePoint(-97.242683, 30.053019), ST_AsGeoJSON(ST_MakePoint(-97.242683, 30.053019)), '{9012}'),
(1454, 1822, 'Paint Creek Bridge on Paint Creek Rd', 'Paint Creek Bridge on Paint Creek Rd', 'description', ST_MakePoint(-97.187004, 30.277124), ST_AsGeoJSON(ST_MakePoint(-97.187004, 30.277124)), '{9012}'),
(1455, 1823, '300 Community Center Road', '300 Community Center Road', 'description', ST_MakePoint(-97.379982, 29.898951), ST_AsGeoJSON(ST_MakePoint(-97.379982, 29.898951)), '{9012}'),
(1456, 1825, 'US 290 @ Red Elm Pkwy ', 'Travis County, TX ', 'description', ST_MakePoint(-97.433807, 30.352812), ST_AsGeoJSON(ST_MakePoint(-97.433807, 30.352812)), '{9010}'),
(1457, 1826, 'Rek Hill Rd', 'Rek Hill @ SH 159', 'description', ST_MakePoint(-96.639008, 29.934271), ST_AsGeoJSON(ST_MakePoint(-96.639008, 29.934271)), '{9018}'),
(1458, 1827, 'Hwy 159 @ Darden Loop', '159 @ Darden Loop', 'description', ST_MakePoint(-96.609566, 29.963202), ST_AsGeoJSON(ST_MakePoint(-96.609566, 29.963202)), '{9018}'),
(1459, 1829, 'FM 1291 @ Haw Creek', '1291 @ Haw Creek', 'description', ST_MakePoint(-96.688789, 29.960443), ST_AsGeoJSON(ST_MakePoint(-96.688789, 29.960443)), '{9018}'),
(1460, 1830, 'FM 1291 @ Halamicek Loop', 'FM 1291 @ Halamicek Loop', 'description', ST_MakePoint(-96.698441, 29.975910), ST_AsGeoJSON(ST_MakePoint(-96.698441, 29.975910)), '{9018}'),
(1461, 1831, 'Mullins Prairie Loop Southbound', 'Mullins Prarie Loop Southbound', 'description', ST_MakePoint(-96.792381, 29.860403), ST_AsGeoJSON(ST_MakePoint(-96.792381, 29.860403)), '{9018}'),
(1462, 1832, 'Mullins Prairie Loop @ Loehr Rd', 'Mullins Prairie Loop @ Loehr Rd', 'description', ST_MakePoint(-96.813881, 29.864220), ST_AsGeoJSON(ST_MakePoint(-96.813881, 29.864220)), '{9018}'),
(1463, 1834, 'Stockade Ranch Rd', '1300-1400 BLK', 'description', ST_MakePoint(-97.151466, 30.270452), ST_AsGeoJSON(ST_MakePoint(-97.151466, 30.270452)), '{9012}'),
(1464, 1835, 'P1028 KoleKole Ln', 'KoleKole Ln at low water crossing', 'description', ST_MakePoint(-97.298325, 30.074764), ST_AsGeoJSON(ST_MakePoint(-97.298325, 30.074764)), '{9012}'),
(1465, 1841, 'Kitchen Lane ', 'Kitchen Lane @ Hwy 71', 'description', ST_MakePoint(-96.741486, 29.862785), ST_AsGeoJSON(ST_MakePoint(-96.741486, 29.862785)), '{9018}'),
(1466, 1842, 'Zapalac Rd ', 'Zapalac Rd @ Hwy 71', 'description', ST_MakePoint(-96.749596, 29.871178), ST_AsGeoJSON(ST_MakePoint(-96.749596, 29.871178)), '{9018}'),
(1467, 1844, 'P1029 Koele Ct', '100 Blk Koele Ct', 'description', ST_MakePoint(-97.322655, 30.087278), ST_AsGeoJSON(ST_MakePoint(-97.322655, 30.087278)), '{9012}'),
(1468, 1845, 'CR 494', 'CR 494', 'description', ST_MakePoint(-97.259216, 30.700129), ST_AsGeoJSON(ST_MakePoint(-97.259216, 30.700129)), '{9017}'),
(1469, 1846, '200 Blk Littig Rd', '200 Blk Littig Rd', 'description', ST_MakePoint(-97.402588, 30.341646), ST_AsGeoJSON(ST_MakePoint(-97.402588, 30.341646)), '{9012}'),
(1470, 1847, 'P1030 Kamakoa Ln ', '174 Kamakoa Ln', 'description', ST_MakePoint(-97.293259, 30.093925), ST_AsGeoJSON(ST_MakePoint(-97.293259, 30.093925)), '{9012}'),
(1471, 1848, '200 Blk Lone Star Rd', '200 Blk Lone Star Rd', 'description', ST_MakePoint(-97.411018, 30.043024), ST_AsGeoJSON(ST_MakePoint(-97.411018, 30.043024)), '{9012}'),
(1472, 1849, '100 Blk Big Bow', '100 Blk Big Bow', 'description', ST_MakePoint(-97.092758, 30.044622), ST_AsGeoJSON(ST_MakePoint(-97.092758, 30.044622)), '{9012}'),
(1473, 1851, 'Gotier Trace at Alum Creek', 'Gotier Trace at Alum Creek', 'description', ST_MakePoint(-97.213692, 30.104731), ST_AsGeoJSON(ST_MakePoint(-97.213692, 30.104731)), '{9012}'),
(1474, 1853, 'Stueve Lane', 'City of Lockhart', 'description', ST_MakePoint(-97.690659, 29.891153), ST_AsGeoJSON(ST_MakePoint(-97.690659, 29.891153)), '{9011}'),
(1475, 1854, 'Witter Road', 'Caldwell County', 'description', ST_MakePoint(-97.623901, 29.902445), ST_AsGeoJSON(ST_MakePoint(-97.623901, 29.902445)), '{9011}'),
(1476, 1855, 'Johnson Street', 'Martindale', 'description', ST_MakePoint(-97.845451, 29.839888), ST_AsGeoJSON(ST_MakePoint(-97.845451, 29.839888)), '{9011}'),
(1477, 1856, 'North Pecos', 'City of Lockhart', 'description', ST_MakePoint(-97.679214, 29.891785), ST_AsGeoJSON(ST_MakePoint(-97.679214, 29.891785)), '{9011}'),
(1478, 1857, 'Reed Creek Drive', 'Caldwell County', 'description', ST_MakePoint(-97.412186, 29.737156), ST_AsGeoJSON(ST_MakePoint(-97.412186, 29.737156)), '{9011}'),
(1479, 1858, 'CR 401 @ Tributary to East Yegua Creek', 'Lee County', 'description', ST_MakePoint(-96.891800, 30.418373), ST_AsGeoJSON(ST_MakePoint(-96.891800, 30.418373)), '{9013}'),
(1480, 1859, 'CR 418', 'CR 418', 'description', ST_MakePoint(-97.346680, 30.660755), ST_AsGeoJSON(ST_MakePoint(-97.346680, 30.660755)), '{9017}'),
(1481, 1860, 'CR 463', 'CR 463', 'description', ST_MakePoint(-97.352257, 30.438120), ST_AsGeoJSON(ST_MakePoint(-97.352257, 30.438120)), '{9017}'),
(1482, 1861, '213 S. CM Allen Pkwy (Children', 'City of San Marcos ', 'description', ST_MakePoint(-97.936417, 29.880699), ST_AsGeoJSON(ST_MakePoint(-97.936417, 29.880699)), '{9016}'),
(1483, 1862, 'CR 327w @ Tributary to West Yegua Creek', 'Lee County', 'description', ST_MakePoint(-96.969643, 30.296951), ST_AsGeoJSON(ST_MakePoint(-96.969643, 30.296951)), '{9013}'),
(1484, 1863, '120 Bert Brown St (San Marcos Treatment Center Entrance)', 'City of San Marcos ', 'description', ST_MakePoint(-97.926392, 29.896421), ST_AsGeoJSON(ST_MakePoint(-97.926392, 29.896421)), '{9016}'),
(1485, 1864, '190 Pine Canyon Dr', '190 Pine Canyon Dr', 'description', ST_MakePoint(-97.319290, 29.956299), ST_AsGeoJSON(ST_MakePoint(-97.319290, 29.956299)), '{9012}'),
(1486, 1865, 'Wilbarger Creek Dr', 'Wilbarger Creek Dr', 'description', ST_MakePoint(-97.416107, 30.227524), ST_AsGeoJSON(ST_MakePoint(-97.416107, 30.227524)), '{9012}'),
(1487, 1866, 'Copperhead Rd', 'Copperhead @ Lee Co Line', 'description', ST_MakePoint(-97.024216, 30.040434), ST_AsGeoJSON(ST_MakePoint(-97.024216, 30.040434)), '{9018}'),
(1488, 1867, 'Plum Church Rd', 'Plum Church @ Plum Wonderful', 'description', ST_MakePoint(-96.975609, 29.925411), ST_AsGeoJSON(ST_MakePoint(-96.975609, 29.925411)), '{9018}'),
(1489, 1868, 'Adamcik Rd', 'Adamcik off 1383', 'description', ST_MakePoint(-96.834785, 29.749142), ST_AsGeoJSON(ST_MakePoint(-96.834785, 29.749142)), '{9018}'),
(1490, 1870, 'Middle Creek Rd', 'Middle Creek Rd N Schulenburg', 'description', ST_MakePoint(-96.885162, 29.759178), ST_AsGeoJSON(ST_MakePoint(-96.885162, 29.759178)), '{9018}'),
(1491, 1871, 'Hermis Rd', 'Hermis over Mulberry Creek', 'description', ST_MakePoint(-96.938766, 29.652189), ST_AsGeoJSON(ST_MakePoint(-96.938766, 29.652189)), '{9018}'),
(1492, 1872, 'CR 255', 'CR 255', 'description', ST_MakePoint(-97.853767, 30.751747), ST_AsGeoJSON(ST_MakePoint(-97.853767, 30.751747)), '{9017}'),
(1493, 1873, 'CR 257', 'CR 257', 'description', ST_MakePoint(-97.869514, 30.698648), ST_AsGeoJSON(ST_MakePoint(-97.869514, 30.698648)), '{9017}'),
(1494, 1874, 'CR 215', 'CR 215', 'description', ST_MakePoint(-97.985001, 30.823446), ST_AsGeoJSON(ST_MakePoint(-97.985001, 30.823446)), '{9017}'),
(1495, 1875, 'Longhorn Dr Culvert', 'Longhorn Dr Culvert', 'description', ST_MakePoint(-97.226059, 30.156879), ST_AsGeoJSON(ST_MakePoint(-97.226059, 30.156879)), '{9012}'),
(1496, 1877, 'Raven Rd', 'Raven Rd', 'description', ST_MakePoint(-97.182098, 30.074966), ST_AsGeoJSON(ST_MakePoint(-97.182098, 30.074966)), '{9012}'),
(1497, 1878, 'Agget Rd', 'Agget Rd', 'description', ST_MakePoint(-97.177376, 30.078941), ST_AsGeoJSON(ST_MakePoint(-97.177376, 30.078941)), '{9012}'),
(1498, 1881, 'Low Water Crossing Rd @ Mansfield Dam', 'Travis County, TX', 'description', ST_MakePoint(-97.913353, 30.388172), ST_AsGeoJSON(ST_MakePoint(-97.913353, 30.388172)), '{9010}'),
(1499, 1882, 'Trinity Street near Hackberry', '1140 Hackberry, Luling', 'description', ST_MakePoint(-97.652695, 29.690315), ST_AsGeoJSON(ST_MakePoint(-97.652695, 29.690315)), '{9011}'),
(1500, 1883, 'Hackberry Street (700 bk)', 'Hackberry St. Luling', 'description', ST_MakePoint(-97.653038, 29.687967), ST_AsGeoJSON(ST_MakePoint(-97.653038, 29.687967)), '{9011}'),
(1501, 1884, 'Goliad Street, Luling', '500 Bk Goliad Street, Luling', 'description', ST_MakePoint(-97.648643, 29.685747), ST_AsGeoJSON(ST_MakePoint(-97.648643, 29.685747)), '{9011}'),
(1502, 1885, 'Elm/Davis, Luling', 'Elm &amp; Davis St. Luling', 'description', ST_MakePoint(-97.639435, 29.679951), ST_AsGeoJSON(ST_MakePoint(-97.639435, 29.679951)), '{9011}'),
(1503, 1886, 'Davis Street (FM1322) at City Limit, Luling', 'FM1322 - Luling city limit', 'description', ST_MakePoint(-97.625168, 29.676464), ST_AsGeoJSON(ST_MakePoint(-97.625168, 29.676464)), '{9011}'),
(1504, 1887, 'Davis at Mimosa St, Luling', 'Luling', 'description', ST_MakePoint(-97.662674, 29.682615), ST_AsGeoJSON(ST_MakePoint(-97.662674, 29.682615)), '{9011}'),
(1505, 1888, 'Laurel Street at Zedler Mill, Luling', 'Luling', 'description', ST_MakePoint(-97.650940, 29.667702), ST_AsGeoJSON(ST_MakePoint(-97.650940, 29.667702)), '{9011}'),
(1506, 1889, 'Club St at Bellaire St, Luling', 'Luling', 'description', ST_MakePoint(-97.647781, 29.666491), ST_AsGeoJSON(ST_MakePoint(-97.647781, 29.666491)), '{9011}'),
(1507, 1890, 'CR 105 near Hwy 90, Luling', 'Luling', 'description', ST_MakePoint(-97.698509, 29.670853), ST_AsGeoJSON(ST_MakePoint(-97.698509, 29.670853)), '{9011}'),
(1508, 1891, 'Whisper Street at Plum Creek', 'Luling', 'description', ST_MakePoint(-97.601845, 29.657335), ST_AsGeoJSON(ST_MakePoint(-97.601845, 29.657335)), '{9011}'),
(1509, 1892, '500 Bk Southern Way, Luling', 'Luling', 'description', ST_MakePoint(-97.604286, 29.653362), ST_AsGeoJSON(ST_MakePoint(-97.604286, 29.653362)), '{9011}'),
(1510, 1893, 'Trinity Street and Laurel, Luling', 'Luling', 'description', ST_MakePoint(-97.648315, 29.688078), ST_AsGeoJSON(ST_MakePoint(-97.648315, 29.688078)), '{9011}'),
(1511, 1894, 'E Fannin near Poppy, Luling', 'Luling', 'description', ST_MakePoint(-97.641220, 29.681723), ST_AsGeoJSON(ST_MakePoint(-97.641220, 29.681723)), '{9011}'),
(1512, 1895, 'HWY 183 at I-10, Luling', 'Luling', 'description', ST_MakePoint(-97.593147, 29.652784), ST_AsGeoJSON(ST_MakePoint(-97.593147, 29.652784)), '{9011}'),
(1513, 1896, 'Hertel Road', 'Hertel Road @ Foster', 'description', ST_MakePoint(-96.922974, 29.705248), ST_AsGeoJSON(ST_MakePoint(-96.922974, 29.705248)), '{9018}'),
(1514, 1897, 'Medina Vista Ln @ Big Sandy Creek', 'Travis County, TX', 'description', ST_MakePoint(-97.911362, 30.504423), ST_AsGeoJSON(ST_MakePoint(-97.911362, 30.504423)), '{9010}'),
(1515, 1898, 'Medina Street', 'Lockhart', 'description', ST_MakePoint(-97.678406, 29.871357), ST_AsGeoJSON(ST_MakePoint(-97.678406, 29.871357)), '{9011}'),
(1516, 1899, 'Lehman @ Hallie Dr', 'City Of Kyle ', 'description', ST_MakePoint(-97.857574, 29.991690), ST_AsGeoJSON(ST_MakePoint(-97.857574, 29.991690)), '{9016}'),
(1517, 1900, '1200 blk Roland Ln', 'City Of Kyle', 'description', ST_MakePoint(-97.888031, 29.968817), ST_AsGeoJSON(ST_MakePoint(-97.888031, 29.968817)), '{9016}'),
(1518, 1901, 'Cameron Rd @ Cele Rd', 'Travis County, TX', 'description', ST_MakePoint(-97.523453, 30.440065), ST_AsGeoJSON(ST_MakePoint(-97.523453, 30.440065)), '{9010}'),
(1519, 1903, 'St Andrews low area', '30401 St. Andrews Dr.', 'description', ST_MakePoint(-97.668571, 30.714464), ST_AsGeoJSON(ST_MakePoint(-97.668571, 30.714464)), '{9015}'),
(1520, 1904, 'Ralph Ritchie Rd @ Low Water Xing', 'Travis County, TX', 'description', ST_MakePoint(-97.530006, 30.361917), ST_AsGeoJSON(ST_MakePoint(-97.530006, 30.361917)), '{9010}'),
(1521, 1906, 'Guadalupe Street', 'Lockhart', 'description', ST_MakePoint(-97.673073, 29.872948), ST_AsGeoJSON(ST_MakePoint(-97.673073, 29.872948)), '{9011}'),
(1522, 1907, 'Navarro Creek Rd @ SH 71', 'Travis County, TX', 'description', ST_MakePoint(-97.582870, 30.189955), ST_AsGeoJSON(ST_MakePoint(-97.582870, 30.189955)), '{9010}'),
(1523, 1908, 'LUCIANO FLORES BLVD @ CAPE RD  ', 'City of San Marcos ', 'description', ST_MakePoint(-97.935715, 29.868261), ST_AsGeoJSON(ST_MakePoint(-97.935715, 29.868261)), '{9016}'),
(1524, 1909, 'Pecos Street', 'Lockhart', 'description', ST_MakePoint(-97.679153, 29.891338), ST_AsGeoJSON(ST_MakePoint(-97.679153, 29.891338)), '{9011}'),
(1525, 1910, '2200BLK RIVER', 'City of San Marcos ', 'description', ST_MakePoint(-97.903717, 29.888996), ST_AsGeoJSON(ST_MakePoint(-97.903717, 29.888996)), '{9016}'),
(1526, 1911, 'COG - Industrial Ave', '300 Industrial Ave', 'description', ST_MakePoint(-97.677773, 30.621180), ST_AsGeoJSON(ST_MakePoint(-97.677773, 30.621180)), '{9015}'),
(1527, 1912, 'State Park Road at Main St', 'Lockhart', 'description', ST_MakePoint(-97.669800, 29.872213), ST_AsGeoJSON(ST_MakePoint(-97.669800, 29.872213)), '{9011}'),
(1528, 1913, 'Sandholler Road (between Taylorsville Rd and Sandy Creek Rd', 'Caldwell County', 'description', ST_MakePoint(-97.558258, 29.929747), ST_AsGeoJSON(ST_MakePoint(-97.558258, 29.929747)), '{9011}'),
(1529, 1916, 'CR 358', 'CR 358', 'description', ST_MakePoint(-97.347923, 30.743710), ST_AsGeoJSON(ST_MakePoint(-97.347923, 30.743710)), '{9017}'),
(1530, 1917, 'CR 490', 'CR 490', 'description', ST_MakePoint(-97.274529, 30.430979), ST_AsGeoJSON(ST_MakePoint(-97.274529, 30.430979)), '{9017}'),
(1531, 1918, 'CR 418', 'CR 418', 'description', ST_MakePoint(-97.270882, 30.742809), ST_AsGeoJSON(ST_MakePoint(-97.270882, 30.742809)), '{9017}'),
(1532, 1919, 'FM 967 @ BRANGUS RD', 'Hays County', 'description', ST_MakePoint(-97.983673, 30.117086), ST_AsGeoJSON(ST_MakePoint(-97.983673, 30.117086)), '{9016}'),
(1533, 1920, 'Bois D&#039;arc Rd @ Kimbro West Rd', 'Travis County, TX', 'description', ST_MakePoint(-97.487968, 30.380096), ST_AsGeoJSON(ST_MakePoint(-97.487968, 30.380096)), '{9010}'),
(1534, 1921, '200 Blk The Forest Rd', '200 Blk The Forest Rd', 'description', ST_MakePoint(-97.568375, 30.036097), ST_AsGeoJSON(ST_MakePoint(-97.568375, 30.036097)), '{9012}'),
(1535, 1922, 'CR 340', 'CR 340', 'description', ST_MakePoint(-97.478989, 30.689791), ST_AsGeoJSON(ST_MakePoint(-97.478989, 30.689791)), '{9017}'),
(1536, 1923, 'CR 469', 'CR 469', 'description', ST_MakePoint(-97.312004, 30.470070), ST_AsGeoJSON(ST_MakePoint(-97.312004, 30.470070)), '{9017}'),
(1537, 1924, 'CR 472', 'CR 472', 'description', ST_MakePoint(-97.261452, 30.487789), ST_AsGeoJSON(ST_MakePoint(-97.261452, 30.487789)), '{9017}'),
(1538, 1925, 'Old Bastrop Hwy @ Capistrano Dr', 'Hays County', 'description', ST_MakePoint(-97.936638, 29.831541), ST_AsGeoJSON(ST_MakePoint(-97.936638, 29.831541)), '{9016}'),
(1539, 1928, 'CR 313 @ Cross Creek', 'Lee County', 'description', ST_MakePoint(-97.153099, 30.458855), ST_AsGeoJSON(ST_MakePoint(-97.153099, 30.458855)), '{9013}'),
(1540, 1929, 'Dixieland RV Park ', 'Dixieland RV Park at Spur 458', 'description', ST_MakePoint(-96.683205, 30.144930), ST_AsGeoJSON(ST_MakePoint(-96.683205, 30.144930)), '{9018}'),
(1541, 1930, 'Carmine Cemetery Rd', 'Carmine Cemetery Road at Hauptstrass', 'description', ST_MakePoint(-96.685997, 30.146284), ST_AsGeoJSON(ST_MakePoint(-96.685997, 30.146284)), '{9018}'),
(1542, 1931, '9400-blk FM 1625 Rd', 'Travis County, TX ', 'description', ST_MakePoint(-97.712379, 30.125433), ST_AsGeoJSON(ST_MakePoint(-97.712379, 30.125433)), '{9010}'),
(1543, 1932, '200 Block FM 2239', '200 Block FM 2239', 'description', ST_MakePoint(-97.067429, 30.137945), ST_AsGeoJSON(ST_MakePoint(-97.067429, 30.137945)), '{9012}'),
(1544, 1933, 'FM 1625 @ Maha Creek', 'Travis County, TX', 'description', ST_MakePoint(-97.735039, 30.085224), ST_AsGeoJSON(ST_MakePoint(-97.735039, 30.085224)), '{9010}'),
(1545, 1934, 'US 183 @ South Dry Creek', 'Travis County, TX', 'description', ST_MakePoint(-97.695877, 30.131126), ST_AsGeoJSON(ST_MakePoint(-97.695877, 30.131126)), '{9010}'),
(1546, 1935, 'FM1854 at Williamson Rd', 'Caldwell County', 'description', ST_MakePoint(-97.657799, 30.016268), ST_AsGeoJSON(ST_MakePoint(-97.657799, 30.016268)), '{9011}'),
(1547, 1936, 'FM1854 at Hwy 21', 'Caldwell County', 'description', ST_MakePoint(-97.674385, 30.030464), ST_AsGeoJSON(ST_MakePoint(-97.674385, 30.030464)), '{9011}'),
(1548, 1937, '774 Old Sayers', '774 Old Sayers', 'description', ST_MakePoint(-97.367760, 30.285519), ST_AsGeoJSON(ST_MakePoint(-97.367760, 30.285519)), '{9012}'),
(1549, 1938, 'N Old Stagecoach Rd- S of Rebel Rd', 'City of Kyle ', 'description', ST_MakePoint(-97.892090, 30.011984), ST_AsGeoJSON(ST_MakePoint(-97.892090, 30.011984)), '{9016}'),
(1550, 1939, ' Elroy Rd @ Mcangus ', 'Travis County, TX', 'description', ST_MakePoint(-97.659248, 30.167299), ST_AsGeoJSON(ST_MakePoint(-97.659248, 30.167299)), '{9010}'),
(1551, 1940, 'Pearce Ln/Kellam Rd', 'Travis County, TX', 'description', ST_MakePoint(-97.611130, 30.163700), ST_AsGeoJSON(ST_MakePoint(-97.611130, 30.163700)), '{9010}'),
(1552, 1941, '8000-Blk Elroy Rd', 'Travis County, TX', 'description', ST_MakePoint(-97.616264, 30.141956), ST_AsGeoJSON(ST_MakePoint(-97.616264, 30.141956)), '{9010}'),
(1553, 1942, 'Von Quintus Rd/Maha Loop Rd', 'Travis County, TX', 'description', ST_MakePoint(-97.684654, 30.097244), ST_AsGeoJSON(ST_MakePoint(-97.684654, 30.097244)), '{9010}'),
(1554, 1943, 'Tom Sassman Rd/ US 183', 'Travis County, TX', 'description', ST_MakePoint(-97.693810, 30.088797), ST_AsGeoJSON(ST_MakePoint(-97.693810, 30.088797)), '{9010}'),
(1555, 1944, 'Maha Rd/Schriber Rd', 'Travis County, TX', 'description', ST_MakePoint(-97.666214, 30.082067), ST_AsGeoJSON(ST_MakePoint(-97.666214, 30.082067)), '{9010}'),
(1556, 1945, 'FM 153@ KARISCH RD ', 'FM 153@ KARISCH RD ', 'description', ST_MakePoint(-97.071083, 30.028387), ST_AsGeoJSON(ST_MakePoint(-97.071083, 30.028387)), '{9012}'),
(1557, 1947, 'Bois D&#039;Arc', '400 Bois D&#039;Arc', 'description', ST_MakePoint(-97.677353, 29.886465), ST_AsGeoJSON(ST_MakePoint(-97.677353, 29.886465)), '{9011}'),
(1558, 1948, 'Pancho/Blackjack', 'Pancho/Blackjack', 'description', ST_MakePoint(-97.661598, 29.871990), ST_AsGeoJSON(ST_MakePoint(-97.661598, 29.871990)), '{9011}'),
(1559, 1949, '1300 Park Road 1C', '1300 Park Road 1C', 'description', ST_MakePoint(-97.182175, 30.083752), ST_AsGeoJSON(ST_MakePoint(-97.182175, 30.083752)), '{9012}'),
(1560, 1950, 'Track Road', 'Track Road @ FM 20', 'description', ST_MakePoint(-97.524681, 29.928129), ST_AsGeoJSON(ST_MakePoint(-97.524681, 29.928129)), '{9011}'),
(1561, 1951, 'HWY 21 BRIDGE N OF ROHDE RD', ' Hays County ', 'description', ST_MakePoint(-97.741821, 29.999559), ST_AsGeoJSON(ST_MakePoint(-97.741821, 29.999559)), '{9016}'),
(1562, 1952, '12000 Old Lytton springs Road', '12000 Old Lytton Springs Road', 'description', ST_MakePoint(-97.660980, 29.946407), ST_AsGeoJSON(ST_MakePoint(-97.660980, 29.946407)), '{9011}'),
(1563, 1955, 'Sh 71 @ Wolf Ln', 'Travis County, TX ', 'description', ST_MakePoint(-97.541183, 30.182739), ST_AsGeoJSON(ST_MakePoint(-97.541183, 30.182739)), '{9010}'),
(1564, 1956, 'Woodland Ct.', 'Woodland Ct.', 'description', ST_MakePoint(-97.268494, 30.079109), ST_AsGeoJSON(ST_MakePoint(-97.268494, 30.079109)), '{9012}'),
(1565, 1957, 'Rolling Ridge', 'Rolling Ridge @ Polonia', 'description', ST_MakePoint(-97.699348, 29.941591), ST_AsGeoJSON(ST_MakePoint(-97.699348, 29.941591)), '{9011}'),
(1566, 1958, '13700  Camino Real (FM21)', '13700 Camino Real (FM21)', 'description', ST_MakePoint(-97.730713, 30.007318), ST_AsGeoJSON(ST_MakePoint(-97.730713, 30.007318)), '{9011}'),
(1567, 1959, '11200 Maha Loop', 'Travis County, TX', 'description', ST_MakePoint(-97.661751, 30.086826), ST_AsGeoJSON(ST_MakePoint(-97.661751, 30.086826)), '{9010}'),
(1568, 1960, 'Coulver RD @ FM 1625', 'Travis County, TX ', 'description', ST_MakePoint(-97.711555, 30.114235), ST_AsGeoJSON(ST_MakePoint(-97.711555, 30.114235)), '{9010}'),
(1569, 1961, 'Burklund Farms Rd @ Moore RD', 'Travis County, TX ', 'description', ST_MakePoint(-97.649673, 30.113880), ST_AsGeoJSON(ST_MakePoint(-97.649673, 30.113880)), '{9010}'),
(1570, 1963, 'Coulver Rd @ Coulver Cove Crt', 'Travis County, TX', 'description', ST_MakePoint(-97.727333, 30.117739), ST_AsGeoJSON(ST_MakePoint(-97.727333, 30.117739)), '{9010}'),
(1571, 1964, '1060 FM 1441', '1060 FM 1441', 'description', ST_MakePoint(-97.245819, 30.168653), ST_AsGeoJSON(ST_MakePoint(-97.245819, 30.168653)), '{9012}'),
(1572, 1966, 'Chalet Dr @ Swiss Dr', 'Travis County, TX', 'description', ST_MakePoint(-97.611244, 30.132038), ST_AsGeoJSON(ST_MakePoint(-97.611244, 30.132038)), '{9010}'),
(1573, 1967, 'FM 713', 'FM 713 between Cattleman', 'description', ST_MakePoint(-97.574066, 29.856291), ST_AsGeoJSON(ST_MakePoint(-97.574066, 29.856291)), '{9011}'),
(1574, 1968, 'CR 310 @ Pin Oak', 'Lee County', 'description', ST_MakePoint(-97.138046, 30.379391), ST_AsGeoJSON(ST_MakePoint(-97.138046, 30.379391)), '{9013}'),
(1575, 1969, 'CR 143 @ Tributary to West Yegua Creek', 'Lee County', 'description', ST_MakePoint(-96.903221, 30.285662), ST_AsGeoJSON(ST_MakePoint(-96.903221, 30.285662)), '{9013}'),
(1576, 1970, 'Dry Willow at Old Austin Trail', 'Dry Willow at Old Austin Trail', 'description', ST_MakePoint(-97.447853, 30.240887), ST_AsGeoJSON(ST_MakePoint(-97.447853, 30.240887)), '{9012}'),
(1577, 1971, 'FM3158', 'BTWN Old Colony Line Road and Tinney Creek', 'description', ST_MakePoint(-97.559753, 29.809471), ST_AsGeoJSON(ST_MakePoint(-97.559753, 29.809471)), '{9011}'),
(1578, 1973, 'Pine Shadows Rd', '100-200', 'description', ST_MakePoint(-97.263367, 30.087967), ST_AsGeoJSON(ST_MakePoint(-97.263367, 30.087967)), '{9012}'),
(1579, 1974, 'Tienert Rd', 'Tienert Rd @ Rabbs Creek', 'description', ST_MakePoint(-96.893364, 30.069202), ST_AsGeoJSON(ST_MakePoint(-96.893364, 30.069202)), '{9018}'),
(1580, 1975, 'Race Track Road', 'Race Track Rd @ Cedar Creek', 'description', ST_MakePoint(-96.881798, 30.009747), ST_AsGeoJSON(ST_MakePoint(-96.881798, 30.009747)), '{9018}'),
(1581, 1976, 'Anchor Ranch Loop', 'Anchor Ranch Loop North', 'description', ST_MakePoint(-97.182938, 29.822645), ST_AsGeoJSON(ST_MakePoint(-97.182938, 29.822645)), '{9018}'),
(1582, 1977, 'Anchor Ranch Loop', 'Anchor Ranch Loop South', 'description', ST_MakePoint(-97.169052, 29.765533), ST_AsGeoJSON(ST_MakePoint(-97.169052, 29.765533)), '{9018}'),
(1583, 1978, 'Wallace Road', 'Wallace Rd', 'description', ST_MakePoint(-97.105148, 29.833212), ST_AsGeoJSON(ST_MakePoint(-97.105148, 29.833212)), '{9018}'),
(1584, 1979, 'Boehnke Rd', 'Boehnke Rd', 'description', ST_MakePoint(-97.082748, 29.860620), ST_AsGeoJSON(ST_MakePoint(-97.082748, 29.860620)), '{9018}'),
(1585, 1980, '160 Lakeside Drive ', '160 Lakeside Drive ', 'description', ST_MakePoint(-97.260963, 30.082396), ST_AsGeoJSON(ST_MakePoint(-97.260963, 30.082396)), '{9012}'),
(1586, 1981, 'Cattlemens between Shorthorn and Herford', 'Cattlemens between Shorthorn and Herford', 'description', ST_MakePoint(-97.232414, 30.163534), ST_AsGeoJSON(ST_MakePoint(-97.232414, 30.163534)), '{9012}'),
(1587, 1985, 'P1020 Aloha Ln', 'Aloha Ln', 'description', ST_MakePoint(-97.278473, 30.099625), ST_AsGeoJSON(ST_MakePoint(-97.278473, 30.099625)), '{9012}'),
(1588, 1986, 'P1021 Kahalulu Dr', 'Kahalulu Dr', 'description', ST_MakePoint(-97.276222, 30.079685), ST_AsGeoJSON(ST_MakePoint(-97.276222, 30.079685)), '{9012}'),
(1589, 1987, 'P1022 Upolu Ct', 'Upolu Ct', 'description', ST_MakePoint(-97.282806, 30.090881), ST_AsGeoJSON(ST_MakePoint(-97.282806, 30.090881)), '{9012}'),
(1590, 1988, 'P1023 Koae Ct', 'Koae Ct', 'description', ST_MakePoint(-97.292572, 30.083399), ST_AsGeoJSON(ST_MakePoint(-97.292572, 30.083399)), '{9012}'),
(1591, 1989, 'P1024 Alele Dr', 'Alele Dr', 'description', ST_MakePoint(-97.280731, 30.087898), ST_AsGeoJSON(ST_MakePoint(-97.280731, 30.087898)), '{9012}'),
(1592, 1991, 'P1026 - Pahalawe Ln', 'Pahalawe Ln', 'description', ST_MakePoint(-97.281349, 30.088188), ST_AsGeoJSON(ST_MakePoint(-97.281349, 30.088188)), '{9012}'),
(1593, 1992, 'P1026 East Keamuku Ct', 'East Keamuku Ct', 'description', ST_MakePoint(-97.284180, 30.092957), ST_AsGeoJSON(ST_MakePoint(-97.284180, 30.092957)), '{9012}'),
(1594, 1993, 'P1027 Honopu Dr', 'Honopu Dr', 'description', ST_MakePoint(-97.279228, 30.095243), ST_AsGeoJSON(ST_MakePoint(-97.279228, 30.095243)), '{9012}'),
(1595, 1994, 'Forest Ln', 'Forest Ln', 'description', ST_MakePoint(-97.257881, 30.093979), ST_AsGeoJSON(ST_MakePoint(-97.257881, 30.093979)), '{9012}'),
(1596, 1995, 'Pine Hill Loop', 'Pine Hill Loop', 'description', ST_MakePoint(-97.260101, 30.098480), ST_AsGeoJSON(ST_MakePoint(-97.260101, 30.098480)), '{9012}'),
(1597, 1996, 'Lisa Ln', 'Lisa Ln', 'description', ST_MakePoint(-97.252975, 30.144388), ST_AsGeoJSON(ST_MakePoint(-97.252975, 30.144388)), '{9012}'),
(1598, 1998, 'FM 1441 Betw Daisy Ln and Old Firetower TD', 'FM 1441 @ Spicer Creek', 'description', ST_MakePoint(-97.260147, 30.174446), ST_AsGeoJSON(ST_MakePoint(-97.260147, 30.174446)), '{9012}'),
(1599, 1999, 'Park Road 1C Near Wilderness Ridge', 'Park Road 1C Near Wilderness Ridge', 'description', ST_MakePoint(-97.211525, 30.094656), ST_AsGeoJSON(ST_MakePoint(-97.211525, 30.094656)), '{9012}'),
(1600, 2001, 'Riverside just East of Keanehalululu Ln', 'Riverside just East of Keanehalululu Ln', 'description', ST_MakePoint(-97.327705, 30.082581), ST_AsGeoJSON(ST_MakePoint(-97.327705, 30.082581)), '{9012}'),
(1601, 2002, 'Kaanapali at Tall Forest', 'Kaanapali at Tall Forest', 'description', ST_MakePoint(-97.270645, 30.086445), ST_AsGeoJSON(ST_MakePoint(-97.270645, 30.086445)), '{9012}'),
(1602, 2003, '300 Blk Sayers Rd', '300 Blk Sayers Rd', 'description', ST_MakePoint(-97.336166, 30.156507), ST_AsGeoJSON(ST_MakePoint(-97.336166, 30.156507)), '{9012}'),
(1603, 2004, '650 Sayers Road', '650 Sayers Road', 'description', ST_MakePoint(-97.348183, 30.168179), ST_AsGeoJSON(ST_MakePoint(-97.348183, 30.168179)), '{9012}'),
(1604, 2007, 'Goforth Rd @ Bebee Rd', 'Hays County ', 'description', ST_MakePoint(-97.827393, 30.005320), ST_AsGeoJSON(ST_MakePoint(-97.827393, 30.005320)), '{9016}'),
(1605, 2008, 'FM 1826 North of Kemp Hills Dr ', 'Hays County', 'description', ST_MakePoint(-97.941093, 30.168150), ST_AsGeoJSON(ST_MakePoint(-97.941093, 30.168150)), '{9016}'),
(1606, 2009, 'Riverside West of Kaala', 'Riverside West of Kaala', 'description', ST_MakePoint(-97.312096, 30.076395), ST_AsGeoJSON(ST_MakePoint(-97.312096, 30.076395)), '{9012}'),
(1607, 2011, 'CR 493 / CR 428', 'CR 493 / CR 428', 'description', ST_MakePoint(-97.267235, 30.706215), ST_AsGeoJSON(ST_MakePoint(-97.267235, 30.706215)), '{9017}'),
(1608, 2012, 'Pin Oak Branch Rd', 'Pin Oak Branch Rd @ Pin Oak Branch Creek', 'description', ST_MakePoint(-96.922478, 30.069672), ST_AsGeoJSON(ST_MakePoint(-96.922478, 30.069672)), '{9018}'),
(1609, 2013, 'Old Fentress (Clear Fork)', 'Old Fentress/SH130', 'description', ST_MakePoint(-97.708794, 29.857735), ST_AsGeoJSON(ST_MakePoint(-97.708794, 29.857735)), '{9011}'),
(1610, 2014, 'CR 243', 'CR 243', 'description', ST_MakePoint(-97.806656, 30.793819), ST_AsGeoJSON(ST_MakePoint(-97.806656, 30.793819)), '{9017}'),
(1611, 2016, 'N OLD BASTROP HWY @ BLIND SALAMANDER TRL', 'Hays County', 'description', ST_MakePoint(-97.897003, 29.857264), ST_AsGeoJSON(ST_MakePoint(-97.897003, 29.857264)), '{9016}'),
(1612, 2017, 'CR 318', 'CR 318', 'description', ST_MakePoint(-97.544739, 30.769127), ST_AsGeoJSON(ST_MakePoint(-97.544739, 30.769127)), '{9017}'),
(1613, 2018, 'CR 331', 'CR 331', 'description', ST_MakePoint(-97.548813, 30.749641), ST_AsGeoJSON(ST_MakePoint(-97.548813, 30.749641)), '{9017}'),
(1614, 2019, 'CR 348', 'CR 348', 'description', ST_MakePoint(-97.388809, 30.695335), ST_AsGeoJSON(ST_MakePoint(-97.388809, 30.695335)), '{9017}'),
(1615, 2020, 'CR 367', 'CR 367', 'description', ST_MakePoint(-97.445572, 30.597361), ST_AsGeoJSON(ST_MakePoint(-97.445572, 30.597361)), '{9017}'),
(1616, 2021, 'CR 347', 'CR 347', 'description', ST_MakePoint(-97.428665, 30.651731), ST_AsGeoJSON(ST_MakePoint(-97.428665, 30.651731)), '{9017}'),
(1617, 2022, 'CR 208', 'CR 208', 'description', ST_MakePoint(-97.055229, 30.815859), ST_AsGeoJSON(ST_MakePoint(-97.055229, 30.815859)), '{9017}'),
(1618, 2023, 'CR 258', 'CR 258', 'description', ST_MakePoint(-96.797569, 30.941959), ST_AsGeoJSON(ST_MakePoint(-96.797569, 30.941959)), '{9017}'),
(1619, 2024, 'CR 340', 'CR 340', 'description', ST_MakePoint(-96.843758, 30.687832), ST_AsGeoJSON(ST_MakePoint(-96.843758, 30.687832)), '{9017}'),
(1620, 2025, 'CR 333', 'CR 333', 'description', ST_MakePoint(-96.707848, 30.605671), ST_AsGeoJSON(ST_MakePoint(-96.707848, 30.605671)), '{9017}'),
(1621, 2026, 'CR 350', 'CR 350', 'description', ST_MakePoint(-96.734222, 30.787683), ST_AsGeoJSON(ST_MakePoint(-96.734222, 30.787683)), '{9017}'),
(1622, 2027, 'CR 351', 'CR 351', 'description', ST_MakePoint(-96.646523, 30.763140), ST_AsGeoJSON(ST_MakePoint(-96.646523, 30.763140)), '{9017}'),
(1623, 2028, '260 Block of Joe Cole Ln', '260 Block of Joe Cole Ln', 'description', ST_MakePoint(-97.145363, 29.964888), ST_AsGeoJSON(ST_MakePoint(-97.145363, 29.964888)), '{9012}'),
(1624, 2029, 'FM 2001 @ GRAEF RD', 'Hays County ', 'description', ST_MakePoint(-97.760010, 30.026011), ST_AsGeoJSON(ST_MakePoint(-97.760010, 30.026011)), '{9016}'),
(1625, 2030, 'FM 713/FM 3158', 'FM 713/FM 3158', 'description', ST_MakePoint(-97.519432, 29.852539), ST_AsGeoJSON(ST_MakePoint(-97.519432, 29.852539)), '{9011}'),
(1626, 2031, 'HWY 304/Oriole Loop', 'HWY 304/Oriole Loop', 'description', ST_MakePoint(-97.402443, 29.800175), ST_AsGeoJSON(ST_MakePoint(-97.402443, 29.800175)), '{9011}'),
(1627, 2033, 'FM 713/HWY 304', 'FM 713/HWY 304', 'description', ST_MakePoint(-97.395493, 29.827599), ST_AsGeoJSON(ST_MakePoint(-97.395493, 29.827599)), '{9011}'),
(1628, 2034, 'WINDY HILL RD @ MATHIAS LN', 'Hays County ', 'description', ST_MakePoint(-97.805237, 30.036617), ST_AsGeoJSON(ST_MakePoint(-97.805237, 30.036617)), '{9016}'),
(1629, 2035, 'FM 1826 @ Slaughter', 'Travis County, TX', 'description', ST_MakePoint(-97.894333, 30.218309), ST_AsGeoJSON(ST_MakePoint(-97.894333, 30.218309)), '{9010}'),
(1630, 2036, 'Payne Lane/FM 2720', 'Payne Lane/FM 2720', 'description', ST_MakePoint(-97.727036, 29.899137), ST_AsGeoJSON(ST_MakePoint(-97.727036, 29.899137)), '{9011}'),
(1631, 2037, '21200-blk Windmill Ranch Ave @ Steeds Xing', 'Travis County, TX', 'description', ST_MakePoint(-97.571884, 30.490625), ST_AsGeoJSON(ST_MakePoint(-97.571884, 30.490625)), '{9010}'),
(1632, 2038, 'Chalk Road/Sandy Fork', 'Chalk Road/Sandy Fork', 'description', ST_MakePoint(-97.422211, 29.761007), ST_AsGeoJSON(ST_MakePoint(-97.422211, 29.761007)), '{9011}'),
(1633, 2039, 'William Pettus Rd', 'William Pettus/FM 1984', 'description', ST_MakePoint(-97.836472, 29.889111), ST_AsGeoJSON(ST_MakePoint(-97.836472, 29.889111)), '{9011}'),
(1634, 2040, 'William Pettus', 'William Pettus/HWY 20', 'description', ST_MakePoint(-97.857544, 29.910315), ST_AsGeoJSON(ST_MakePoint(-97.857544, 29.910315)), '{9011}'),
(1635, 2043, 'Star Road', 'Caldwell County', 'description', ST_MakePoint(-97.600380, 29.864157), ST_AsGeoJSON(ST_MakePoint(-97.600380, 29.864157)), '{9011}'),
(1636, 2045, 'Tenney Creek Road', 'Between Clear Creek Rd and Creekside Drive', 'description', ST_MakePoint(-97.561928, 29.800514), ST_AsGeoJSON(ST_MakePoint(-97.561928, 29.800514)), '{9011}'),
(1637, 2046, 'Sparrow Trail', 'Caldwell County', 'description', ST_MakePoint(-97.561707, 29.795643), ST_AsGeoJSON(ST_MakePoint(-97.561707, 29.795643)), '{9011}'),
(1638, 2047, '17300-blk Carlson Ln', 'Travis County, TX', 'description', ST_MakePoint(-97.419281, 30.383812), ST_AsGeoJSON(ST_MakePoint(-97.419281, 30.383812)), '{9010}'),
(1639, 2051, '7600blk Colton-Bluff Springs Rd', 'Travis County, TX', 'description', ST_MakePoint(-97.720787, 30.155169), ST_AsGeoJSON(ST_MakePoint(-97.720787, 30.155169)), '{9010}'),
(1640, 2052, 'FM 150 E @ DRUE DR', 'Hays County', 'description', ST_MakePoint(-97.837845, 29.953373), ST_AsGeoJSON(ST_MakePoint(-97.837845, 29.953373)), '{9016}'),
(1641, 2054, 'Bell Springs Rd @ Russell Ln ', 'Hays County', 'description', ST_MakePoint(-98.118690, 30.208138), ST_AsGeoJSON(ST_MakePoint(-98.118690, 30.208138)), '{9016}'),
(1642, 2056, '3800 BLK DACY LN', 'Kyle PD', 'description', ST_MakePoint(-97.830933, 30.024515), ST_AsGeoJSON(ST_MakePoint(-97.830933, 30.024515)), '{9016}'),
(1643, 2058, 'Colton Bluff Springs Rd at S-curves', 'Travis County, TX ', 'description', ST_MakePoint(-97.713470, 30.152683), ST_AsGeoJSON(ST_MakePoint(-97.713470, 30.152683)), '{9010}'),
(1644, 2059, 'Yaupon Dr/Spicewood Springs Rd', 'Travis County, TX ', 'description', ST_MakePoint(-97.778900, 30.397100), ST_AsGeoJSON(ST_MakePoint(-97.778900, 30.397100)), '{9010}'),
(1645, 2060, 'Bee Creek Rd @ Ridgepole ', 'Travis County, TX ', 'description', ST_MakePoint(-98.040520, 30.356960), ST_AsGeoJSON(ST_MakePoint(-98.040520, 30.356960)), '{9010}'),
(1646, 2061, 'Briarcliff Dr @ Cargill Dr ', 'Travis County, TX ', 'description', ST_MakePoint(-98.054512, 30.404793), ST_AsGeoJSON(ST_MakePoint(-98.054512, 30.404793)), '{9010}'),
(1647, 2062, '11500-blk W Sh 71', 'Travis County, TX ', 'description', ST_MakePoint(-97.921837, 30.293596), ST_AsGeoJSON(ST_MakePoint(-97.921837, 30.293596)), '{9010}'),
(1648, 2063, 'RR 150 W @ ONION CREEK', 'Hays County', 'description', ST_MakePoint(-98.048790, 30.143570), ST_AsGeoJSON(ST_MakePoint(-98.048790, 30.143570)), '{9016}'),
(1649, 2064, '200 Blk Jacobson Rd', '200 Blk Jacobson Rd ', 'description', ST_MakePoint(-97.584259, 30.111088), ST_AsGeoJSON(ST_MakePoint(-97.584259, 30.111088)), '{9012}'),
(1650, 2067, '11500-blk FM 1826', 'Travis County, TX', 'description', ST_MakePoint(-97.922485, 30.196056), ST_AsGeoJSON(ST_MakePoint(-97.922485, 30.196056)), '{9010}'),
(1651, 2068, '3400-blk Fritz Hughes Park Rd', 'Travis County, TX ', 'description', ST_MakePoint(-97.912163, 30.382471), ST_AsGeoJSON(ST_MakePoint(-97.912163, 30.382471)), '{9010}'),
(1652, 2069, '12300-BLK HEWITT LN', 'Travis County, TX ', 'description', ST_MakePoint(-97.846893, 30.143377), ST_AsGeoJSON(ST_MakePoint(-97.846893, 30.143377)), '{9010}'),
(1653, 2071, '4700-BLK WOLF LN', 'Travis County, TX ', 'description', ST_MakePoint(-97.541977, 30.181479), ST_AsGeoJSON(ST_MakePoint(-97.541977, 30.181479)), '{9010}'),
(1654, 2072, '15600-BLK FM 969 RD', 'Travis County, TX ', 'description', ST_MakePoint(-97.571014, 30.249035), ST_AsGeoJSON(ST_MakePoint(-97.571014, 30.249035)), '{9010}'),
(1655, 2073, '9700-BLK FM 969 RD', 'Travis County, TX ', 'description', ST_MakePoint(-97.625854, 30.267378), ST_AsGeoJSON(ST_MakePoint(-97.625854, 30.267378)), '{9010}'),
(1656, 2076, '13340-blk Old Kimbro', 'Travis County, TX ', 'description', ST_MakePoint(-97.498825, 30.353769), ST_AsGeoJSON(ST_MakePoint(-97.498825, 30.353769)), '{9010}'),
(1657, 2078, 'CR 114 @ West Yegua Creek', 'Lee County', 'description', ST_MakePoint(-96.906265, 30.292053), ST_AsGeoJSON(ST_MakePoint(-96.906265, 30.292053)), '{9013}'),
(1658, 2079, 'CR 117 @ Middle Yegua Creek', 'Lee County', 'description', ST_MakePoint(-96.858047, 30.326771), ST_AsGeoJSON(ST_MakePoint(-96.858047, 30.326771)), '{9013}'),
(1659, 2080, 'Flite Acres Rd @ Spoke Ln', 'Flite Acres Rd @ Spoke Ln', 'description', ST_MakePoint(-98.076477, 29.986467), ST_AsGeoJSON(ST_MakePoint(-98.076477, 29.986467)), '{9016}'),
(1660, 2081, '290 @ County Line Rd', '290 @ County Line Rd', 'description', ST_MakePoint(-97.411942, 30.352276), ST_AsGeoJSON(ST_MakePoint(-97.411942, 30.352276)), '{9012}'),
(1661, 2082, 'East Austin @ RR Tracks', 'East Austin @ RR Tracks', 'description', ST_MakePoint(-97.368919, 30.346672), ST_AsGeoJSON(ST_MakePoint(-97.368919, 30.346672)), '{9012}'),
(1662, 2083, 'River Rd @ Leveritts Loop ', 'Hays County ', 'description', ST_MakePoint(-98.104233, 29.991392), ST_AsGeoJSON(ST_MakePoint(-98.104233, 29.991392)), '{9016}'),
(1663, 2084, 'Borchert Drive near SH130', 'Lockhart', 'description', ST_MakePoint(-97.711166, 29.879524), ST_AsGeoJSON(ST_MakePoint(-97.711166, 29.879524)), '{9011}'),
(1664, 2085, 'Clearfork St (SH130)', 'Lockhart', 'description', ST_MakePoint(-97.699493, 29.867617), ST_AsGeoJSON(ST_MakePoint(-97.699493, 29.867617)), '{9011}'),
(1665, 2086, 'Sandy Pine Road', 'Between Turkey Hollow & Ivy Switch', 'description', ST_MakePoint(-97.567635, 29.666265), ST_AsGeoJSON(ST_MakePoint(-97.567635, 29.666265)), '{9011}'),
(1666, 2091, 'Mathias ln @ Running Bull LN ', 'Hays County ', 'description', ST_MakePoint(-97.791176, 30.010584), ST_AsGeoJSON(ST_MakePoint(-97.791176, 30.010584)), '{9016}'),
(1667, 2093, 'William Pettus/Low water', 'william pettus/william pettus ct', 'description', ST_MakePoint(-97.843056, 29.895781), ST_AsGeoJSON(ST_MakePoint(-97.843056, 29.895781)), '{9016}'),
(1668, 2096, 'Old Bastrop Hwy Bridge ', 'San Marcos River Crossing', 'description', ST_MakePoint(-97.897598, 29.857563), ST_AsGeoJSON(ST_MakePoint(-97.897598, 29.857563)), '{9011}'),
(1669, 2097, 'Main St @ Campo Del Sol Parkway ', 'City of Buda ', 'description', ST_MakePoint(-97.806145, 30.088556), ST_AsGeoJSON(ST_MakePoint(-97.806145, 30.088556)), '{9016}'),
(1670, 2098, 'TX1032 - Park Rd 1C @ Harmon Rd', '300 Blk Park Rd 1C', 'description', ST_MakePoint(-97.249626, 30.109261), ST_AsGeoJSON(ST_MakePoint(-97.249626, 30.109261)), '{9012}'),
(1671, 2099, 'TX1033 Park Rd 1A @ Park Rd 1C', '100 Blk Park Rd 1A', 'description', ST_MakePoint(-97.267860, 30.112900), ST_AsGeoJSON(ST_MakePoint(-97.267860, 30.112900)), '{9012}'),
(1672, 2101, 'TX1034 Park Rd 1C @ Park Rd 1E', '2100 Blk Park Rd 1C', 'description', ST_MakePoint(-97.162743, 30.049189), ST_AsGeoJSON(ST_MakePoint(-97.162743, 30.049189)), '{9012}'),
(1673, 2102, 'TX1035 Park Rd 1A @ refectory', '100 Blk Park Rd 1A', 'description', ST_MakePoint(-97.283119, 30.109131), ST_AsGeoJSON(ST_MakePoint(-97.283119, 30.109131)), '{9012}'),
(1674, 2103, 'Clear Creek at Roznov Rd', 'Clear Creek at Roznov Rd', 'description', ST_MakePoint(-96.741402, 29.967999), ST_AsGeoJSON(ST_MakePoint(-96.741402, 29.967999)), '{9018}'),
(1675, 2104, 'P3070 - Old San Antonio Rd @ Tributary in the 600 Blk', '600 Blk Old San Antonio Rd', 'description', ST_MakePoint(-97.584282, 30.027033), ST_AsGeoJSON(ST_MakePoint(-97.584282, 30.027033)), '{9012}'),
(1676, 2106, 'Eanes Creek @ Camp Craft', 'Travis County, TX ', 'description', ST_MakePoint(-97.811928, 30.280056), ST_AsGeoJSON(ST_MakePoint(-97.811928, 30.280056)), '{9010}'),
(1677, 2107, 'P2063 - Mark Young Rd @ Tributary', '100 Blk', 'description', ST_MakePoint(-97.159309, 29.959169), ST_AsGeoJSON(ST_MakePoint(-97.159309, 29.959169)), '{9012}'),
(1678, 2108, 'P2064 - Mark Young Rd @ Tributary', '200 Blk', 'description', ST_MakePoint(-97.159142, 29.952700), ST_AsGeoJSON(ST_MakePoint(-97.159142, 29.952700)), '{9012}'),
(1679, 2109, 'P2065 - Mark Young Rd', '300 Blk', 'description', ST_MakePoint(-97.159027, 29.948175), ST_AsGeoJSON(ST_MakePoint(-97.159027, 29.948175)), '{9012}'),
(1680, 2110, 'P3071 - 3800 FM 535', '3800 Blk', 'description', ST_MakePoint(-97.422379, 29.984707), ST_AsGeoJSON(ST_MakePoint(-97.422379, 29.984707)), '{9012}'),
(1681, 2111, 'Krischke Rd, Fayette County', 'Krischke Rd North of Gansky Rd', 'description', ST_MakePoint(-96.952065, 29.728769), ST_AsGeoJSON(ST_MakePoint(-96.952065, 29.728769)), '{9018}'),
(1682, 2112, 'Krischke Rd, Fayette County', 'Krischke Rd South of Gansky Rd', 'description', ST_MakePoint(-96.951340, 29.723021), ST_AsGeoJSON(ST_MakePoint(-96.951340, 29.723021)), '{9018}'),
(1683, 2113, 'COS1006 - SE Martin Luther King Dr', '1000 Blk', 'description', ST_MakePoint(-97.152786, 30.000147), ST_AsGeoJSON(ST_MakePoint(-97.152786, 30.000147)), '{9012}'),
(1684, 2114, 'P2068 - Crafts Prairie Rd @ Mesa Pinto Dr', '250 Blk', 'description', ST_MakePoint(-97.250786, 30.052687), ST_AsGeoJSON(ST_MakePoint(-97.250786, 30.052687)), '{9012}'),
(1685, 2115, 'P3072 - 300 FM 672', '300 Blk', 'description', ST_MakePoint(-97.527908, 29.989796), ST_AsGeoJSON(ST_MakePoint(-97.527908, 29.989796)), '{9012}'),
(1686, 2116, 'P3073 - 500 FM 672', '500 Blk', 'description', ST_MakePoint(-97.539192, 29.976933), ST_AsGeoJSON(ST_MakePoint(-97.539192, 29.976933)), '{9012}'),
(1687, 2117, 'Seawillow/FM1322', 'Seawillow/FM 1322', 'description', ST_MakePoint(-97.658287, 29.856279), ST_AsGeoJSON(ST_MakePoint(-97.658287, 29.856279)), '{9011}'),
(1688, 2118, 'Highland Ranch/Seminole', 'Highland Ranch/Seminole', 'description', ST_MakePoint(-97.603363, 29.982824), ST_AsGeoJSON(ST_MakePoint(-97.603363, 29.982824)), '{9011}'),
(1689, 2119, 'FM 1854/Highland Ranch Way', 'FM 1854/Highland Ranch Way', 'description', ST_MakePoint(-97.594673, 29.988958), ST_AsGeoJSON(ST_MakePoint(-97.594673, 29.988958)), '{9011}'),
(1690, 2120, 'Read St (between Moore & Academy)', 'Read St (between Moore & Academy)', 'description', ST_MakePoint(-97.951332, 29.888699), ST_AsGeoJSON(ST_MakePoint(-97.951332, 29.888699)), '{9016}'),
(1691, 2121, 'Barth Rd/FM 672', 'Barth Rd/FM 672', 'description', ST_MakePoint(-97.595444, 29.927589), ST_AsGeoJSON(ST_MakePoint(-97.595444, 29.927589)), '{9011}'),
(1692, 2122, '3810 Barth Rd', '3810 Barth Rd', 'description', ST_MakePoint(-97.623451, 29.951242), ST_AsGeoJSON(ST_MakePoint(-97.623451, 29.951242)), '{9011}'),
(1693, 2123, '4623 Barth Rd', '4623 Barth Rd', 'description', ST_MakePoint(-97.632721, 29.959068), ST_AsGeoJSON(ST_MakePoint(-97.632721, 29.959068)), '{9011}'),
(1694, 2124, '2920 Barth Rd', '2920 Barth Rd', 'description', ST_MakePoint(-97.612572, 29.942057), ST_AsGeoJSON(ST_MakePoint(-97.612572, 29.942057)), '{9011}'),
(1695, 2125, 'Birch St/Pecos St', 'Birch St/Pecos St', 'description', ST_MakePoint(-97.679192, 29.891497), ST_AsGeoJSON(ST_MakePoint(-97.679192, 29.891497)), '{9011}'),
(1696, 2126, 'Crooked Rd/FM 1854', 'Crooked Rd/FM 1854', 'description', ST_MakePoint(-97.605148, 29.997915), ST_AsGeoJSON(ST_MakePoint(-97.605148, 29.997915)), '{9011}'),
(1697, 2127, 'Birch St/FM 1984', 'Birch St/FM 1984', 'description', ST_MakePoint(-97.847015, 29.879375), ST_AsGeoJSON(ST_MakePoint(-97.847015, 29.879375)), '{9011}'),
(1698, 2128, 'Birch St/Mill Rd', 'Birch St/Mill Rd', 'description', ST_MakePoint(-97.849808, 29.879452), ST_AsGeoJSON(ST_MakePoint(-97.849808, 29.879452)), '{9011}'),
(1699, 2129, 'Main St @ Mesquite St, Fayette County', 'E North Main St @ S Mesquite St', 'description', ST_MakePoint(-97.100632, 29.687887), ST_AsGeoJSON(ST_MakePoint(-97.100632, 29.687887)), '{9018}'),
(1700, 2130, 'Carter Road', 'Carter Road @ St Johns Road ', 'description', ST_MakePoint(-97.559654, 29.972546), ST_AsGeoJSON(ST_MakePoint(-97.559654, 29.972546)), '{9011}'),
(1701, 2131, 'P4045 - 2500 FM 1704 south of Woody Ln', '2500 Blk', 'description', ST_MakePoint(-97.422241, 30.247625), ST_AsGeoJSON(ST_MakePoint(-97.422241, 30.247625)), '{9012}'),
(1702, 2132, 'Political Rd/HWY 80', 'Political Rd/HWY 80', 'description', ST_MakePoint(-97.781769, 29.770611), ST_AsGeoJSON(ST_MakePoint(-97.781769, 29.770611)), '{9011}'),
(1703, 2133, 'St Johns Road', '1000 Block St Johns Road', 'description', ST_MakePoint(-97.566338, 29.975542), ST_AsGeoJSON(ST_MakePoint(-97.566338, 29.975542)), '{9011}'),
(1704, 2134, 'Holz Rd - Dead End Section', 'Holz Rd', 'description', ST_MakePoint(-97.726990, 29.965618), ST_AsGeoJSON(ST_MakePoint(-97.726990, 29.965618)), '{9011}'),
(1705, 2135, 'Sandholler Road ', 'Sandholler Road at Sandy Creek Road', 'description', ST_MakePoint(-97.527969, 29.941694), ST_AsGeoJSON(ST_MakePoint(-97.527969, 29.941694)), '{9011}'),
(1706, 2136, 'Homann Road', 'Homann Road at Homannville Trail', 'description', ST_MakePoint(-97.665466, 29.986946), ST_AsGeoJSON(ST_MakePoint(-97.665466, 29.986946)), '{9011}'),
(1707, 2137, 'Homann Road', 'Homann Road at FM 1854', 'description', ST_MakePoint(-97.643227, 30.007574), ST_AsGeoJSON(ST_MakePoint(-97.643227, 30.007574)), '{9011}'),
(1708, 2138, '800 Blk Chamberlin Rd', '800 Chamberlin Rd', 'description', ST_MakePoint(-97.545647, 29.962690), ST_AsGeoJSON(ST_MakePoint(-97.545647, 29.962690)), '{9011}'),
(1709, 2139, 'Fox Lane', 'Fox Lane off of FM 713', 'description', ST_MakePoint(-97.571159, 29.855801), ST_AsGeoJSON(ST_MakePoint(-97.571159, 29.855801)), '{9011}'),
(1710, 2140, 'Long Rd/Spoke Hollow Rd', 'Long Rd/Spoke Hollow Rd', 'description', ST_MakePoint(-97.749535, 29.822056), ST_AsGeoJSON(ST_MakePoint(-97.749535, 29.822056)), '{9011}'),
(1711, 2141, 'Long Rd/Black Ankle', 'Long Rd/Black Ankle', 'description', ST_MakePoint(-97.731094, 29.835110), ST_AsGeoJSON(ST_MakePoint(-97.731094, 29.835110)), '{9011}'),
(1712, 2142, 'Lake Road/Fox Lane', 'Lake Road/Fox Lane', 'description', ST_MakePoint(-97.567726, 29.830133), ST_AsGeoJSON(ST_MakePoint(-97.567726, 29.830133)), '{9011}'),
(1713, 2143, 'Plant Road at Bugtussle', '100 blk Plant Rd', 'description', ST_MakePoint(-97.707298, 29.748299), ST_AsGeoJSON(ST_MakePoint(-97.707298, 29.748299)), '{9011}'),
(1714, 2144, 'P2069 - Powell Rd @ Tribuary West of Kellar Rd', '130 Blk', 'description', ST_MakePoint(-97.191025, 30.060041), ST_AsGeoJSON(ST_MakePoint(-97.191025, 30.060041)), '{9012}'),
(1715, 2145, 'FM 2001 at Countyview', '1000 Countyview Rd', 'description', ST_MakePoint(-97.725494, 29.910358), ST_AsGeoJSON(ST_MakePoint(-97.725494, 29.910358)), '{9011}'),
(1716, 2146, 'Wells Rd - All of Roadway', 'Wells Rd', 'description', ST_MakePoint(-97.567871, 29.833914), ST_AsGeoJSON(ST_MakePoint(-97.567871, 29.833914)), '{9011}'),
(1717, 2147, 'Taylorsville Rd at Turnback Trl', '100 Turnback Trl', 'description', ST_MakePoint(-97.524178, 29.908163), ST_AsGeoJSON(ST_MakePoint(-97.524178, 29.908163)), '{9011}'),
(1718, 2148, 'Wells Rd @ YOUNG LANE', 'Wells Rd/Young Ln', 'description', ST_MakePoint(-97.576370, 29.823265), ST_AsGeoJSON(ST_MakePoint(-97.576370, 29.823265)), '{9011}'),
(1719, 2149, '2300 Westwood Rd', '2300 Westwood Rd', 'description', ST_MakePoint(-97.711815, 29.839497), ST_AsGeoJSON(ST_MakePoint(-97.711815, 29.839497)), '{9011}'),
(1720, 2150, '1300 Westwood Rd', '1300 Westwood Rd', 'description', ST_MakePoint(-97.709343, 29.835905), ST_AsGeoJSON(ST_MakePoint(-97.709343, 29.835905)), '{9011}'),
(1721, 2151, 'P2074 - Big Bow (spillway) @ Indian Lake', '300 Blk', 'description', ST_MakePoint(-97.086548, 30.044922), ST_AsGeoJSON(ST_MakePoint(-97.086548, 30.044922)), '{9012}'),
(1722, 2152, 'P2075 - Circle Rd @ Pin Oak Creek', '200 Blk', 'description', ST_MakePoint(-97.082230, 30.071442), ST_AsGeoJSON(ST_MakePoint(-97.082230, 30.071442)), '{9012}'),
(1723, 2153, 'Old Colony Line Rd/Tumbleweed Trail', 'Old Colony Line Rd/Tumbleweed Trail', 'description', ST_MakePoint(-97.576111, 29.910875), ST_AsGeoJSON(ST_MakePoint(-97.576111, 29.910875)), '{9011}'),
(1724, 2154, 'Black Ankle/Borchert Loop', 'Black Ankle/Borchert Loop', 'description', ST_MakePoint(-97.737404, 29.866226), ST_AsGeoJSON(ST_MakePoint(-97.737404, 29.866226)), '{9011}'),
(1725, 2155, 'Black Ankle/Dickerson', 'Black Ankle/Dickerson', 'description', ST_MakePoint(-97.748184, 29.852432), ST_AsGeoJSON(ST_MakePoint(-97.748184, 29.852432)), '{9011}'),
(1726, 2156, 'Stockade Ranch Rd', 'SH 21 to End of Road', 'description', ST_MakePoint(-97.114967, 30.217712), ST_AsGeoJSON(ST_MakePoint(-97.114967, 30.217712)), '{9012}'),
(1727, 2157, 'Sandy Fork Rd/FM 304', 'Sandy Fork Rd/FM 304', 'description', ST_MakePoint(-97.409401, 29.759251), ST_AsGeoJSON(ST_MakePoint(-97.409401, 29.759251)), '{9011}'),
(1728, 2158, 'Bugtussle at 671', '100 Bugtussle', 'description', ST_MakePoint(-97.705688, 29.747042), ST_AsGeoJSON(ST_MakePoint(-97.705688, 29.747042)), '{9011}'),
(1729, 2159, 'Bugtussle at Acorn Rd', 'Bugtussle Rd', 'description', ST_MakePoint(-97.721375, 29.775755), ST_AsGeoJSON(ST_MakePoint(-97.721375, 29.775755)), '{9011}'),
(1730, 2160, 'Sandy Fork Rd/Sandy Ranch Rd', 'Sandy Fork Rd/Sandy Ranch Rd', 'description', ST_MakePoint(-97.454163, 29.788380), ST_AsGeoJSON(ST_MakePoint(-97.454163, 29.788380)), '{9011}'),
(1731, 2161, 'Lehman Ln', 'South of Humble Ln', 'description', ST_MakePoint(-97.415581, 30.012465), ST_AsGeoJSON(ST_MakePoint(-97.415581, 30.012465)), '{9012}'),
(1732, 2162, 'Lower Red Rock Rd', 'South of Humble Ln', 'description', ST_MakePoint(-97.406937, 30.007839), ST_AsGeoJSON(ST_MakePoint(-97.406937, 30.007839)), '{9012}'),
(1733, 2163, '200blk of creek rd', '200blk of creek rd', 'description', ST_MakePoint(-98.094276, 30.190479), ST_AsGeoJSON(ST_MakePoint(-98.094276, 30.190479)), '{9016}'),
(1734, 2164, '200 S Lampasas', 'Travis County, TX ', 'description', ST_MakePoint(-97.552498, 30.340311), ST_AsGeoJSON(ST_MakePoint(-97.552498, 30.340311)), '{9010}'),
(1735, 2165, 'Alex Ln, Fayette County', 'Alex Ln near Texas 71 Frontage Rd', 'description', ST_MakePoint(-96.888374, 29.918310), ST_AsGeoJSON(ST_MakePoint(-96.888374, 29.918310)), '{9018}'),
(1736, 2166, '16000-blk Wells School', 'Travis County, TX ', 'description', ST_MakePoint(-97.441307, 30.386951), ST_AsGeoJSON(ST_MakePoint(-97.441307, 30.386951)), '{9010}'),
(1737, 2168, 'Post Oak Trl', 'Entire Road Closed', 'description', ST_MakePoint(-97.550423, 30.104044), ST_AsGeoJSON(ST_MakePoint(-97.550423, 30.104044)), '{9012}'),
(1738, 2169, 'Turkey Ridge Rd', 'Entire Road ', 'description', ST_MakePoint(-97.537231, 30.015539), ST_AsGeoJSON(ST_MakePoint(-97.537231, 30.015539)), '{9012}'),
(1739, 2170, 'FM 812', 'At Camino Del Sol', 'description', ST_MakePoint(-97.597824, 30.093203), ST_AsGeoJSON(ST_MakePoint(-97.597824, 30.093203)), '{9012}'),
(1740, 2171, 'RR 12 at Fulton Ranch Rd', 'RR 12 at Fulton Ranch Rd', 'description', ST_MakePoint(-98.009010, 29.908871), ST_AsGeoJSON(ST_MakePoint(-98.009010, 29.908871)), '{9016}'),
(1741, 2172, 'Ponderosa Rd', 'Entire Road', 'description', ST_MakePoint(-97.231033, 30.070633), ST_AsGeoJSON(ST_MakePoint(-97.231033, 30.070633)), '{9012}'),
(1742, 2173, 'Brody Ln', 'Entire Road', 'description', ST_MakePoint(-97.237640, 30.047083), ST_AsGeoJSON(ST_MakePoint(-97.237640, 30.047083)), '{9012}'),
(1743, 2174, 'Arbuckle Rd', 'Arbuckle Rd', 'description', ST_MakePoint(-97.379517, 30.286285), ST_AsGeoJSON(ST_MakePoint(-97.379517, 30.286285)), '{9012}'),
(1744, 2175, 'Whitehead St', 'And NE 2nd St', 'description', ST_MakePoint(-97.148468, 30.002733), ST_AsGeoJSON(ST_MakePoint(-97.148468, 30.002733)), '{9012}'),
(1745, 2176, 'FM 1291 @ Ledbetter, Fayette County', 'FM 1291 @ Ledbetter', 'description', ST_MakePoint(-96.792427, 30.146120), ST_AsGeoJSON(ST_MakePoint(-96.792427, 30.146120)), '{9018}'),
(1746, 2177, 'FM 1291 @ Greens Creek Rd, Fayette County', 'FM 1291 @ Greens Creek Rd', 'description', ST_MakePoint(-96.799583, 30.078794), ST_AsGeoJSON(ST_MakePoint(-96.799583, 30.078794)), '{9018}'),
(1747, 2178, 'NE 1st St @ Marburger St', 'NE 1st St, Smithville, TX', 'description', ST_MakePoint(-97.147995, 30.001461), ST_AsGeoJSON(ST_MakePoint(-97.147995, 30.001461)), '{9012}'),
(1748, 2179, 'NE 6th St', 'Between Wilkes St and Whitehead St', 'description', ST_MakePoint(-97.147057, 30.006235), ST_AsGeoJSON(ST_MakePoint(-97.147057, 30.006235)), '{9012}'),
(1749, 2180, 'Faulkner Rd', 'At Oak Meadows Dr', 'description', ST_MakePoint(-97.139160, 30.001434), ST_AsGeoJSON(ST_MakePoint(-97.139160, 30.001434)), '{9012}'),
(1750, 2181, 'SH 71 @ St James Church Rd, Fayette County', 'SH 71 @ St James Church Rd', 'description', ST_MakePoint(-96.990501, 29.936951), ST_AsGeoJSON(ST_MakePoint(-96.990501, 29.936951)), '{9018}'),
(1751, 2182, 'St Hwy 71', 'East bound lane', 'description', ST_MakePoint(-97.432930, 30.122240), ST_AsGeoJSON(ST_MakePoint(-97.432930, 30.122240)), '{9012}'),
(1752, 2183, 'W Old Lockhart Rd @ Makinson Rd, Fayette County', 'W Old Lockhart Rd @ Makinson Rd', 'description', ST_MakePoint(-97.054359, 29.901875), ST_AsGeoJSON(ST_MakePoint(-97.054359, 29.901875)), '{9018}'),
(1753, 2184, 'Sand Hiils Rd', '300 blk', 'description', ST_MakePoint(-97.433235, 29.951818), ST_AsGeoJSON(ST_MakePoint(-97.433235, 29.951818)), '{9012}'),
(1754, 2185, 'Red Rock Ranch Rd', '300 blk', 'description', ST_MakePoint(-97.406647, 29.917456), ST_AsGeoJSON(ST_MakePoint(-97.406647, 29.917456)), '{9012}'),
(1755, 2186, '5400-blk Williamson Rd', 'Travis County, TX', 'description', ST_MakePoint(-97.746819, 30.058571), ST_AsGeoJSON(ST_MakePoint(-97.746819, 30.058571)), '{9010}'),
(1756, 2187, 'NE 8th St', 'at Mills St', 'description', ST_MakePoint(-97.151398, 30.010195), ST_AsGeoJSON(ST_MakePoint(-97.151398, 30.010195)), '{9012}'),
(1757, 2188, 'FM 2104', '369 FM 2104', 'description', ST_MakePoint(-97.101898, 30.061934), ST_AsGeoJSON(ST_MakePoint(-97.101898, 30.061934)), '{9012}'),
(1758, 2189, 'Bateman Rd', 'Entire Road', 'description', ST_MakePoint(-97.458839, 29.934719), ST_AsGeoJSON(ST_MakePoint(-97.458839, 29.934719)), '{9012}'),
(1759, 2190, '10450 State Park Rd', '10450 State Park Rd', 'description', ST_MakePoint(-97.736984, 29.785631), ST_AsGeoJSON(ST_MakePoint(-97.736984, 29.785631)), '{9011}'),
(1760, 2191, 'Jacobson Rd', 'Maha Creek', 'description', ST_MakePoint(-97.598267, 30.123293), ST_AsGeoJSON(ST_MakePoint(-97.598267, 30.123293)), '{9012}'),
(1761, 2192, 'Cardinal Dr', '627 Cardinal Dr', 'description', ST_MakePoint(-97.208893, 30.187729), ST_AsGeoJSON(ST_MakePoint(-97.208893, 30.187729)), '{9012}'),
(1762, 2193, 'Pine St', 'St Hwy 95 to MLK', 'description', ST_MakePoint(-97.309715, 30.109520), ST_AsGeoJSON(ST_MakePoint(-97.309715, 30.109520)), '{9012}'),
(1763, 2194, 'Eiler @ Maha Loop Rd', 'Travis County, TX', 'description', ST_MakePoint(-97.655663, 30.091406), ST_AsGeoJSON(ST_MakePoint(-97.655663, 30.091406)), '{9010}'),
(1764, 2195, 'Hill St aka Dorothy Nichols Ln', 'at NE Loop 230', 'description', ST_MakePoint(-97.134712, 29.997864), ST_AsGeoJSON(ST_MakePoint(-97.134712, 29.997864)), '{9012}'),
(1765, 2196, 'Lamaloa Ln', 'West of Rail Road', 'description', ST_MakePoint(-97.318756, 30.090956), ST_AsGeoJSON(ST_MakePoint(-97.318756, 30.090956)), '{9012}'),
(1766, 2197, 'Cleveland St', 'Between 1st St and 2nd St', 'description', ST_MakePoint(-97.162231, 30.008085), ST_AsGeoJSON(ST_MakePoint(-97.162231, 30.008085)), '{9012}'),
(1767, 2198, 'NW 1st St', 'at Gazley St', 'description', ST_MakePoint(-97.164680, 30.008680), ST_AsGeoJSON(ST_MakePoint(-97.164680, 30.008680)), '{9012}'),
(1768, 2199, 'FM 969', '1704 FM 969', 'description', ST_MakePoint(-97.434471, 30.200489), ST_AsGeoJSON(ST_MakePoint(-97.434471, 30.200489)), '{9012}'),
(1769, 2200, 'St Hwy 21', 'West bound lanes', 'description', ST_MakePoint(-97.170166, 30.182495), ST_AsGeoJSON(ST_MakePoint(-97.170166, 30.182495)), '{9012}'),
(1770, 2201, 'FM 1704', '2709 FM 1704', 'description', ST_MakePoint(-97.428207, 30.238482), ST_AsGeoJSON(ST_MakePoint(-97.428207, 30.238482)), '{9012}'),
(1771, 2202, 'S St Hwy 95', 'Northbound Lane', 'description', ST_MakePoint(-97.357910, 30.321922), ST_AsGeoJSON(ST_MakePoint(-97.357910, 30.321922)), '{9012}'),
(1772, 2203, 'FM 535', '2400 FM 535', 'description', ST_MakePoint(-97.321266, 29.938860), ST_AsGeoJSON(ST_MakePoint(-97.321266, 29.938860)), '{9012}'),
(1773, 2204, 'Shiloh Rd', 'Between St Hwy 304 and FM 20', 'description', ST_MakePoint(-97.367714, 30.092615), ST_AsGeoJSON(ST_MakePoint(-97.367714, 30.092615)), '{9012}'),
(1774, 2205, 'Lone Star Rd', '600 Blk', 'description', ST_MakePoint(-97.379707, 30.045609), ST_AsGeoJSON(ST_MakePoint(-97.379707, 30.045609)), '{9012}'),
(1775, 2206, 'McAllister Rd', '339', 'description', ST_MakePoint(-97.262566, 30.076195), ST_AsGeoJSON(ST_MakePoint(-97.262566, 30.076195)), '{9012}'),
(1776, 2207, 'St Hwy 71', 'West bound lanes at Kellar Rd', 'description', ST_MakePoint(-97.188927, 30.049154), ST_AsGeoJSON(ST_MakePoint(-97.188927, 30.049154)), '{9012}'),
(1777, 2208, 'FM 812', '2200 FM 812', 'description', ST_MakePoint(-97.569672, 30.069399), ST_AsGeoJSON(ST_MakePoint(-97.569672, 30.069399)), '{9012}'),
(1778, 2209, 'N Main St', 'Bridge at N Main St', 'description', ST_MakePoint(-97.320747, 30.131464), ST_AsGeoJSON(ST_MakePoint(-97.320747, 30.131464)), '{9012}'),
(1779, 2210, 'Edgegrove Dr @ S Crest Dr', 'Travis County, TX', 'description', ST_MakePoint(-97.789154, 30.272312), ST_AsGeoJSON(ST_MakePoint(-97.789154, 30.272312)), '{9010}'),
(1780, 2211, 'Sayers Rd', 'Sayers Rd at Smith Rd', 'description', ST_MakePoint(-97.329903, 30.152042), ST_AsGeoJSON(ST_MakePoint(-97.329903, 30.152042)), '{9012}'),
(1781, 2212, 'B J Mayes Rd', '244 B J Mayes Rd', 'description', ST_MakePoint(-97.321091, 30.153620), ST_AsGeoJSON(ST_MakePoint(-97.321091, 30.153620)), '{9012}'),
(1782, 2213, 'FM 20', 'St Hwy 71 to FM 535', 'description', ST_MakePoint(-97.373215, 30.109968), ST_AsGeoJSON(ST_MakePoint(-97.373215, 30.109968)), '{9012}'),
(1783, 2214, 'FM 20', 'FM 20 to St Hwy 71', 'description', ST_MakePoint(-97.433250, 30.004057), ST_AsGeoJSON(ST_MakePoint(-97.433250, 30.004057)), '{9012}'),
(1784, 2217, 'FM 20', 'FM 20 closed at Walnut Creek', 'description', ST_MakePoint(-97.426445, 30.028053), ST_AsGeoJSON(ST_MakePoint(-97.426445, 30.028053)), '{9012}'),
(1785, 2218, 'Piney Creek @ Piney Creek Rd, Fayette County', 'Piney Creek @ Piney Creek Rd', 'description', ST_MakePoint(-96.946190, 30.021112), ST_AsGeoJSON(ST_MakePoint(-96.946190, 30.021112)), '{9018}'),
(1786, 2219, 'Weyand Rd @ Cummins Creek, Fayette County', 'Weyand Rd @ Cummins Creek', 'description', ST_MakePoint(-96.719383, 30.068624), ST_AsGeoJSON(ST_MakePoint(-96.719383, 30.068624)), '{9018}'),
(1787, 2220, 'Jenkins Rd', '200 Blk', 'description', ST_MakePoint(-97.498566, 30.103542), ST_AsGeoJSON(ST_MakePoint(-97.498566, 30.103542)), '{9012}'),
(1788, 2221, 'Bordovsky Rd, Fayette County', 'Bordovsky Rd', 'description', ST_MakePoint(-96.937241, 29.902544), ST_AsGeoJSON(ST_MakePoint(-96.937241, 29.902544)), '{9018}'),
(1789, 2222, 'Hokanson Rd @ Burklund Farms Rd', 'Travis County, TX', 'description', ST_MakePoint(-97.650467, 30.110670), ST_AsGeoJSON(ST_MakePoint(-97.650467, 30.110670)), '{9010}'),
(1790, 2223, 'Gotier Trace Rd', '700 Blk Gotier Trace Rd', 'description', ST_MakePoint(-97.195282, 30.110912), ST_AsGeoJSON(ST_MakePoint(-97.195282, 30.110912)), '{9012}'),
(1791, 2224, 'LOWER RED ROCK BRIDGE AT SH 304', '100 LOWER RED ROCK RD', 'description', ST_MakePoint(-97.357605, 30.076603), ST_AsGeoJSON(ST_MakePoint(-97.357605, 30.076603)), '{9012}'),
(1792, 2225, '462 KELLEY RD', '462 KELLEY RD', 'description', ST_MakePoint(-97.235603, 30.150255), ST_AsGeoJSON(ST_MakePoint(-97.235603, 30.150255)), '{9012}'),
(1793, 2226, 'JONES ST', '900 BLK JONES ST', 'description', ST_MakePoint(-97.160217, 29.996708), ST_AsGeoJSON(ST_MakePoint(-97.160217, 29.996708)), '{9012}'),
(1794, 2227, 'PRIM RD', 'PRIM RD 100ft From Old Lake Rd', 'description', ST_MakePoint(-97.124237, 29.968996), ST_AsGeoJSON(ST_MakePoint(-97.124237, 29.968996)), '{9012}'),
(1795, 2228, 'HILLCREST DR', '115 HILLCREST DR', 'description', ST_MakePoint(-97.252853, 30.137230), ST_AsGeoJSON(ST_MakePoint(-97.252853, 30.137230)), '{9012}'),
(1796, 2229, 'FM 609 @ Buckner', 'FM 609 @ Buckner', 'description', ST_MakePoint(-96.932999, 29.866117), ST_AsGeoJSON(ST_MakePoint(-96.932999, 29.866117)), '{9018}'),
(1797, 2230, 'Holub Rd @ Company Field Rd, Fayette County', 'Holub Rd @ Company Field Rd', 'description', ST_MakePoint(-96.861534, 29.703508), ST_AsGeoJSON(ST_MakePoint(-96.861534, 29.703508)), '{9018}'),
(1798, 2231, 'CARINDAL DR', '500-600 BLK CARDINAL DR', 'description', ST_MakePoint(-97.218605, 30.178679), ST_AsGeoJSON(ST_MakePoint(-97.218605, 30.178679)), '{9012}'),
(1799, 2232, 'RIVERWOOD DR', '111 RIVERWOOD DR', 'description', ST_MakePoint(-97.329819, 30.120583), ST_AsGeoJSON(ST_MakePoint(-97.329819, 30.120583)), '{9012}'),
(1800, 2233, 'FM 20', '1300  BLK FM 20', 'description', ST_MakePoint(-97.423286, 30.035187), ST_AsGeoJSON(ST_MakePoint(-97.423286, 30.035187)), '{9012}'),
(1801, 2234, 'CR 152 @ Lonnie Thomas', 'City of Georgetown', 'description', ST_MakePoint(-97.649734, 30.667786), ST_AsGeoJSON(ST_MakePoint(-97.649734, 30.667786)), '{9015}'),
(1802, 2236, 'PARK ROAD 1C', 'BRIDGE AT PARK ROAD 1C TXDOT', 'description', ST_MakePoint(-97.192421, 30.089668), ST_AsGeoJSON(ST_MakePoint(-97.192421, 30.089668)), '{9012}'),
(1803, 2238, 'FM 2237 @ Roy Rd, Fayette County', 'FM 2237 @ Roy Rd', 'description', ST_MakePoint(-97.154053, 29.835588), ST_AsGeoJSON(ST_MakePoint(-97.154053, 29.835588)), '{9018}'),
(1804, 2239, 'NE 7TH ST', 'NE 7TH ST & WHITEHEAD ST', 'description', ST_MakePoint(-97.146088, 30.006868), ST_AsGeoJSON(ST_MakePoint(-97.146088, 30.006868)), '{9012}'),
(1805, 2240, 'Freyburg Hall Rd near Bryant RD, Fayette County', 'Freyburg Hall Rd near Bryant RD', 'description', ST_MakePoint(-96.974266, 29.729185), ST_AsGeoJSON(ST_MakePoint(-96.974266, 29.729185)), '{9018}'),
(1806, 2241, 'Freyburg Hall Rd near FM 2238, Fayette County', 'Freyburg Hall Rd near FM 2238', 'description', ST_MakePoint(-96.992538, 29.734987), ST_AsGeoJSON(ST_MakePoint(-96.992538, 29.734987)), '{9018}'),
(1807, 2242, '3 Mile Rd off Mockingbird Rd, Fayette County', '3 Mile Rd off Mockingbird Rd', 'description', ST_MakePoint(-97.217308, 29.774277), ST_AsGeoJSON(ST_MakePoint(-97.217308, 29.774277)), '{9018}'),
(1808, 2243, 'Ivy Switch/FM 1322', 'Ivy Switch/FM 1322', 'description', ST_MakePoint(-97.598999, 29.682400), ST_AsGeoJSON(ST_MakePoint(-97.598999, 29.682400)), '{9011}'),
(1809, 2244, 'Skillett Rd off Valenta RD, Fayette County', 'Skillett Rd off Valenta RD', 'description', ST_MakePoint(-96.953438, 29.856251), ST_AsGeoJSON(ST_MakePoint(-96.953438, 29.856251)), '{9018}'),
(1810, 2245, 'Whisper Rd at Arrow', 'Whisper Rd at Arrow', 'description', ST_MakePoint(-97.589333, 29.661961), ST_AsGeoJSON(ST_MakePoint(-97.589333, 29.661961)), '{9011}'),
(1811, 2246, 'Whisper Rd at Plum Creek', 'Whisper Rd at Plum Creek', 'description', ST_MakePoint(-97.601776, 29.657522), ST_AsGeoJSON(ST_MakePoint(-97.601776, 29.657522)), '{9011}'),
(1812, 2247, 'Ivy Switch Rd - 300 Blk', 'Ivy Switch Rd - 300 Blk', 'description', ST_MakePoint(-97.591194, 29.678841), ST_AsGeoJSON(ST_MakePoint(-97.591194, 29.678841)), '{9011}'),
(1813, 2248, 'Cattlemans Row @ Dead End', 'Cattlmans Row', 'description', ST_MakePoint(-97.599716, 29.887192), ST_AsGeoJSON(ST_MakePoint(-97.599716, 29.887192)), '{9011}'),
(1814, 2249, 'FM 957, Fayette County', 'FM 957', 'description', ST_MakePoint(-96.922455, 29.665253), ST_AsGeoJSON(ST_MakePoint(-96.922455, 29.665253)), '{9018}'),
(1815, 2251, 'Turkey Hollow Rd/Mule Creek Rd', 'Turkey Hollow Rd/Mule Creek Rd', 'description', ST_MakePoint(-97.563110, 29.658323), ST_AsGeoJSON(ST_MakePoint(-97.563110, 29.658323)), '{9011}'),
(1816, 2253, 'Turkey Hollow Rd/Sandy Pine Rd', 'Turkey Hollow Rd/Sandy Pine Rd', 'description', ST_MakePoint(-97.572250, 29.662779), ST_AsGeoJSON(ST_MakePoint(-97.572250, 29.662779)), '{9011}'),
(1817, 2254, 'HWY 29 & CR 366', 'HWY 29 & CR 366', 'description', ST_MakePoint(-97.476112, 30.635134), ST_AsGeoJSON(ST_MakePoint(-97.476112, 30.635134)), '{9017}'),
(1818, 2255, 'Old McMahan Rd at Dead End', 'Old McMahan Rd', 'description', ST_MakePoint(-97.571220, 29.868996), ST_AsGeoJSON(ST_MakePoint(-97.571220, 29.868996)), '{9011}'),
(1819, 2256, 'Herzik Rd off Hwy 77, Fayette County', 'Herzik Rd off Hwy 77', 'description', ST_MakePoint(-96.904480, 29.741043), ST_AsGeoJSON(ST_MakePoint(-96.904480, 29.741043)), '{9018}'),
(1820, 2257, 'Old Kelley at City Limits', 'Old Kelley Rd', 'description', ST_MakePoint(-97.639168, 29.880407), ST_AsGeoJSON(ST_MakePoint(-97.639168, 29.880407)), '{9011}'),
(1821, 2258, 'Old Kelley Westbound', 'Old Kelley at Creek', 'description', ST_MakePoint(-97.626808, 29.885990), ST_AsGeoJSON(ST_MakePoint(-97.626808, 29.885990)), '{9011}'),
(1822, 2259, '2396 Farmers Rd', '2396 Farmers', 'description', ST_MakePoint(-97.805496, 29.912657), ST_AsGeoJSON(ST_MakePoint(-97.805496, 29.912657)), '{9011}'),
(1823, 2260, 'Farmers @ Misty', 'Farmers @ Misty', 'description', ST_MakePoint(-97.799660, 29.917139), ST_AsGeoJSON(ST_MakePoint(-97.799660, 29.917139)), '{9011}'),
(1824, 2261, 'Old McMahan at Plum Creek', 'Old McMahan at Plum Creek', 'description', ST_MakePoint(-97.615211, 29.865311), ST_AsGeoJSON(ST_MakePoint(-97.615211, 29.865311)), '{9011}'),
(1825, 2262, 'FM 957 near FM 223, Fayette County', 'FM 957 near FM 223', 'description', ST_MakePoint(-96.931511, 29.633596), ST_AsGeoJSON(ST_MakePoint(-96.931511, 29.633596)), '{9018}'),
(1826, 2264, 'Rolling Ridge at Schuelke', 'Rolling Ridge', 'description', ST_MakePoint(-97.708359, 29.963121), ST_AsGeoJSON(ST_MakePoint(-97.708359, 29.963121)), '{9011}'),
(1827, 2265, '1469 Rolling Ridge', 'to Schuelke Rd', 'description', ST_MakePoint(-97.695312, 29.935474), ST_AsGeoJSON(ST_MakePoint(-97.695312, 29.935474)), '{9011}'),
(1828, 2266, 'WOODRESS ST', 'WOODRESS ST & MILLER ST', 'description', ST_MakePoint(-97.148308, 30.000746), ST_AsGeoJSON(ST_MakePoint(-97.148308, 30.000746)), '{9012}'),
(1829, 2267, 'FM 2237 @ Pin Oak Creek, Fayette County', 'FM 2237 @ Pin Oak Creek', 'description', ST_MakePoint(-97.064743, 29.805616), ST_AsGeoJSON(ST_MakePoint(-97.064743, 29.805616)), '{9018}'),
(1830, 2268, 'Williamson Rd. and TX-21', 'Williamson Rd. and TX-21', 'description', ST_MakePoint(-97.700058, 30.025198), ST_AsGeoJSON(ST_MakePoint(-97.700058, 30.025198)), '{9011}'),
(1831, 2269, 'Ivy Switch at County Line', 'Ivy Switch at County Line', 'description', ST_MakePoint(-97.536613, 29.664328), ST_AsGeoJSON(ST_MakePoint(-97.536613, 29.664328)), '{9011}'),
(1832, 2270, 'Ivy Switch/Mule Creek Rd', 'Ivy Switch/Mule Creek Rd', 'description', ST_MakePoint(-97.552811, 29.668261), ST_AsGeoJSON(ST_MakePoint(-97.552811, 29.668261)), '{9011}'),
(1833, 2271, 'COMMUNITY CENTER RD', '200  BLK COMMUNITY CENTER RD', 'description', ST_MakePoint(-97.356750, 29.886925), ST_AsGeoJSON(ST_MakePoint(-97.356750, 29.886925)), '{9012}'),
(1834, 2272, 'FM 2237 @ Live Oak Creek, Fayette County', 'FM 2237 @ Live Oak Creek', 'description', ST_MakePoint(-97.083458, 29.823456), ST_AsGeoJSON(ST_MakePoint(-97.083458, 29.823456)), '{9018}'),
(1835, 2273, 'Rocky Rd. (off of FM 2001)', 'Rocky Rd. off of FM 2001', 'description', ST_MakePoint(-97.740181, 29.962292), ST_AsGeoJSON(ST_MakePoint(-97.740181, 29.962292)), '{9011}'),
(1836, 2274, 'Mule Creek Rd at County Line', 'Mule Creek Rd at County Line', 'description', ST_MakePoint(-97.517517, 29.675482), ST_AsGeoJSON(ST_MakePoint(-97.517517, 29.675482)), '{9011}'),
(1837, 2275, 'Fox Hollow Rd/Schuelke Rd', 'Fox Hollow Rd/Schuelke Rd', 'description', ST_MakePoint(-97.715981, 30.001804), ST_AsGeoJSON(ST_MakePoint(-97.715981, 30.001804)), '{9011}'),
(1838, 2276, 'Williamson @ Old Lockhart', 'Williamson @ Old Lockhart', 'description', ST_MakePoint(-97.683716, 30.011267), ST_AsGeoJSON(ST_MakePoint(-97.683716, 30.011267)), '{9011}'),
(1839, 2277, '4027 Dry Creek Rd', '4027 Dry Creek Rd', 'description', ST_MakePoint(-97.644218, 29.947021), ST_AsGeoJSON(ST_MakePoint(-97.644218, 29.947021)), '{9011}'),
(1840, 2278, 'Southern Way (Off E. Pierce St.)', 'Southern Way and E. Pierce St.', 'description', ST_MakePoint(-97.602547, 29.656261), ST_AsGeoJSON(ST_MakePoint(-97.602547, 29.656261)), '{9011}'),
(1841, 2279, '1322 @ 1386', 'FM 1322 @ FM 1386', 'description', ST_MakePoint(-97.586739, 29.700302), ST_AsGeoJSON(ST_MakePoint(-97.586739, 29.700302)), '{9011}'),
(1842, 2280, 'S Knezek Rd @ Mulberry Creek, Fayette County', 'S Knezek Rd @ Mulberry Creek', 'description', ST_MakePoint(-97.061493, 29.668293), ST_AsGeoJSON(ST_MakePoint(-97.061493, 29.668293)), '{9018}'),
(1843, 2281, '3345 Tenney Creek Rd', '3345 Tenney Crk Rd', 'description', ST_MakePoint(-97.556992, 29.764776), ST_AsGeoJSON(ST_MakePoint(-97.556992, 29.764776)), '{9011}'),
(1844, 2283, 'FM 153 @ Bastrop County Line, Fayette County', 'FM 153 @ Bastrop County Line', 'description', ST_MakePoint(-97.061546, 30.015839), ST_AsGeoJSON(ST_MakePoint(-97.061546, 30.015839)), '{9018}'),
(1845, 2284, 'FM 153 @ Pilchick Loop, Fayette County', 'FM 153 @ Pilchick Loop', 'description', ST_MakePoint(-97.037811, 30.010414), ST_AsGeoJSON(ST_MakePoint(-97.037811, 30.010414)), '{9018}'),
(1846, 2285, 'COUNTY LINE RD', '300 BLK, GIDDINGS', 'description', ST_MakePoint(-97.058067, 30.091393), ST_AsGeoJSON(ST_MakePoint(-97.058067, 30.091393)), '{9012}'),
(1847, 2286, 'Hwy 21/Hwy 150', 'Hwy 21/Hwy 150', 'description', ST_MakePoint(-97.818062, 29.934612), ST_AsGeoJSON(ST_MakePoint(-97.818062, 29.934612)), '{9011}'),
(1848, 2288, 'Old Colony Line off FM20', '1 mi. off FM 20 toward 713', 'description', ST_MakePoint(-97.559090, 29.896334), ST_AsGeoJSON(ST_MakePoint(-97.559090, 29.896334)), '{9011}'),
(1849, 2289, 'ALUM CREEK EAST', 'ALUM CREEK EAST OFF SH 71', 'description', ST_MakePoint(-97.222382, 30.069551), ST_AsGeoJSON(ST_MakePoint(-97.222382, 30.069551)), '{9012}'),
(1850, 2290, 'Hwy 21/FM 2720', 'Hwy 21/FM 2720', 'description', ST_MakePoint(-97.796432, 29.947702), ST_AsGeoJSON(ST_MakePoint(-97.796432, 29.947702)), '{9011}'),
(1851, 2291, '3563 SE River Rd', 'to low water crossing', 'description', ST_MakePoint(-97.826012, 29.827511), ST_AsGeoJSON(ST_MakePoint(-97.826012, 29.827511)), '{9011}'),
(1852, 2293, 'FM 20 & HUMBLE LN', 'FM 20 & HUMBLE LN', 'description', ST_MakePoint(-97.428169, 30.021744), ST_AsGeoJSON(ST_MakePoint(-97.428169, 30.021744)), '{9012}'),
(1853, 2294, 'PINE VALLEY LOOP, Smithville', '600 BLK', 'description', ST_MakePoint(-97.322014, 29.959761), ST_AsGeoJSON(ST_MakePoint(-97.322014, 29.959761)), '{9012}'),
(1854, 2295, 'CR 227 (Old Spanish Trail) and Short St.', 'CR 227 (Old Spanish Trail) and Short St.', 'description', ST_MakePoint(-97.783607, 29.958790), ST_AsGeoJSON(ST_MakePoint(-97.783607, 29.958790)), '{9011}'),
(1855, 2296, 'CR 227 at St Michael', 'CR 227 at St Michael', 'description', ST_MakePoint(-97.790367, 29.947802), ST_AsGeoJSON(ST_MakePoint(-97.790367, 29.947802)), '{9011}'),
(1856, 2297, 'Creekside @ Highway 86', 'Creekside @ 86', 'description', ST_MakePoint(-97.591949, 29.775803), ST_AsGeoJSON(ST_MakePoint(-97.591949, 29.775803)), '{9011}'),
(1857, 2298, 'Pettytown @ FM 20', 'Pettytown and FM 20', 'description', ST_MakePoint(-97.550316, 29.911251), ST_AsGeoJSON(ST_MakePoint(-97.550316, 29.911251)), '{9011}'),
(1858, 2299, 'CR105/River Park Rd.', 'CR105/River Park Rd.', 'description', ST_MakePoint(-97.684486, 29.692616), ST_AsGeoJSON(ST_MakePoint(-97.684486, 29.692616)), '{9011}'),
(1859, 2300, 'Mineral Springs and FM 671', '114 and FM 671', 'description', ST_MakePoint(-97.681557, 29.775585), ST_AsGeoJSON(ST_MakePoint(-97.681557, 29.775585)), '{9011}'),
(1860, 2301, 'Hwy 142/Greenhouse Rd', 'Hwy 142/Greenhouse Rd', 'description', ST_MakePoint(-97.833694, 29.850887), ST_AsGeoJSON(ST_MakePoint(-97.833694, 29.850887)), '{9011}'),
(1861, 2302, 'NORMA JEAN BLVD', '100-200 BLK NORMA JEAN BLVD', 'description', ST_MakePoint(-97.186440, 30.045273), ST_AsGeoJSON(ST_MakePoint(-97.186440, 30.045273)), '{9012}'),
(1862, 2303, 'Hwy 21@ Rohde rd ', 'Hays County ', 'description', ST_MakePoint(-97.747337, 29.995295), ST_AsGeoJSON(ST_MakePoint(-97.747337, 29.995295)), '{9016}'),
(1863, 2304, 'Hwy 21 @ E FM 150', 'Hays County ', 'description', ST_MakePoint(-97.817825, 29.934534), ST_AsGeoJSON(ST_MakePoint(-97.817825, 29.934534)), '{9016}'),
(1864, 2305, 'OLD SAYERS RD', '1750 OLD SAYERS RD', 'description', ST_MakePoint(-97.339493, 30.238274), ST_AsGeoJSON(ST_MakePoint(-97.339493, 30.238274)), '{9012}'),
(1865, 2306, 'WOLF RD & MARLIN ST', '100 BLK WOLF RD', 'description', ST_MakePoint(-97.205132, 30.297363), ST_AsGeoJSON(ST_MakePoint(-97.205132, 30.297363)), '{9012}'),
(1866, 2307, 'WOLF RD & KNOBBS RD', '400-500 BLK WOLF RD', 'description', ST_MakePoint(-97.224083, 30.315960), ST_AsGeoJSON(ST_MakePoint(-97.224083, 30.315960)), '{9012}'),
(1867, 2308, 'Noak Rd @ Jacks Creek, Fayette County', 'Noak Rd @ Jacks Creek, Fayette County', 'description', ST_MakePoint(-96.666672, 30.037806), ST_AsGeoJSON(ST_MakePoint(-96.666672, 30.037806)), '{9018}'),
(1868, 2309, 'Krenek Rd @ Pettys Creek, Fayette County', 'Krenek Rd @ Pettys Creek', 'description', ST_MakePoint(-96.725288, 29.844137), ST_AsGeoJSON(ST_MakePoint(-96.725288, 29.844137)), '{9018}'),
(1869, 2311, 'FM 2503, Fayette County', 'FM 2503', 'description', ST_MakePoint(-96.655914, 29.880667), ST_AsGeoJSON(ST_MakePoint(-96.655914, 29.880667)), '{9018}'),
(1870, 2312, 'Easley Rd', '500 Blk', 'description', ST_MakePoint(-97.291084, 29.952106), ST_AsGeoJSON(ST_MakePoint(-97.291084, 29.952106)), '{9012}'),
(1871, 2313, 'Easley Rd', '200 Blk', 'description', ST_MakePoint(-97.275032, 29.983295), ST_AsGeoJSON(ST_MakePoint(-97.275032, 29.983295)), '{9012}'),
(1872, 2314, 'W Travis St (Business 71) @ Colorado River, Fayette County', 'W Travis St (Business 71) @ Colorado River', 'description', ST_MakePoint(-96.886971, 29.901161), ST_AsGeoJSON(ST_MakePoint(-96.886971, 29.901161)), '{9018}'),
(1873, 2316, 'Maunalua Dr', '100 Blk, Bastrop, TX', 'description', ST_MakePoint(-97.315506, 30.089396), ST_AsGeoJSON(ST_MakePoint(-97.315506, 30.089396)), '{9012}'),
(1874, 2317, 'Bateman Rd', '800 Blk, Red Rock, TX', 'description', ST_MakePoint(-97.441055, 29.923016), ST_AsGeoJSON(ST_MakePoint(-97.441055, 29.923016)), '{9012}'),
(1875, 2318, '13000-blk Ballerstedt', 'Travis County, TX', 'description', ST_MakePoint(-97.460091, 30.349457), ST_AsGeoJSON(ST_MakePoint(-97.460091, 30.349457)), '{9010}'),
(1876, 2319, '12000-blk Felder Ln', 'Travis County,TX', 'description', ST_MakePoint(-97.473145, 30.447392), ST_AsGeoJSON(ST_MakePoint(-97.473145, 30.447392)), '{9010}'),
(1877, 2320, 'Martin Luther King @ Bunte St', 'MLK @ Bunte St', 'description', ST_MakePoint(-97.147629, 29.997950), ST_AsGeoJSON(ST_MakePoint(-97.147629, 29.997950)), '{9012}'),
(1878, 2321, 'SE 2nd St @ Bunte', 'SE 2nd @ Bunte St', 'description', ST_MakePoint(-97.147171, 29.998795), ST_AsGeoJSON(ST_MakePoint(-97.147171, 29.998795)), '{9012}'),
(1879, 2322, 'SE 1st St @ Bunte St', 'SE 1st St @ Bunte St', 'description', ST_MakePoint(-97.146683, 29.999577), ST_AsGeoJSON(ST_MakePoint(-97.146683, 29.999577)), '{9012}'),
(1880, 2323, 'Martin Luther King @ Miller St', 'Martin Luther King @ Miller ST', 'description', ST_MakePoint(-97.149483, 29.998751), ST_AsGeoJSON(ST_MakePoint(-97.149483, 29.998751)), '{9012}'),
(1881, 2324, '2nd Ave @ Hickory St', '2nd Ave, Smithville, TX', 'description', ST_MakePoint(-97.171509, 30.011484), ST_AsGeoJSON(ST_MakePoint(-97.171509, 30.011484)), '{9012}'),
(1882, 2325, 'TX1002 - FM 535 @ Watterson School Rd', 'FM 535, Cedar Creek', 'description', ST_MakePoint(-97.414001, 29.978550), ST_AsGeoJSON(ST_MakePoint(-97.414001, 29.978550)), '{9012}'),
(1883, 2326, 'Marburger St between 5th & 6th', 'Marburger St, Smithville, TX', 'description', ST_MakePoint(-97.145821, 30.005213), ST_AsGeoJSON(ST_MakePoint(-97.145821, 30.005213)), '{9012}'),
(1884, 2327, 'Turney St @ 4th St', 'Turney St, Smithville, TX', 'description', ST_MakePoint(-97.150436, 30.005539), ST_AsGeoJSON(ST_MakePoint(-97.150436, 30.005539)), '{9012}'),
(1885, 2328, 'Byrne St @ 4th St', 'Byrne St, Smithville, TX', 'description', ST_MakePoint(-97.149529, 30.005022), ST_AsGeoJSON(ST_MakePoint(-97.149529, 30.005022)), '{9012}'),
(1886, 2329, 'Hill Rd @ SH 71', 'Hill Rd, Smithville, TX', 'description', ST_MakePoint(-97.134911, 30.005501), ST_AsGeoJSON(ST_MakePoint(-97.134911, 30.005501)), '{9012}'),
(1887, 2330, 'Crafts Prairie Rd', 'Crafts Prairie Rd, Smithville, TX', 'description', ST_MakePoint(-97.247444, 30.052462), ST_AsGeoJSON(ST_MakePoint(-97.247444, 30.052462)), '{9012}'),
(1888, 2331, 'Akaloa Dr', 'Akaloa Dr at Wahane Ln', 'description', ST_MakePoint(-97.290314, 30.080730), ST_AsGeoJSON(ST_MakePoint(-97.290314, 30.080730)), '{9012}'),
(1889, 2332, 'Blue Jay Rd', '100 blk Blue Jay Rd', 'description', ST_MakePoint(-97.563454, 30.006632), ST_AsGeoJSON(ST_MakePoint(-97.563454, 30.006632)), '{9012}'),
(1890, 2333, 'Karisch Rd', '300 blk Karish Rd', 'description', ST_MakePoint(-97.069099, 30.042641), ST_AsGeoJSON(ST_MakePoint(-97.069099, 30.042641)), '{9012}'),
(1891, 2334, 'Ponderosa Rd', '700 blk Ponderosa Rd', 'description', ST_MakePoint(-97.220215, 30.034109), ST_AsGeoJSON(ST_MakePoint(-97.220215, 30.034109)), '{9012}'),
(1892, 2335, 'HIDDEN SHORES RD', 'HIDDEN SHORES RD', 'description', ST_MakePoint(-97.198914, 30.025503), ST_AsGeoJSON(ST_MakePoint(-97.198914, 30.025503)), '{9012}'),
(1893, 2336, 'HIDDEN SHORES LOOP', 'HIDDEN SHORES LOOP', 'description', ST_MakePoint(-97.200676, 30.043644), ST_AsGeoJSON(ST_MakePoint(-97.200676, 30.043644)), '{9012}'),
(1894, 2337, 'Post Oak Trl', 'Entire Road', 'description', ST_MakePoint(-97.542580, 30.108210), ST_AsGeoJSON(ST_MakePoint(-97.542580, 30.108210)), '{9012}'),
(1895, 2338, 'HWY 86 @ Camelback Area', 'HWY 86 @ Camelback Area', 'description', ST_MakePoint(-97.576241, 29.793978), ST_AsGeoJSON(ST_MakePoint(-97.576241, 29.793978)), '{9011}'),
(1896, 2339, 'Young La @ 2600 Blk', 'Young La @ 2600 Blk', 'description', ST_MakePoint(-97.595177, 29.825319), ST_AsGeoJSON(ST_MakePoint(-97.595177, 29.825319)), '{9011}'),
(1897, 2340, '1000 blk Hutto Rd', '1000 blk Hutto Rd', 'description', ST_MakePoint(-97.606705, 30.444635), ST_AsGeoJSON(ST_MakePoint(-97.606705, 30.444635)), '{9008}'),
(1898, 2341, '1000 blk Immanuel Rd', '1000 blk Immanuel Rd', 'description', ST_MakePoint(-97.617149, 30.424711), ST_AsGeoJSON(ST_MakePoint(-97.617149, 30.424711)), '{9008}'),
(1899, 2342, 'Mammoth Cave Blvd & N Cascades Ave', 'Mammoth Cave Blvd & N Cascades Ave', 'description', ST_MakePoint(-97.615211, 30.460487), ST_AsGeoJSON(ST_MakePoint(-97.615211, 30.460487)), '{9008}'),
(1900, 2344, '2200 blk Kelly Ln', '2200 blk Kelly Ln', 'description', ST_MakePoint(-97.585007, 30.467777), ST_AsGeoJSON(ST_MakePoint(-97.585007, 30.467777)), '{9008}'),
(1901, 2345, 'FM 2571', 'FM 2571 TXDOT', 'description', ST_MakePoint(-97.246002, 30.009134), ST_AsGeoJSON(ST_MakePoint(-97.246002, 30.009134)), '{9012}'),
(1902, 2346, '1700 blk E Pecan St', '1700 blk E Pecan St', 'description', ST_MakePoint(-97.603508, 30.431669), ST_AsGeoJSON(ST_MakePoint(-97.603508, 30.431669)), '{9008}'),
(1903, 2347, '3600 blk E Pflugerville Pkwy', '3600 blk E Pflugerville Pkwy', 'description', ST_MakePoint(-97.578987, 30.442114), ST_AsGeoJSON(ST_MakePoint(-97.578987, 30.442114)), '{9008}'),
(1904, 2348, '2500 blk E Pecan St', '2500 blk E Pecan St', 'description', ST_MakePoint(-97.590706, 30.424891), ST_AsGeoJSON(ST_MakePoint(-97.590706, 30.424891)), '{9008}'),
(1905, 2349, 'Immanuel Rd & E Pecan St', 'Immanuel Rd & E Pecan St', 'description', ST_MakePoint(-97.610466, 30.434956), ST_AsGeoJSON(ST_MakePoint(-97.610466, 30.434956)), '{9008}'),
(1906, 2350, 'E Pecan St & Plumbago Dr', 'E Pecan St & Plumbago Dr', 'description', ST_MakePoint(-97.605682, 30.432678), ST_AsGeoJSON(ST_MakePoint(-97.605682, 30.432678)), '{9008}'),
(1907, 2351, 'FM 685 & E Pflugerville Pkwy', 'FM 685 & E Pflugerville Pkwy', 'description', ST_MakePoint(-97.602081, 30.455914), ST_AsGeoJSON(ST_MakePoint(-97.602081, 30.455914)), '{9008}'),
(1908, 2352, '700 blk N Railroad Ave', '700 blk N Railroad Ave', 'description', ST_MakePoint(-97.618156, 30.445145), ST_AsGeoJSON(ST_MakePoint(-97.618156, 30.445145)), '{9008}'),
(1909, 2353, '1400 blk Grand Avenue Pkwy', '1400 blk Grand Avenue Pkwy', 'description', ST_MakePoint(-97.649223, 30.459835), ST_AsGeoJSON(ST_MakePoint(-97.649223, 30.459835)), '{9008}'),
(1910, 2354, 'Kelly Ln & Vilamoura St', 'Kelly Ln & Vilamoura St', 'description', ST_MakePoint(-97.574684, 30.462919), ST_AsGeoJSON(ST_MakePoint(-97.574684, 30.462919)), '{9008}'),
(1911, 2355, 'FM 685 & Pfennig Ln', 'FM 685 & Pfennig Ln', 'description', ST_MakePoint(-97.604950, 30.450813), ST_AsGeoJSON(ST_MakePoint(-97.604950, 30.450813)), '{9008}'),
(1912, 2356, 'E Pfennig Ln & E Black Locust Dr', 'Pfennig Ln & E Black Locust Dr', 'description', ST_MakePoint(-97.622551, 30.454319), ST_AsGeoJSON(ST_MakePoint(-97.622551, 30.454319)), '{9008}'),
(1913, 2357, 'SH 71 EASTBOUND', 'E SH 71 SMITHVILLE', 'description', ST_MakePoint(-97.129143, 29.997698), ST_AsGeoJSON(ST_MakePoint(-97.129143, 29.997698)), '{9012}'),
(1914, 2358, 'E SH 71', 'E SH 71 SMITHVILLE', 'description', ST_MakePoint(-97.128181, 29.994781), ST_AsGeoJSON(ST_MakePoint(-97.128181, 29.994781)), '{9012}'),
(1915, 2359, 'LOWER RED ROCK RD', '400 Blk', 'description', ST_MakePoint(-97.380119, 30.024183), ST_AsGeoJSON(ST_MakePoint(-97.380119, 30.024183)), '{9012}'),
(1916, 2360, 'Pettytown Rd @ FM 86', 'Pettytown Rd @ FM 86', 'description', ST_MakePoint(-97.509796, 29.878870), ST_AsGeoJSON(ST_MakePoint(-97.509796, 29.878870)), '{9011}'),
(1917, 2361, 'OTT LN', '300-400 Blk ', 'description', ST_MakePoint(-97.393967, 29.862024), ST_AsGeoJSON(ST_MakePoint(-97.393967, 29.862024)), '{9012}'),
(1918, 2362, 'FM 672 near Walnut Ct', 'FM 672 near Walnut Ct', 'description', ST_MakePoint(-97.585533, 29.944307), ST_AsGeoJSON(ST_MakePoint(-97.585533, 29.944307)), '{9011}'),
(1919, 2363, '2226 Jolley Rd', '2226 Jolley Rd', 'description', ST_MakePoint(-97.755501, 29.899748), ST_AsGeoJSON(ST_MakePoint(-97.755501, 29.899748)), '{9011}'),
(1920, 2364, 'Schuelke Rd (4000 Blk)', 'Schuelke Rd (4000 Blk)', 'description', ST_MakePoint(-97.712067, 29.981167), ST_AsGeoJSON(ST_MakePoint(-97.712067, 29.981167)), '{9011}'),
(1921, 2365, 'County View Rd/FM 2720', 'County View Rd/FM 2720', 'description', ST_MakePoint(-97.734688, 29.906406), ST_AsGeoJSON(ST_MakePoint(-97.734688, 29.906406)), '{9011}'),
(1922, 2366, 'Burdette Wells Rd near 183', 'Burdette Wells Rd near 183', 'description', ST_MakePoint(-97.659737, 29.781574), ST_AsGeoJSON(ST_MakePoint(-97.659737, 29.781574)), '{9011}'),
(1923, 2367, 'Homannville Rd/FM 1185', 'Homannville Rd/FM 1185', 'description', ST_MakePoint(-97.641495, 29.966579), ST_AsGeoJSON(ST_MakePoint(-97.641495, 29.966579)), '{9011}'),
(1924, 2368, 'Williamson Rd/Elm Grove Rd', 'Williamson Rd/Elm Grove Rd', 'description', ST_MakePoint(-97.708977, 30.036215), ST_AsGeoJSON(ST_MakePoint(-97.708977, 30.036215)), '{9011}'),
(1925, 2369, 'FM 672/FM 1854', 'FM 672/FM 1854', 'description', ST_MakePoint(-97.586800, 29.942125), ST_AsGeoJSON(ST_MakePoint(-97.586800, 29.942125)), '{9011}'),
(1926, 2370, 'FM 713 13000 blk', 'FM 713 13000 blk', 'description', ST_MakePoint(-97.416656, 29.838287), ST_AsGeoJSON(ST_MakePoint(-97.416656, 29.838287)), '{9011}'),
(1927, 2371, 'Pebblestone Rd 1200 Blk', 'Pebblestone Rd 1200 Blk', 'description', ST_MakePoint(-97.505363, 29.904268), ST_AsGeoJSON(ST_MakePoint(-97.505363, 29.904268)), '{9011}'),
(1928, 2372, 'FM 713 11000 Blk', 'FM 713 11000 Blk', 'description', ST_MakePoint(-97.433914, 29.844151), ST_AsGeoJSON(ST_MakePoint(-97.433914, 29.844151)), '{9011}'),
(1929, 2373, 'Harwood Rd', 'Harwood Rd', 'description', ST_MakePoint(-97.516251, 29.696865), ST_AsGeoJSON(ST_MakePoint(-97.516251, 29.696865)), '{9011}'),
(1930, 2374, 'Tenney Creek Rd/Hall Rd', 'Tenney Creek Rd/Hall Rd', 'description', ST_MakePoint(-97.542747, 29.742758), ST_AsGeoJSON(ST_MakePoint(-97.542747, 29.742758)), '{9011}'),
(1931, 2375, 'Seneca Loop', 'Seneca Loop', 'description', ST_MakePoint(-97.765327, 29.748589), ST_AsGeoJSON(ST_MakePoint(-97.765327, 29.748589)), '{9011}'),
(1932, 2376, 'Tumbleweed Trail between 1600 and 1900', 'Tumbleweed Trail between 1600 and 1900', 'description', ST_MakePoint(-97.596581, 29.915222), ST_AsGeoJSON(ST_MakePoint(-97.596581, 29.915222)), '{9011}'),
(1933, 2377, 'Bugtussle 300 Blk', 'Bugtussle 300 Blk', 'description', ST_MakePoint(-97.734512, 29.766582), ST_AsGeoJSON(ST_MakePoint(-97.734512, 29.766582)), '{9011}'),
(1934, 2378, 'Circle Rd', 'Circle Rd at Pin Oak Creek', 'description', ST_MakePoint(-97.081940, 30.073074), ST_AsGeoJSON(ST_MakePoint(-97.081940, 30.073074)), '{9012}'),
(1935, 2379, 'West Ridge Dr', 'West Ridge Dr', 'description', ST_MakePoint(-97.437729, 30.100183), ST_AsGeoJSON(ST_MakePoint(-97.437729, 30.100183)), '{9012}'),
(1936, 2380, 'FM 20 at Bee Creek Rd', 'FM 20 at Bee Creek Rd', 'description', ST_MakePoint(-97.501335, 29.941742), ST_AsGeoJSON(ST_MakePoint(-97.501335, 29.941742)), '{9011}'),
(1937, 2381, 'Homannville Trail 700 Blk', 'Homannville Trail 700 Blk', 'description', ST_MakePoint(-97.658012, 29.979443), ST_AsGeoJSON(ST_MakePoint(-97.658012, 29.979443)), '{9011}'),
(1938, 2382, 'FM 2571', 'FM 2571 - 3.5 miles west of St Hwy 95', 'description', ST_MakePoint(-97.215591, 30.020102), ST_AsGeoJSON(ST_MakePoint(-97.215591, 30.020102)), '{9012}'),
(1939, 2384, 'Reids Bend @ Sink Hole', '180-350 Block, Reids Bend, Bastrop, TX 78602', 'description', ST_MakePoint(-97.335648, 30.128698), ST_AsGeoJSON(ST_MakePoint(-97.335648, 30.128698)), '{9012}'),
(1940, 2385, 'Foothill Rd', '202-261 Foothill Rd', 'description', ST_MakePoint(-97.294701, 30.187031), ST_AsGeoJSON(ST_MakePoint(-97.294701, 30.187031)), '{9012}'),
(1941, 2386, 'RR 12 at FM 32 ', 'rr 12 at FM 32', 'description', ST_MakePoint(-98.091995, 29.942455), ST_AsGeoJSON(ST_MakePoint(-98.091995, 29.942455)), '{9016}'),
(1942, 2387, 'Rr 12 @ CR 1492', 'Rr 12 @ CR 1492', 'description', ST_MakePoint(-98.092773, 29.973843), ST_AsGeoJSON(ST_MakePoint(-98.092773, 29.973843)), '{9016}'),
(1943, 2388, 'w fm 150 @ arroyo ranch rd', 'Fm 150 @ Arroyo Ranch rd', 'description', ST_MakePoint(-97.907219, 30.025419), ST_AsGeoJSON(ST_MakePoint(-97.907219, 30.025419)), '{9016}'),
(1944, 2389, 'Fm 150 @ Indian Hills Rd', 'Fm 150 @ Indian Hills Rd', 'description', ST_MakePoint(-97.933365, 30.032825), ST_AsGeoJSON(ST_MakePoint(-97.933365, 30.032825)), '{9016}'),
(1945, 2390, 'Fm 150 @ Pintail St', 'Fm 150 @ Pintail St ', 'description', ST_MakePoint(-97.961899, 30.043283), ST_AsGeoJSON(ST_MakePoint(-97.961899, 30.043283)), '{9016}'),
(1946, 2391, 'Onion Creek Bridge', '500blk FM 967', 'description', ST_MakePoint(-97.848351, 30.086048), ST_AsGeoJSON(ST_MakePoint(-97.848351, 30.086048)), '{9016}'),
(1947, 2392, 'Fm 1626 @ Jack C Hays Trl ', 'Hays County', 'description', ST_MakePoint(-97.874664, 30.050295), ST_AsGeoJSON(ST_MakePoint(-97.874664, 30.050295)), '{9016}'),
(1948, 2393, 'Rr 12 - Springlake Dr', 'Hays County', 'description', ST_MakePoint(-98.087997, 30.208429), ST_AsGeoJSON(ST_MakePoint(-98.087997, 30.208429)), '{9016}'),
(1949, 2394, 'Polonia Rd/FM 2001', 'Polonia Rd/FM2001', 'description', ST_MakePoint(-97.731140, 29.936958), ST_AsGeoJSON(ST_MakePoint(-97.731140, 29.936958)), '{9011}');
-- Restart sequence after the end of legacy ids, this way
-- when we add new crossings we can use the new id in our 
-- legacy xml and avoid duplicate ids
alter sequence floods.crossing_id_seq restart with 2395;

-- Add communities for the tons of crossings
insert into floods.community (id, name, abbreviation, viewportgeojson) values (9001, 'Leander', 'LEA', ST_AsGeoJSON(ST_MakeEnvelope(-97.785240, 30.259219, -97.753574, 30.276096)));
insert into floods.community (id, name, abbreviation, viewportgeojson) values (9002, 'ALL', 'ALL', ST_AsGeoJSON(ST_MakeEnvelope(-97.785240, 30.259219, -97.753574, 30.276096)));
insert into floods.community (id, name, abbreviation, viewportgeojson) values (9003, 'Cedar Park', 'CPK', ST_AsGeoJSON(ST_MakeEnvelope(-97.785240, 30.259219, -97.753574, 30.276096)));
insert into floods.community (id, name, abbreviation, viewportgeojson) values (9004, 'Round Rock', 'RRK', ST_AsGeoJSON(ST_MakeEnvelope(-97.785240, 30.259219, -97.753574, 30.276096)));
insert into floods.community (id, name, abbreviation, viewportgeojson) values (9005, 'West Lake Hills', 'WLH', ST_AsGeoJSON(ST_MakeEnvelope(-97.785240, 30.259219, -97.753574, 30.276096)));
insert into floods.community (id, name, abbreviation, viewportgeojson) values (9006, 'Marble Falls', 'MBF', ST_AsGeoJSON(ST_MakeEnvelope(-97.785240, 30.259219, -97.753574, 30.276096)));
insert into floods.community (id, name, abbreviation, viewportgeojson) values (9007, 'Sunset Valley', 'SSV', ST_AsGeoJSON(ST_MakeEnvelope(-97.785240, 30.259219, -97.753574, 30.276096)));
insert into floods.community (id, name, abbreviation, viewportgeojson) values (9008, 'Pflugerville', 'pfl', ST_AsGeoJSON(ST_MakeEnvelope(-97.785240, 30.259219, -97.753574, 30.276096)));
insert into floods.community (id, name, abbreviation, viewportgeojson) values (9009, 'City of Austin', 'COA', ST_AsGeoJSON(ST_MakeEnvelope(-97.785240, 30.259219, -97.753574, 30.276096)));
insert into floods.community (id, name, abbreviation, viewportgeojson) values (9010, 'Travis County', 'TCO', ST_AsGeoJSON(ST_MakeEnvelope(-97.785240, 30.259219, -97.753574, 30.276096)));
insert into floods.community (id, name, abbreviation, viewportgeojson) values (9011, 'Caldwell County', 'CCO', ST_AsGeoJSON(ST_MakeEnvelope(-97.785240, 30.259219, -97.753574, 30.276096)));
insert into floods.community (id, name, abbreviation, viewportgeojson) values (9012, 'Bastrop County', 'BCO', ST_AsGeoJSON(ST_MakeEnvelope(-97.785240, 30.259219, -97.753574, 30.276096)));
insert into floods.community (id, name, abbreviation, viewportgeojson) values (9013, 'Lee County', 'LEECO',ST_AsGeoJSON(ST_MakeEnvelope(-97.785240, 30.259219, -97.753574, 30.276096)));
insert into floods.community (id, name, abbreviation, viewportgeojson) values (9014, 'Rollingwood', 'ROL', ST_AsGeoJSON(ST_MakeEnvelope(-97.785240, 30.259219, -97.753574, 30.276096)));
insert into floods.community (id, name, abbreviation, viewportgeojson) values (9015, 'Georgetown', 'GEO', ST_AsGeoJSON(ST_MakeEnvelope(-97.785240, 30.259219, -97.753574, 30.276096)));
insert into floods.community (id, name, abbreviation, viewportgeojson) values (9016, 'Hays County', 'HCO', ST_AsGeoJSON(ST_MakeEnvelope(-97.785240, 30.259219, -97.753574, 30.276096)));
insert into floods.community (id, name, abbreviation, viewportgeojson) values (9017, 'Williamson County', 'WCO', ST_AsGeoJSON(ST_MakeEnvelope(-97.785240, 30.259219, -97.753574, 30.276096)));
insert into floods.community (id, name, abbreviation, viewportgeojson) values (9018, 'Fayette County', 'FCO', ST_AsGeoJSON(ST_MakeEnvelope(-97.785240, 30.259219, -97.753574, 30.276096)));

-- Set the jwt claim settings so the register user function works
-- Make sure they're local so we actually use the token outside of this script
select set_config('jwt.claims.community_id', '1', true);
select set_config('jwt.claims.role', 'floods_super_admin', true);
-- Add super admin
select floods.register_user(text 'Super', text 'Admin', text 'Superhero, Administrator', integer '9009', text '867-5309', text 'superadmin@flo.ods', text 'texasfloods', text 'floods_super_admin');
-- Add community admins to each new community
select floods.register_user(text 'Leander', text 'Admin', text 'Community Administrator', integer '9001', text '867-5309', text 'admin@lea.floods', text 'texasfloods', text 'floods_community_admin');
select floods.register_user(text 'ALL', text 'Admin', text 'Community Administrator', integer '9002', text '867-5309', text 'admin@all.floods', text 'texasfloods', text 'floods_community_admin');
select floods.register_user(text 'Cedar Park', text 'Admin', text 'Community Administrator', integer '9003', text '867-5309', text 'admin@cpk.floods', text 'texasfloods', text 'floods_community_admin');
select floods.register_user(text 'Round Rock', text 'Admin', text 'Community Administrator', integer '9004', text '867-5309', text 'admin@rrk.floods', text 'texasfloods', text 'floods_community_admin');
select floods.register_user(text 'West Lake Hills', text 'Admin', text 'Community Administrator', integer '9005', text '867-5309', text 'admin@wlh.floods', text 'texasfloods', text 'floods_community_admin');
select floods.register_user(text 'Marble Falls', text 'Admin', text 'Community Administrator', integer '9006', text '867-5309', text 'admin@mbf.floods', text 'texasfloods', text 'floods_community_admin');
select floods.register_user(text 'Sunset Valley', text 'Admin', text 'Community Administrator', integer '9007', text '867-5309', text 'admin@ssv.floods', text 'texasfloods', text 'floods_community_admin');
select floods.register_user(text 'Pflugerville', text 'Admin', text 'Community Administrator', integer '9008', text '867-5309', text 'admin@pfl.floods', text 'texasfloods', text 'floods_community_admin');
select floods.register_user(text 'City of Austin', text 'Admin', text 'Community Administrator', integer '9009', text '867-5309', text 'admin@coa.floods', text 'texasfloods', text 'floods_community_admin');
select floods.register_user(text 'Travis County', text 'Admin', text 'Community Administrator', integer '9010', text '867-5309', text 'admin@tco.floods', text 'texasfloods', text 'floods_community_admin');
select floods.register_user(text 'Caldwell County', text 'Admin', text 'Community Administrator', integer '9011', text '867-5309', text 'admin@cco.floods', text 'texasfloods', text 'floods_community_admin');
select floods.register_user(text 'Bastrop County', text 'Admin', text 'Community Administrator', integer '9012', text '867-5309', text 'admin@bco.floods', text 'texasfloods', text 'floods_community_admin');
select floods.register_user(text 'Lee County', text 'Admin', text 'Community Administrator', integer '9013', text '867-5309', text 'admin@leeco.floods', text 'texasfloods', text 'floods_community_admin');
select floods.register_user(text 'Rollingwood', text 'Admin', text 'Community Administrator', integer '9014', text '867-5309', text 'admin@rol.floods', text 'texasfloods', text 'floods_community_admin');
select floods.register_user(text 'Georgetown', text 'Admin', text 'Community Administrator', integer '9015', text '867-5309', text 'admin@geo.floods', text 'texasfloods', text 'floods_community_admin');
select floods.register_user(text 'Hays County', text 'Admin', text 'Community Administrator', integer '9016', text '867-5309', text 'admin@hco.floods', text 'texasfloods', text 'floods_community_admin');
select floods.register_user(text 'Williamson County', text 'Admin', text 'Community Administrator', integer '9017', text '867-5309', text 'admin@wco.floods', text 'texasfloods', text 'floods_community_admin');
select floods.register_user(text 'Fayette County', text 'Admin', text 'Community Administrator', integer '9018', text '867-5309', text 'admin@fco.floods', text 'texasfloods', text 'floods_community_admin');

update floods.community
  set viewportgeojson = (select ST_AsGeoJSON(ST_Envelope(ST_Extent(c.coordinates))) from floods.crossing c where array_position(c.community_ids, 9001) >= 0)
  where id = 9001;
update floods.community
  set viewportgeojson = (select ST_AsGeoJSON(ST_Envelope(ST_Extent(c.coordinates))) from floods.crossing c where array_position(c.community_ids, 9002) >= 0)
  where id = 9002;
update floods.community
  set viewportgeojson = (select ST_AsGeoJSON(ST_Envelope(ST_Extent(c.coordinates))) from floods.crossing c where array_position(c.community_ids, 9003) >= 0)
  where id = 9003;
update floods.community
  set viewportgeojson = (select ST_AsGeoJSON(ST_Envelope(ST_Extent(c.coordinates))) from floods.crossing c where array_position(c.community_ids, 9004) >= 0)
  where id = 9004;
update floods.community
  set viewportgeojson = (select ST_AsGeoJSON(ST_Envelope(ST_Extent(c.coordinates))) from floods.crossing c where array_position(c.community_ids, 9005) >= 0)
  where id = 9005;
update floods.community
  set viewportgeojson = (select ST_AsGeoJSON(ST_Envelope(ST_Extent(c.coordinates))) from floods.crossing c where array_position(c.community_ids, 9006) >= 0)
  where id = 9006;
update floods.community
  set viewportgeojson = (select ST_AsGeoJSON(ST_Envelope(ST_Extent(c.coordinates))) from floods.crossing c where array_position(c.community_ids, 9007) >= 0)
  where id = 9007;
update floods.community
  set viewportgeojson = (select ST_AsGeoJSON(ST_Envelope(ST_Extent(c.coordinates))) from floods.crossing c where array_position(c.community_ids, 9008) >= 0)
  where id = 9008;
update floods.community
  set viewportgeojson = (select ST_AsGeoJSON(ST_Envelope(ST_Extent(c.coordinates))) from floods.crossing c where array_position(c.community_ids, 9009) >= 0)
  where id = 9009;
update floods.community
  set viewportgeojson = (select ST_AsGeoJSON(ST_Envelope(ST_Extent(c.coordinates))) from floods.crossing c where array_position(c.community_ids, 9010) >= 0)
  where id = 9010;
update floods.community
  set viewportgeojson = (select ST_AsGeoJSON(ST_Envelope(ST_Extent(c.coordinates))) from floods.crossing c where array_position(c.community_ids, 9011) >= 0)
  where id = 9011;
update floods.community
  set viewportgeojson = (select ST_AsGeoJSON(ST_Envelope(ST_Extent(c.coordinates))) from floods.crossing c where array_position(c.community_ids, 9012) >= 0)
  where id = 9012;
update floods.community
  set viewportgeojson = (select ST_AsGeoJSON(ST_Envelope(ST_Extent(c.coordinates))) from floods.crossing c where array_position(c.community_ids, 9013) >= 0)
  where id = 9013;
update floods.community
  set viewportgeojson = (select ST_AsGeoJSON(ST_Envelope(ST_Extent(c.coordinates))) from floods.crossing c where array_position(c.community_ids, 9014) >= 0)
  where id = 9014;
update floods.community
  set viewportgeojson = (select ST_AsGeoJSON(ST_Envelope(ST_Extent(c.coordinates))) from floods.crossing c where array_position(c.community_ids, 9015) >= 0)
  where id = 9015;
update floods.community
  set viewportgeojson = (select ST_AsGeoJSON(ST_Envelope(ST_Extent(c.coordinates))) from floods.crossing c where array_position(c.community_ids, 9016) >= 0)
  where id = 9016;
update floods.community
  set viewportgeojson = (select ST_AsGeoJSON(ST_Envelope(ST_Extent(c.coordinates))) from floods.crossing c where array_position(c.community_ids, 9017) >= 0)
  where id = 9017;
update floods.community
  set viewportgeojson = (select ST_AsGeoJSON(ST_Envelope(ST_Extent(c.coordinates))) from floods.crossing c where array_position(c.community_ids, 9018) >= 0)
  where id = 9018;

-- Add status updates for the tons of crossings
insert into floods.status_update (id, status_id, creator_id, crossing_id, notes, created_at) values

(1, 1, 1, 1, 'notes', '2017-09-03T09:27:57Z'),
(2, 1, 1, 2, 'notes', '2017-09-03T09:27:57Z'),
(3, 1, 1, 3, 'notes', '2017-09-03T09:27:57Z'),
(4, 1, 1, 4, 'notes', '2017-09-03T09:27:57Z'),
(5, 1, 1, 5, 'notes', '2017-09-03T09:27:57Z'),
(6, 1, 1, 6, 'notes', '2017-09-03T09:27:57Z'),
(7, 1, 1, 7, 'notes', '2017-09-03T09:27:57Z'),
(8, 1, 1, 8, 'notes', '2017-09-03T09:27:57Z'),
(9, 1, 1, 9, 'notes', '2017-09-03T09:27:57Z'),
(10, 1, 1, 10, 'notes', '2017-09-03T09:27:57Z'),
(11, 1, 1, 11, 'notes', '2017-09-03T09:27:57Z'),
(12, 1, 1, 12, 'notes', '2017-09-03T09:27:57Z'),
(13, 1, 1, 13, 'notes', '2017-09-03T09:27:57Z'),
(14, 1, 1, 14, 'notes', '2017-09-03T09:27:57Z'),
(15, 1, 1, 15, 'notes', '2017-09-03T09:27:57Z'),
(16, 1, 1, 16, 'notes', '2017-09-03T09:27:57Z'),
(17, 1, 1, 17, 'notes', '2017-09-03T09:27:57Z'),
(18, 1, 1, 18, 'notes', '2017-09-03T09:27:57Z'),
(19, 1, 1, 19, 'notes', '2017-09-03T09:27:57Z'),
(20, 1, 1, 20, 'notes', '2017-09-03T09:27:57Z'),
(21, 1, 1, 21, 'notes', '2017-09-03T09:27:57Z'),
(22, 1, 1, 22, 'notes', '2017-09-03T09:27:57Z'),
(23, 1, 1, 23, 'notes', '2017-09-03T09:27:57Z'),
(24, 1, 1, 24, 'notes', '2017-09-03T09:27:57Z'),
(25, 1, 1, 25, 'notes', '2017-09-03T09:27:57Z'),
(26, 1, 1, 26, 'notes', '2017-09-03T09:27:57Z'),
(27, 1, 1, 27, 'notes', '2017-09-03T09:27:57Z'),
(28, 1, 1, 28, 'notes', '2017-09-03T09:27:57Z'),
(29, 1, 1, 29, 'notes', '2017-09-03T09:27:57Z'),
(30, 1, 1, 30, 'notes', '2017-09-03T09:27:57Z'),
(31, 1, 1, 31, 'notes', '2017-09-03T09:27:57Z'),
(32, 1, 1, 32, 'notes', '2017-09-03T09:27:57Z'),
(33, 1, 1, 33, 'notes', '2017-09-03T09:27:57Z'),
(34, 1, 1, 34, 'notes', '2017-09-03T09:27:57Z'),
(35, 1, 1, 35, 'notes', '2017-09-03T09:27:57Z'),
(36, 1, 1, 36, 'notes', '2017-09-03T09:27:57Z'),
(37, 1, 1, 37, 'notes', '2017-09-03T09:27:57Z'),
(38, 1, 1, 38, 'notes', '2017-09-03T09:27:57Z'),
(39, 1, 1, 39, 'notes', '2017-09-03T09:27:57Z'),
(40, 1, 1, 40, 'notes', '2017-09-03T09:27:57Z'),
(41, 1, 1, 41, 'notes', '2017-09-03T09:27:57Z'),
(42, 1, 1, 42, 'notes', '2017-09-03T09:27:57Z'),
(43, 1, 1, 43, 'notes', '2017-09-03T09:27:57Z'),
(44, 1, 1, 44, 'notes', '2017-09-03T09:27:57Z'),
(45, 1, 1, 45, 'notes', '2017-09-03T09:27:57Z'),
(46, 1, 1, 46, 'notes', '2017-09-03T09:27:57Z'),
(47, 1, 1, 47, 'notes', '2017-09-03T09:27:57Z'),
(48, 1, 1, 48, 'notes', '2017-09-03T09:27:57Z'),
(49, 1, 1, 49, 'notes', '2017-09-03T09:27:57Z'),
(50, 1, 1, 50, 'notes', '2017-09-03T09:27:57Z'),
(51, 1, 1, 51, 'notes', '2017-09-03T09:27:57Z'),
(52, 1, 1, 52, 'notes', '2017-09-03T09:27:57Z'),
(53, 1, 1, 53, 'notes', '2017-09-03T09:27:57Z'),
(54, 1, 1, 54, 'notes', '2017-09-03T09:27:57Z'),
(55, 1, 1, 55, 'notes', '2017-09-03T09:27:57Z'),
(56, 1, 1, 56, 'notes', '2017-09-03T09:27:57Z'),
(57, 1, 1, 57, 'notes', '2017-09-03T09:27:57Z'),
(58, 1, 1, 58, 'notes', '2017-09-03T09:27:57Z'),
(59, 1, 1, 59, 'notes', '2017-09-03T09:27:57Z'),
(60, 1, 1, 60, 'notes', '2017-09-03T09:27:57Z'),
(61, 1, 1, 61, 'notes', '2017-09-03T09:27:57Z'),
(62, 1, 1, 62, 'notes', '2017-09-03T09:27:57Z'),
(63, 1, 1, 63, 'notes', '2017-09-03T09:27:57Z'),
(64, 1, 1, 64, 'notes', '2017-09-03T09:27:57Z'),
(65, 1, 1, 65, 'notes', '2017-09-03T09:27:57Z'),
(66, 1, 1, 66, 'notes', '2017-09-03T09:27:57Z'),
(67, 1, 1, 67, 'notes', '2017-09-03T09:27:57Z'),
(68, 1, 1, 68, 'notes', '2017-09-03T09:27:57Z'),
(69, 1, 1, 69, 'notes', '2017-09-03T09:27:57Z'),
(70, 1, 1, 70, 'notes', '2017-09-03T09:27:57Z'),
(71, 1, 1, 71, 'notes', '2017-09-03T09:27:57Z'),
(72, 1, 1, 72, 'notes', '2017-09-03T09:27:57Z'),
(73, 1, 1, 73, 'notes', '2017-09-03T09:27:57Z'),
(74, 1, 1, 74, 'notes', '2017-09-03T09:27:57Z'),
(75, 1, 1, 75, 'notes', '2017-09-03T09:27:57Z'),
(76, 1, 1, 76, 'notes', '2017-09-03T09:27:57Z'),
(77, 1, 1, 77, 'notes', '2017-09-03T09:27:57Z'),
(78, 1, 1, 78, 'notes', '2017-09-03T09:27:57Z'),
(79, 1, 1, 79, 'notes', '2017-09-03T09:27:57Z'),
(80, 1, 1, 80, 'notes', '2017-09-03T09:27:57Z'),
(81, 1, 1, 81, 'notes', '2017-09-03T09:27:57Z'),
(82, 1, 1, 82, 'notes', '2017-09-03T09:27:57Z'),
(83, 1, 1, 83, 'notes', '2017-09-03T09:27:57Z'),
(84, 1, 1, 84, 'notes', '2017-09-03T09:27:57Z'),
(85, 1, 1, 85, 'notes', '2017-09-03T09:27:57Z'),
(86, 1, 1, 86, 'notes', '2017-09-03T09:27:57Z'),
(87, 1, 1, 87, 'notes', '2017-09-03T09:27:57Z'),
(88, 1, 1, 88, 'notes', '2017-09-03T09:27:57Z'),
(89, 1, 1, 89, 'notes', '2017-09-03T09:27:57Z'),
(90, 1, 1, 90, 'notes', '2017-09-03T09:27:57Z'),
(91, 1, 1, 91, 'notes', '2017-09-03T09:27:57Z'),
(92, 1, 1, 92, 'notes', '2017-09-03T09:27:57Z'),
(93, 1, 1, 93, 'notes', '2017-09-03T09:27:57Z'),
(94, 1, 1, 94, 'notes', '2017-09-03T09:27:57Z'),
(95, 1, 1, 95, 'notes', '2017-09-03T09:27:57Z'),
(96, 2, 1, 96, 'notes', '2017-09-03T09:27:57Z'),
(97, 1, 1, 97, 'notes', '2017-09-03T09:27:57Z'),
(98, 1, 1, 98, 'notes', '2017-09-03T09:27:57Z'),
(99, 1, 1, 99, 'notes', '2017-09-03T09:27:57Z'),
(100, 1, 1, 100, 'notes', '2017-09-03T09:27:57Z'),
(101, 1, 1, 101, 'notes', '2017-09-03T09:27:57Z'),
(102, 1, 1, 102, 'notes', '2017-09-03T09:27:57Z'),
(103, 1, 1, 103, 'notes', '2017-09-03T09:27:57Z'),
(104, 1, 1, 104, 'notes', '2017-09-03T09:27:57Z'),
(105, 1, 1, 105, 'notes', '2017-09-03T09:27:57Z'),
(106, 1, 1, 106, 'notes', '2017-09-03T09:27:57Z'),
(107, 1, 1, 107, 'notes', '2017-09-03T09:27:57Z'),
(108, 1, 1, 108, 'notes', '2017-09-03T09:27:57Z'),
(109, 1, 1, 109, 'notes', '2017-09-03T09:27:57Z'),
(110, 1, 1, 110, 'notes', '2017-09-03T09:27:57Z'),
(111, 1, 1, 111, 'notes', '2017-09-03T09:27:57Z'),
(112, 1, 1, 112, 'notes', '2017-09-03T09:27:57Z'),
(113, 1, 1, 113, 'notes', '2017-09-03T09:27:57Z'),
(114, 1, 1, 114, 'notes', '2017-09-03T09:27:57Z'),
(115, 1, 1, 115, 'notes', '2017-09-03T09:27:57Z'),
(116, 1, 1, 116, 'notes', '2017-09-03T09:27:57Z'),
(117, 1, 1, 117, 'notes', '2017-09-03T09:27:57Z'),
(118, 1, 1, 118, 'notes', '2017-09-03T09:27:57Z'),
(119, 1, 1, 119, 'notes', '2017-09-03T09:27:57Z'),
(120, 1, 1, 120, 'notes', '2017-09-03T09:27:57Z'),
(121, 1, 1, 121, 'notes', '2017-09-03T09:27:57Z'),
(122, 1, 1, 122, 'notes', '2017-09-03T09:27:57Z'),
(123, 1, 1, 123, 'notes', '2017-09-03T09:27:57Z'),
(124, 1, 1, 124, 'notes', '2017-09-03T09:27:57Z'),
(125, 1, 1, 125, 'notes', '2017-09-03T09:27:57Z'),
(126, 1, 1, 126, 'notes', '2017-09-03T09:27:57Z'),
(127, 1, 1, 127, 'notes', '2017-09-03T09:27:57Z'),
(128, 1, 1, 128, 'notes', '2017-09-03T09:27:57Z'),
(129, 1, 1, 129, 'notes', '2017-09-03T09:27:57Z'),
(130, 1, 1, 130, 'notes', '2017-09-03T09:27:57Z'),
(131, 1, 1, 131, 'notes', '2017-09-03T09:27:57Z'),
(132, 1, 1, 132, 'notes', '2017-09-03T09:27:57Z'),
(133, 1, 1, 133, 'notes', '2017-09-03T09:27:57Z'),
(134, 1, 1, 134, 'notes', '2017-09-03T09:27:57Z'),
(135, 1, 1, 135, 'notes', '2017-09-03T09:27:57Z'),
(136, 1, 1, 136, 'notes', '2017-09-03T09:27:57Z'),
(137, 1, 1, 137, 'notes', '2017-09-03T09:27:57Z'),
(138, 1, 1, 138, 'notes', '2017-09-03T09:27:57Z'),
(139, 1, 1, 139, 'notes', '2017-09-03T09:27:57Z'),
(140, 1, 1, 140, 'notes', '2017-09-03T09:27:57Z'),
(141, 1, 1, 141, 'notes', '2017-09-03T09:27:57Z'),
(142, 1, 1, 142, 'notes', '2017-09-03T09:27:57Z'),
(143, 1, 1, 143, 'notes', '2017-09-03T09:27:57Z'),
(144, 1, 1, 144, 'notes', '2017-09-03T09:27:57Z'),
(145, 1, 1, 145, 'notes', '2017-09-03T09:27:57Z'),
(146, 1, 1, 146, 'notes', '2017-09-03T09:27:57Z'),
(147, 1, 1, 147, 'notes', '2017-09-03T09:27:57Z'),
(148, 1, 1, 148, 'notes', '2017-09-03T09:27:57Z'),
(149, 1, 1, 149, 'notes', '2017-09-03T09:27:57Z'),
(150, 1, 1, 150, 'notes', '2017-09-03T09:27:57Z'),
(151, 1, 1, 151, 'notes', '2017-09-03T09:27:57Z'),
(152, 1, 1, 152, 'notes', '2017-09-03T09:27:57Z'),
(153, 1, 1, 153, 'notes', '2017-09-03T09:27:57Z'),
(154, 2, 1, 154, 'notes', '2017-09-03T09:27:57Z'),
(155, 1, 1, 155, 'notes', '2017-09-03T09:27:57Z'),
(156, 1, 1, 156, 'notes', '2017-09-03T09:27:57Z'),
(157, 1, 1, 157, 'notes', '2017-09-03T09:27:57Z'),
(158, 1, 1, 158, 'notes', '2017-09-03T09:27:57Z'),
(159, 1, 1, 159, 'notes', '2017-09-03T09:27:57Z'),
(160, 1, 1, 160, 'notes', '2017-09-03T09:27:57Z'),
(161, 1, 1, 161, 'notes', '2017-09-03T09:27:57Z'),
(162, 1, 1, 162, 'notes', '2017-09-03T09:27:57Z'),
(163, 1, 1, 163, 'notes', '2017-09-03T09:27:57Z'),
(164, 1, 1, 164, 'notes', '2017-09-03T09:27:57Z'),
(165, 1, 1, 165, 'notes', '2017-09-03T09:27:57Z'),
(166, 1, 1, 166, 'notes', '2017-09-03T09:27:57Z'),
(167, 1, 1, 167, 'notes', '2017-09-03T09:27:57Z'),
(168, 1, 1, 168, 'notes', '2017-09-03T09:27:57Z'),
(169, 1, 1, 169, 'notes', '2017-09-03T09:27:57Z'),
(170, 1, 1, 170, 'notes', '2017-09-03T09:27:57Z'),
(171, 1, 1, 171, 'notes', '2017-09-03T09:27:57Z'),
(172, 1, 1, 172, 'notes', '2017-09-03T09:27:57Z'),
(173, 1, 1, 173, 'notes', '2017-09-03T09:27:57Z'),
(174, 1, 1, 174, 'notes', '2017-09-03T09:27:57Z'),
(175, 1, 1, 175, 'notes', '2017-09-03T09:27:57Z'),
(176, 1, 1, 176, 'notes', '2017-09-03T09:27:57Z'),
(177, 1, 1, 177, 'notes', '2017-09-03T09:27:57Z'),
(178, 1, 1, 178, 'notes', '2017-09-03T09:27:57Z'),
(179, 1, 1, 179, 'notes', '2017-09-03T09:27:57Z'),
(180, 1, 1, 180, 'notes', '2017-09-03T09:27:57Z'),
(181, 1, 1, 181, 'notes', '2017-09-03T09:27:57Z'),
(182, 1, 1, 182, 'notes', '2017-09-03T09:27:57Z'),
(183, 1, 1, 183, 'notes', '2017-09-03T09:27:57Z'),
(184, 1, 1, 184, 'notes', '2017-09-03T09:27:57Z'),
(185, 1, 1, 185, 'notes', '2017-09-03T09:27:57Z'),
(186, 1, 1, 186, 'notes', '2017-09-03T09:27:57Z'),
(187, 1, 1, 187, 'notes', '2017-09-03T09:27:57Z'),
(188, 1, 1, 188, 'notes', '2017-09-03T09:27:57Z'),
(189, 1, 1, 189, 'notes', '2017-09-03T09:27:57Z'),
(190, 1, 1, 190, 'notes', '2017-09-03T09:27:57Z'),
(191, 1, 1, 191, 'notes', '2017-09-03T09:27:57Z'),
(192, 1, 1, 192, 'notes', '2017-09-03T09:27:57Z'),
(193, 1, 1, 193, 'notes', '2017-09-03T09:27:57Z'),
(194, 1, 1, 194, 'notes', '2017-09-03T09:27:57Z'),
(195, 1, 1, 195, 'notes', '2017-09-03T09:27:57Z'),
(196, 1, 1, 196, 'notes', '2017-09-03T09:27:57Z'),
(197, 1, 1, 197, 'notes', '2017-09-03T09:27:57Z'),
(198, 1, 1, 198, 'notes', '2017-09-03T09:27:57Z'),
(199, 1, 1, 199, 'notes', '2017-09-03T09:27:57Z'),
(200, 1, 1, 200, 'notes', '2017-09-03T09:27:57Z'),
(201, 1, 1, 201, 'notes', '2017-09-03T09:27:57Z'),
(202, 2, 1, 202, 'notes', '2017-09-03T09:27:57Z'),
(203, 1, 1, 203, 'notes', '2017-09-03T09:27:57Z'),
(204, 1, 1, 204, 'notes', '2017-09-03T09:27:57Z'),
(205, 1, 1, 205, 'notes', '2017-09-03T09:27:57Z'),
(206, 1, 1, 206, 'notes', '2017-09-03T09:27:57Z'),
(207, 1, 1, 207, 'notes', '2017-09-03T09:27:57Z'),
(208, 1, 1, 208, 'notes', '2017-09-03T09:27:57Z'),
(209, 1, 1, 209, 'notes', '2017-09-03T09:27:57Z'),
(210, 1, 1, 210, 'notes', '2017-09-03T09:27:57Z'),
(211, 1, 1, 211, 'notes', '2017-09-03T09:27:57Z'),
(212, 1, 1, 212, 'notes', '2017-09-03T09:27:57Z'),
(213, 1, 1, 213, 'notes', '2017-09-03T09:27:57Z'),
(214, 1, 1, 214, 'notes', '2017-09-03T09:27:57Z'),
(215, 1, 1, 215, 'notes', '2017-09-03T09:27:57Z'),
(216, 1, 1, 216, 'notes', '2017-09-03T09:27:57Z'),
(217, 1, 1, 217, 'notes', '2017-09-03T09:27:57Z'),
(218, 1, 1, 218, 'notes', '2017-09-03T09:27:57Z'),
(219, 1, 1, 219, 'notes', '2017-09-03T09:27:57Z'),
(220, 1, 1, 220, 'notes', '2017-09-03T09:27:57Z'),
(221, 1, 1, 221, 'notes', '2017-09-03T09:27:57Z'),
(222, 1, 1, 222, 'notes', '2017-09-03T09:27:57Z'),
(223, 1, 1, 223, 'notes', '2017-09-03T09:27:57Z'),
(224, 1, 1, 224, 'notes', '2017-09-03T09:27:57Z'),
(225, 1, 1, 225, 'notes', '2017-09-03T09:27:57Z'),
(226, 1, 1, 226, 'notes', '2017-09-03T09:27:57Z'),
(227, 1, 1, 227, 'notes', '2017-09-03T09:27:57Z'),
(228, 1, 1, 228, 'notes', '2017-09-03T09:27:57Z'),
(229, 1, 1, 229, 'notes', '2017-09-03T09:27:57Z'),
(230, 1, 1, 230, 'notes', '2017-09-03T09:27:57Z'),
(231, 1, 1, 231, 'notes', '2017-09-03T09:27:57Z'),
(232, 1, 1, 232, 'notes', '2017-09-03T09:27:57Z'),
(233, 1, 1, 233, 'notes', '2017-09-03T09:27:57Z'),
(234, 1, 1, 234, 'notes', '2017-09-03T09:27:57Z'),
(235, 1, 1, 235, 'notes', '2017-09-03T09:27:57Z'),
(236, 1, 1, 236, 'notes', '2017-09-03T09:27:57Z'),
(237, 1, 1, 237, 'notes', '2017-09-03T09:27:57Z'),
(238, 1, 1, 238, 'notes', '2017-09-03T09:27:57Z'),
(239, 1, 1, 239, 'notes', '2017-09-03T09:27:57Z'),
(240, 1, 1, 240, 'notes', '2017-09-03T09:27:57Z'),
(241, 1, 1, 241, 'notes', '2017-09-03T09:27:57Z'),
(242, 2, 1, 242, 'notes', '2017-09-03T09:27:57Z'),
(243, 1, 1, 243, 'notes', '2017-09-03T09:27:57Z'),
(244, 1, 1, 244, 'notes', '2017-09-03T09:27:57Z'),
(245, 1, 1, 245, 'notes', '2017-09-03T09:27:57Z'),
(246, 1, 1, 246, 'notes', '2017-09-03T09:27:57Z'),
(247, 1, 1, 247, 'notes', '2017-09-03T09:27:57Z'),
(248, 1, 1, 248, 'notes', '2017-09-03T09:27:57Z'),
(249, 1, 1, 249, 'notes', '2017-09-03T09:27:57Z'),
(250, 1, 1, 250, 'notes', '2017-09-03T09:27:57Z'),
(251, 1, 1, 251, 'notes', '2017-09-03T09:27:57Z'),
(252, 1, 1, 252, 'notes', '2017-09-03T09:27:57Z'),
(253, 1, 1, 253, 'notes', '2017-09-03T09:27:57Z'),
(254, 1, 1, 254, 'notes', '2017-09-03T09:27:57Z'),
(255, 1, 1, 255, 'notes', '2017-09-03T09:27:57Z'),
(256, 1, 1, 256, 'notes', '2017-09-03T09:27:57Z'),
(257, 1, 1, 257, 'notes', '2017-09-03T09:27:57Z'),
(258, 1, 1, 258, 'notes', '2017-09-03T09:27:57Z'),
(259, 1, 1, 259, 'notes', '2017-09-03T09:27:57Z'),
(260, 1, 1, 260, 'notes', '2017-09-03T09:27:57Z'),
(261, 1, 1, 261, 'notes', '2017-09-03T09:27:57Z'),
(262, 1, 1, 262, 'notes', '2017-09-03T09:27:57Z'),
(263, 1, 1, 263, 'notes', '2017-09-03T09:27:57Z'),
(264, 1, 1, 264, 'notes', '2017-09-03T09:27:57Z'),
(265, 1, 1, 265, 'notes', '2017-09-03T09:27:57Z'),
(266, 1, 1, 266, 'notes', '2017-09-03T09:27:57Z'),
(267, 1, 1, 267, 'notes', '2017-09-03T09:27:57Z'),
(268, 1, 1, 268, 'notes', '2017-09-03T09:27:57Z'),
(269, 1, 1, 269, 'notes', '2017-09-03T09:27:57Z'),
(270, 1, 1, 270, 'notes', '2017-09-03T09:27:57Z'),
(271, 1, 1, 271, 'notes', '2017-09-03T09:27:57Z'),
(272, 1, 1, 272, 'notes', '2017-09-03T09:27:57Z'),
(273, 1, 1, 273, 'notes', '2017-09-03T09:27:57Z'),
(274, 1, 1, 274, 'notes', '2017-09-03T09:27:57Z'),
(275, 1, 1, 275, 'notes', '2017-09-03T09:27:57Z'),
(276, 1, 1, 276, 'notes', '2017-09-03T09:27:57Z'),
(277, 1, 1, 277, 'notes', '2017-09-03T09:27:57Z'),
(278, 1, 1, 278, 'notes', '2017-09-03T09:27:57Z'),
(279, 1, 1, 279, 'notes', '2017-09-03T09:27:57Z'),
(280, 1, 1, 280, 'notes', '2017-09-03T09:27:57Z'),
(281, 1, 1, 281, 'notes', '2017-09-03T09:27:57Z'),
(282, 1, 1, 282, 'notes', '2017-09-03T09:27:57Z'),
(283, 1, 1, 283, 'notes', '2017-09-03T09:27:57Z'),
(284, 1, 1, 284, 'notes', '2017-09-03T09:27:57Z'),
(285, 1, 1, 285, 'notes', '2017-09-03T09:27:57Z'),
(286, 1, 1, 286, 'notes', '2017-09-03T09:27:57Z'),
(287, 1, 1, 287, 'notes', '2017-09-03T09:27:57Z'),
(288, 1, 1, 288, 'notes', '2017-09-03T09:27:57Z'),
(289, 1, 1, 289, 'notes', '2017-09-03T09:27:57Z'),
(290, 1, 1, 290, 'notes', '2017-09-03T09:27:57Z'),
(291, 1, 1, 291, 'notes', '2017-09-03T09:27:57Z'),
(292, 1, 1, 292, 'notes', '2017-09-03T09:27:57Z'),
(293, 1, 1, 293, 'notes', '2017-09-03T09:27:57Z'),
(294, 1, 1, 294, 'notes', '2017-09-03T09:27:57Z'),
(295, 1, 1, 295, 'notes', '2017-09-03T09:27:57Z'),
(296, 1, 1, 296, 'notes', '2017-09-03T09:27:57Z'),
(297, 1, 1, 297, 'notes', '2017-09-03T09:27:57Z'),
(298, 1, 1, 298, 'notes', '2017-09-03T09:27:57Z'),
(299, 1, 1, 299, 'notes', '2017-09-03T09:27:57Z'),
(300, 1, 1, 300, 'notes', '2017-09-03T09:27:57Z'),
(301, 1, 1, 301, 'notes', '2017-09-03T09:27:57Z'),
(302, 1, 1, 302, 'notes', '2017-09-03T09:27:57Z'),
(303, 1, 1, 303, 'notes', '2017-09-03T09:27:57Z'),
(304, 1, 1, 304, 'notes', '2017-09-03T09:27:57Z'),
(305, 1, 1, 305, 'notes', '2017-09-03T09:27:57Z'),
(306, 1, 1, 306, 'notes', '2017-09-03T09:27:57Z'),
(307, 1, 1, 307, 'notes', '2017-09-03T09:27:57Z'),
(308, 1, 1, 308, 'notes', '2017-09-03T09:27:57Z'),
(309, 1, 1, 309, 'notes', '2017-09-03T09:27:57Z'),
(310, 1, 1, 310, 'notes', '2017-09-03T09:27:57Z'),
(311, 1, 1, 311, 'notes', '2017-09-03T09:27:57Z'),
(312, 1, 1, 312, 'notes', '2017-09-03T09:27:57Z'),
(313, 1, 1, 313, 'notes', '2017-09-03T09:27:57Z'),
(314, 1, 1, 314, 'notes', '2017-09-03T09:27:57Z'),
(315, 1, 1, 315, 'notes', '2017-09-03T09:27:57Z'),
(316, 1, 1, 316, 'notes', '2017-09-03T09:27:57Z'),
(317, 1, 1, 317, 'notes', '2017-09-03T09:27:57Z'),
(318, 1, 1, 318, 'notes', '2017-09-03T09:27:57Z'),
(319, 1, 1, 319, 'notes', '2017-09-03T09:27:57Z'),
(320, 1, 1, 320, 'notes', '2017-09-03T09:27:57Z'),
(321, 1, 1, 321, 'notes', '2017-09-03T09:27:57Z'),
(322, 1, 1, 322, 'notes', '2017-09-03T09:27:57Z'),
(323, 1, 1, 323, 'notes', '2017-09-03T09:27:57Z'),
(324, 1, 1, 324, 'notes', '2017-09-03T09:27:57Z'),
(325, 1, 1, 325, 'notes', '2017-09-03T09:27:57Z'),
(326, 1, 1, 326, 'notes', '2017-09-03T09:27:57Z'),
(327, 1, 1, 327, 'notes', '2017-09-03T09:27:57Z'),
(328, 1, 1, 328, 'notes', '2017-09-03T09:27:57Z'),
(329, 1, 1, 329, 'notes', '2017-09-03T09:27:57Z'),
(330, 1, 1, 330, 'notes', '2017-09-03T09:27:57Z'),
(331, 1, 1, 331, 'notes', '2017-09-03T09:27:57Z'),
(332, 1, 1, 332, 'notes', '2017-09-03T09:27:57Z'),
(333, 1, 1, 333, 'notes', '2017-09-03T09:27:57Z'),
(334, 1, 1, 334, 'notes', '2017-09-03T09:27:57Z'),
(335, 1, 1, 335, 'notes', '2017-09-03T09:27:57Z'),
(336, 1, 1, 336, 'notes', '2017-09-03T09:27:57Z'),
(337, 1, 1, 337, 'notes', '2017-09-03T09:27:57Z'),
(338, 1, 1, 338, 'notes', '2017-09-03T09:27:57Z'),
(339, 1, 1, 339, 'notes', '2017-09-03T09:27:57Z'),
(340, 1, 1, 340, 'notes', '2017-09-03T09:27:57Z'),
(341, 1, 1, 341, 'notes', '2017-09-03T09:27:57Z'),
(342, 1, 1, 342, 'notes', '2017-09-03T09:27:57Z'),
(343, 1, 1, 343, 'notes', '2017-09-03T09:27:57Z'),
(344, 1, 1, 344, 'notes', '2017-09-03T09:27:57Z'),
(345, 1, 1, 345, 'notes', '2017-09-03T09:27:57Z'),
(346, 1, 1, 346, 'notes', '2017-09-03T09:27:57Z'),
(347, 1, 1, 347, 'notes', '2017-09-03T09:27:57Z'),
(348, 1, 1, 348, 'notes', '2017-09-03T09:27:57Z'),
(349, 1, 1, 349, 'notes', '2017-09-03T09:27:57Z'),
(350, 1, 1, 350, 'notes', '2017-09-03T09:27:57Z'),
(351, 1, 1, 351, 'notes', '2017-09-03T09:27:57Z'),
(352, 1, 1, 352, 'notes', '2017-09-03T09:27:57Z'),
(353, 1, 1, 353, 'notes', '2017-09-03T09:27:57Z'),
(354, 1, 1, 354, 'notes', '2017-09-03T09:27:57Z'),
(355, 1, 1, 355, 'notes', '2017-09-03T09:27:57Z'),
(356, 1, 1, 356, 'notes', '2017-09-03T09:27:57Z'),
(357, 1, 1, 357, 'notes', '2017-09-03T09:27:57Z'),
(358, 1, 1, 358, 'notes', '2017-09-03T09:27:57Z'),
(359, 1, 1, 359, 'notes', '2017-09-03T09:27:57Z'),
(360, 1, 1, 360, 'notes', '2017-09-03T09:27:57Z'),
(361, 1, 1, 361, 'notes', '2017-09-03T09:27:57Z'),
(362, 1, 1, 362, 'notes', '2017-09-03T09:27:57Z'),
(363, 1, 1, 363, 'notes', '2017-09-03T09:27:57Z'),
(364, 1, 1, 364, 'notes', '2017-09-03T09:27:57Z'),
(365, 1, 1, 365, 'notes', '2017-09-03T09:27:57Z'),
(366, 1, 1, 366, 'notes', '2017-09-03T09:27:57Z'),
(367, 1, 1, 367, 'notes', '2017-09-03T09:27:57Z'),
(368, 1, 1, 368, 'notes', '2017-09-03T09:27:57Z'),
(369, 1, 1, 369, 'notes', '2017-09-03T09:27:57Z'),
(370, 1, 1, 370, 'notes', '2017-09-03T09:27:57Z'),
(371, 1, 1, 371, 'notes', '2017-09-03T09:27:57Z'),
(372, 1, 1, 372, 'notes', '2017-09-03T09:27:57Z'),
(373, 1, 1, 373, 'notes', '2017-09-03T09:27:57Z'),
(374, 1, 1, 374, 'notes', '2017-09-03T09:27:57Z'),
(375, 1, 1, 375, 'notes', '2017-09-03T09:27:57Z'),
(376, 1, 1, 376, 'notes', '2017-09-03T09:27:57Z'),
(377, 1, 1, 377, 'notes', '2017-09-03T09:27:57Z'),
(378, 1, 1, 378, 'notes', '2017-09-03T09:27:57Z'),
(379, 1, 1, 379, 'notes', '2017-09-03T09:27:57Z'),
(380, 1, 1, 380, 'notes', '2017-09-03T09:27:57Z'),
(381, 1, 1, 381, 'notes', '2017-09-03T09:27:57Z'),
(382, 1, 1, 382, 'notes', '2017-09-03T09:27:57Z'),
(383, 1, 1, 383, 'notes', '2017-09-03T09:27:57Z'),
(384, 1, 1, 384, 'notes', '2017-09-03T09:27:57Z'),
(385, 1, 1, 385, 'notes', '2017-09-03T09:27:57Z'),
(386, 1, 1, 386, 'notes', '2017-09-03T09:27:57Z'),
(387, 1, 1, 387, 'notes', '2017-09-03T09:27:57Z'),
(388, 1, 1, 388, 'notes', '2017-09-03T09:27:57Z'),
(389, 1, 1, 389, 'notes', '2017-09-03T09:27:57Z'),
(390, 1, 1, 390, 'notes', '2017-09-03T09:27:57Z'),
(391, 1, 1, 391, 'notes', '2017-09-03T09:27:57Z'),
(392, 1, 1, 392, 'notes', '2017-09-03T09:27:57Z'),
(393, 1, 1, 393, 'notes', '2017-09-03T09:27:57Z'),
(394, 1, 1, 394, 'notes', '2017-09-03T09:27:57Z'),
(395, 1, 1, 395, 'notes', '2017-09-03T09:27:57Z'),
(396, 1, 1, 396, 'notes', '2017-09-03T09:27:57Z'),
(397, 1, 1, 397, 'notes', '2017-09-03T09:27:57Z'),
(398, 1, 1, 398, 'notes', '2017-09-03T09:27:57Z'),
(399, 1, 1, 399, 'notes', '2017-09-03T09:27:57Z'),
(400, 1, 1, 400, 'notes', '2017-09-03T09:27:57Z'),
(401, 1, 1, 401, 'notes', '2017-09-03T09:27:57Z'),
(402, 1, 1, 402, 'notes', '2017-09-03T09:27:57Z'),
(403, 1, 1, 403, 'notes', '2017-09-03T09:27:57Z'),
(404, 1, 1, 404, 'notes', '2017-09-03T09:27:57Z'),
(405, 1, 1, 405, 'notes', '2017-09-03T09:27:57Z'),
(406, 1, 1, 406, 'notes', '2017-09-03T09:27:57Z'),
(407, 1, 1, 407, 'notes', '2017-09-03T09:27:57Z'),
(408, 1, 1, 408, 'notes', '2017-09-03T09:27:57Z'),
(409, 1, 1, 409, 'notes', '2017-09-03T09:27:57Z'),
(410, 1, 1, 410, 'notes', '2017-09-03T09:27:57Z'),
(411, 1, 1, 411, 'notes', '2017-09-03T09:27:57Z'),
(412, 1, 1, 412, 'notes', '2017-09-03T09:27:57Z'),
(413, 1, 1, 413, 'notes', '2017-09-03T09:27:57Z'),
(414, 1, 1, 414, 'notes', '2017-09-03T09:27:57Z'),
(415, 1, 1, 415, 'notes', '2017-09-03T09:27:57Z'),
(416, 1, 1, 416, 'notes', '2017-09-03T09:27:57Z'),
(417, 1, 1, 417, 'notes', '2017-09-03T09:27:57Z'),
(418, 1, 1, 418, 'notes', '2017-09-03T09:27:57Z'),
(419, 1, 1, 419, 'notes', '2017-09-03T09:27:57Z'),
(420, 1, 1, 420, 'notes', '2017-09-03T09:27:57Z'),
(421, 1, 1, 421, 'notes', '2017-09-03T09:27:57Z'),
(422, 1, 1, 422, 'notes', '2017-09-03T09:27:57Z'),
(423, 1, 1, 423, 'notes', '2017-09-03T09:27:57Z'),
(424, 1, 1, 424, 'notes', '2017-09-03T09:27:57Z'),
(425, 1, 1, 425, 'notes', '2017-09-03T09:27:57Z'),
(426, 1, 1, 426, 'notes', '2017-09-03T09:27:57Z'),
(427, 1, 1, 427, 'notes', '2017-09-03T09:27:57Z'),
(428, 1, 1, 428, 'notes', '2017-09-03T09:27:57Z'),
(429, 1, 1, 429, 'notes', '2017-09-03T09:27:57Z'),
(430, 1, 1, 430, 'notes', '2017-09-03T09:27:57Z'),
(431, 1, 1, 431, 'notes', '2017-09-03T09:27:57Z'),
(432, 1, 1, 432, 'notes', '2017-09-03T09:27:57Z'),
(433, 1, 1, 433, 'notes', '2017-09-03T09:27:57Z'),
(434, 1, 1, 434, 'notes', '2017-09-03T09:27:57Z'),
(435, 1, 1, 435, 'notes', '2017-09-03T09:27:57Z'),
(436, 1, 1, 436, 'notes', '2017-09-03T09:27:57Z'),
(437, 1, 1, 437, 'notes', '2017-09-03T09:27:57Z'),
(438, 1, 1, 438, 'notes', '2017-09-03T09:27:57Z'),
(439, 1, 1, 439, 'notes', '2017-09-03T09:27:57Z'),
(440, 1, 1, 440, 'notes', '2017-09-03T09:27:57Z'),
(441, 1, 1, 441, 'notes', '2017-09-03T09:27:57Z'),
(442, 1, 1, 442, 'notes', '2017-09-03T09:27:57Z'),
(443, 1, 1, 443, 'notes', '2017-09-03T09:27:57Z'),
(444, 1, 1, 444, 'notes', '2017-09-03T09:27:57Z'),
(445, 1, 1, 445, 'notes', '2017-09-03T09:27:57Z'),
(446, 1, 1, 446, 'notes', '2017-09-03T09:27:57Z'),
(447, 1, 1, 447, 'notes', '2017-09-03T09:27:57Z'),
(448, 1, 1, 448, 'notes', '2017-09-03T09:27:57Z'),
(449, 1, 1, 449, 'notes', '2017-09-03T09:27:57Z'),
(450, 1, 1, 450, 'notes', '2017-09-03T09:27:57Z'),
(451, 1, 1, 451, 'notes', '2017-09-03T09:27:57Z'),
(452, 1, 1, 452, 'notes', '2017-09-03T09:27:57Z'),
(453, 1, 1, 453, 'notes', '2017-09-03T09:27:57Z'),
(454, 1, 1, 454, 'notes', '2017-09-03T09:27:57Z'),
(455, 1, 1, 455, 'notes', '2017-09-03T09:27:57Z'),
(456, 1, 1, 456, 'notes', '2017-09-03T09:27:57Z'),
(457, 1, 1, 457, 'notes', '2017-09-03T09:27:57Z'),
(458, 1, 1, 458, 'notes', '2017-09-03T09:27:57Z'),
(459, 1, 1, 459, 'notes', '2017-09-03T09:27:57Z'),
(460, 1, 1, 460, 'notes', '2017-09-03T09:27:57Z'),
(461, 1, 1, 461, 'notes', '2017-09-03T09:27:57Z'),
(462, 1, 1, 462, 'notes', '2017-09-03T09:27:57Z'),
(463, 1, 1, 463, 'notes', '2017-09-03T09:27:57Z'),
(464, 1, 1, 464, 'notes', '2017-09-03T09:27:57Z'),
(465, 1, 1, 465, 'notes', '2017-09-03T09:27:57Z'),
(466, 1, 1, 466, 'notes', '2017-09-03T09:27:57Z'),
(467, 1, 1, 467, 'notes', '2017-09-03T09:27:57Z'),
(468, 1, 1, 468, 'notes', '2017-09-03T09:27:57Z'),
(469, 1, 1, 469, 'notes', '2017-09-03T09:27:57Z'),
(470, 1, 1, 470, 'notes', '2017-09-03T09:27:57Z'),
(471, 1, 1, 471, 'notes', '2017-09-03T09:27:57Z'),
(472, 1, 1, 472, 'notes', '2017-09-03T09:27:57Z'),
(473, 1, 1, 473, 'notes', '2017-09-03T09:27:57Z'),
(474, 1, 1, 474, 'notes', '2017-09-03T09:27:57Z'),
(475, 1, 1, 475, 'notes', '2017-09-03T09:27:57Z'),
(476, 1, 1, 476, 'notes', '2017-09-03T09:27:57Z'),
(477, 1, 1, 477, 'notes', '2017-09-03T09:27:57Z'),
(478, 1, 1, 478, 'notes', '2017-09-03T09:27:57Z'),
(479, 1, 1, 479, 'notes', '2017-09-03T09:27:57Z'),
(480, 1, 1, 480, 'notes', '2017-09-03T09:27:57Z'),
(481, 1, 1, 481, 'notes', '2017-09-03T09:27:57Z'),
(482, 1, 1, 482, 'notes', '2017-09-03T09:27:57Z'),
(483, 1, 1, 483, 'notes', '2017-09-03T09:27:57Z'),
(484, 1, 1, 484, 'notes', '2017-09-03T09:27:57Z'),
(485, 1, 1, 485, 'notes', '2017-09-03T09:27:57Z'),
(486, 1, 1, 486, 'notes', '2017-09-03T09:27:57Z'),
(487, 1, 1, 487, 'notes', '2017-09-03T09:27:57Z'),
(488, 1, 1, 488, 'notes', '2017-09-03T09:27:57Z'),
(489, 1, 1, 489, 'notes', '2017-09-03T09:27:57Z'),
(490, 1, 1, 490, 'notes', '2017-09-03T09:27:57Z'),
(491, 1, 1, 491, 'notes', '2017-09-03T09:27:57Z'),
(492, 1, 1, 492, 'notes', '2017-09-03T09:27:57Z'),
(493, 1, 1, 493, 'notes', '2017-09-03T09:27:57Z'),
(494, 1, 1, 494, 'notes', '2017-09-03T09:27:57Z'),
(495, 1, 1, 495, 'notes', '2017-09-03T09:27:57Z'),
(496, 1, 1, 496, 'notes', '2017-09-03T09:27:57Z'),
(497, 1, 1, 497, 'notes', '2017-09-03T09:27:57Z'),
(498, 1, 1, 498, 'notes', '2017-09-03T09:27:57Z'),
(499, 2, 1, 499, 'notes', '2017-09-03T09:27:57Z'),
(500, 1, 1, 500, 'notes', '2017-09-03T09:27:57Z'),
(501, 1, 1, 501, 'notes', '2017-09-03T09:27:57Z'),
(502, 1, 1, 502, 'notes', '2017-09-03T09:27:57Z'),
(503, 1, 1, 503, 'notes', '2017-09-03T09:27:57Z'),
(504, 1, 1, 504, 'notes', '2017-09-03T09:27:57Z'),
(505, 1, 1, 505, 'notes', '2017-09-03T09:27:57Z'),
(506, 1, 1, 506, 'notes', '2017-09-03T09:27:57Z'),
(507, 1, 1, 507, 'notes', '2017-09-03T09:27:57Z'),
(508, 1, 1, 508, 'notes', '2017-09-03T09:27:57Z'),
(509, 1, 1, 509, 'notes', '2017-09-03T09:27:57Z'),
(510, 1, 1, 510, 'notes', '2017-09-03T09:27:57Z'),
(511, 1, 1, 511, 'notes', '2017-09-03T09:27:57Z'),
(512, 1, 1, 512, 'notes', '2017-09-03T09:27:57Z'),
(513, 1, 1, 513, 'notes', '2017-09-03T09:27:57Z'),
(514, 1, 1, 514, 'notes', '2017-09-03T09:27:57Z'),
(515, 1, 1, 515, 'notes', '2017-09-03T09:27:57Z'),
(516, 1, 1, 516, 'notes', '2017-09-03T09:27:57Z'),
(517, 1, 1, 517, 'notes', '2017-09-03T09:27:57Z'),
(518, 1, 1, 518, 'notes', '2017-09-03T09:27:57Z'),
(519, 1, 1, 519, 'notes', '2017-09-03T09:27:57Z'),
(520, 1, 1, 520, 'notes', '2017-09-03T09:27:57Z'),
(521, 1, 1, 521, 'notes', '2017-09-03T09:27:57Z'),
(522, 1, 1, 522, 'notes', '2017-09-03T09:27:57Z'),
(523, 1, 1, 523, 'notes', '2017-09-03T09:27:57Z'),
(524, 1, 1, 524, 'notes', '2017-09-03T09:27:57Z'),
(525, 1, 1, 525, 'notes', '2017-09-03T09:27:57Z'),
(526, 1, 1, 526, 'notes', '2017-09-03T09:27:57Z'),
(527, 1, 1, 527, 'notes', '2017-09-03T09:27:57Z'),
(528, 1, 1, 528, 'notes', '2017-09-03T09:27:57Z'),
(529, 1, 1, 529, 'notes', '2017-09-03T09:27:57Z'),
(530, 1, 1, 530, 'notes', '2017-09-03T09:27:57Z'),
(531, 1, 1, 531, 'notes', '2017-09-03T09:27:57Z'),
(532, 1, 1, 532, 'notes', '2017-09-03T09:27:57Z'),
(533, 1, 1, 533, 'notes', '2017-09-03T09:27:57Z'),
(534, 1, 1, 534, 'notes', '2017-09-03T09:27:57Z'),
(535, 1, 1, 535, 'notes', '2017-09-03T09:27:57Z'),
(536, 1, 1, 536, 'notes', '2017-09-03T09:27:57Z'),
(537, 1, 1, 537, 'notes', '2017-09-03T09:27:57Z'),
(538, 1, 1, 538, 'notes', '2017-09-03T09:27:57Z'),
(539, 1, 1, 539, 'notes', '2017-09-03T09:27:57Z'),
(540, 1, 1, 540, 'notes', '2017-09-03T09:27:57Z'),
(541, 1, 1, 541, 'notes', '2017-09-03T09:27:57Z'),
(542, 1, 1, 542, 'notes', '2017-09-03T09:27:57Z'),
(543, 1, 1, 543, 'notes', '2017-09-03T09:27:57Z'),
(544, 1, 1, 544, 'notes', '2017-09-03T09:27:57Z'),
(545, 1, 1, 545, 'notes', '2017-09-03T09:27:57Z'),
(546, 1, 1, 546, 'notes', '2017-09-03T09:27:57Z'),
(547, 1, 1, 547, 'notes', '2017-09-03T09:27:57Z'),
(548, 1, 1, 548, 'notes', '2017-09-03T09:27:57Z'),
(549, 1, 1, 549, 'notes', '2017-09-03T09:27:57Z'),
(550, 1, 1, 550, 'notes', '2017-09-03T09:27:57Z'),
(551, 1, 1, 551, 'notes', '2017-09-03T09:27:57Z'),
(552, 1, 1, 552, 'notes', '2017-09-03T09:27:57Z'),
(553, 1, 1, 553, 'notes', '2017-09-03T09:27:57Z'),
(554, 1, 1, 554, 'notes', '2017-09-03T09:27:57Z'),
(555, 1, 1, 555, 'notes', '2017-09-03T09:27:57Z'),
(556, 1, 1, 556, 'notes', '2017-09-03T09:27:57Z'),
(557, 1, 1, 557, 'notes', '2017-09-03T09:27:57Z'),
(558, 1, 1, 558, 'notes', '2017-09-03T09:27:57Z'),
(559, 1, 1, 559, 'notes', '2017-09-03T09:27:57Z'),
(560, 1, 1, 560, 'notes', '2017-09-03T09:27:57Z'),
(561, 1, 1, 561, 'notes', '2017-09-03T09:27:57Z'),
(562, 1, 1, 562, 'notes', '2017-09-03T09:27:57Z'),
(563, 1, 1, 563, 'notes', '2017-09-03T09:27:57Z'),
(564, 1, 1, 564, 'notes', '2017-09-03T09:27:57Z'),
(565, 1, 1, 565, 'notes', '2017-09-03T09:27:57Z'),
(566, 1, 1, 566, 'notes', '2017-09-03T09:27:57Z'),
(567, 1, 1, 567, 'notes', '2017-09-03T09:27:57Z'),
(568, 1, 1, 568, 'notes', '2017-09-03T09:27:57Z'),
(569, 1, 1, 569, 'notes', '2017-09-03T09:27:57Z'),
(570, 1, 1, 570, 'notes', '2017-09-03T09:27:57Z'),
(571, 1, 1, 571, 'notes', '2017-09-03T09:27:57Z'),
(572, 1, 1, 572, 'notes', '2017-09-03T09:27:57Z'),
(573, 1, 1, 573, 'notes', '2017-09-03T09:27:57Z'),
(574, 1, 1, 574, 'notes', '2017-09-03T09:27:57Z'),
(575, 1, 1, 575, 'notes', '2017-09-03T09:27:57Z'),
(576, 1, 1, 576, 'notes', '2017-09-03T09:27:57Z'),
(577, 1, 1, 577, 'notes', '2017-09-03T09:27:57Z'),
(578, 1, 1, 578, 'notes', '2017-09-03T09:27:57Z'),
(579, 1, 1, 579, 'notes', '2017-09-03T09:27:57Z'),
(580, 1, 1, 580, 'notes', '2017-09-03T09:27:57Z'),
(581, 1, 1, 581, 'notes', '2017-09-03T09:27:57Z'),
(582, 1, 1, 582, 'notes', '2017-09-03T09:27:57Z'),
(583, 1, 1, 583, 'notes', '2017-09-03T09:27:57Z'),
(584, 1, 1, 584, 'notes', '2017-09-03T09:27:57Z'),
(585, 1, 1, 585, 'notes', '2017-09-03T09:27:57Z'),
(586, 1, 1, 586, 'notes', '2017-09-03T09:27:57Z'),
(587, 1, 1, 587, 'notes', '2017-09-03T09:27:57Z'),
(588, 1, 1, 588, 'notes', '2017-09-03T09:27:57Z'),
(589, 1, 1, 589, 'notes', '2017-09-03T09:27:57Z'),
(590, 1, 1, 590, 'notes', '2017-09-03T09:27:57Z'),
(591, 1, 1, 591, 'notes', '2017-09-03T09:27:57Z'),
(592, 1, 1, 592, 'notes', '2017-09-03T09:27:57Z'),
(593, 1, 1, 593, 'notes', '2017-09-03T09:27:57Z'),
(594, 1, 1, 594, 'notes', '2017-09-03T09:27:57Z'),
(595, 1, 1, 595, 'notes', '2017-09-03T09:27:57Z'),
(596, 1, 1, 596, 'notes', '2017-09-03T09:27:57Z'),
(597, 1, 1, 597, 'notes', '2017-09-03T09:27:57Z'),
(598, 1, 1, 598, 'notes', '2017-09-03T09:27:57Z'),
(599, 1, 1, 599, 'notes', '2017-09-03T09:27:57Z'),
(600, 1, 1, 600, 'notes', '2017-09-03T09:27:57Z'),
(601, 1, 1, 601, 'notes', '2017-09-03T09:27:57Z'),
(602, 1, 1, 602, 'notes', '2017-09-03T09:27:57Z'),
(603, 1, 1, 603, 'notes', '2017-09-03T09:27:57Z'),
(604, 1, 1, 604, 'notes', '2017-09-03T09:27:57Z'),
(605, 2, 1, 605, 'notes', '2017-09-03T09:27:57Z'),
(606, 1, 1, 606, 'notes', '2017-09-03T09:27:57Z'),
(607, 1, 1, 607, 'notes', '2017-09-03T09:27:57Z'),
(608, 1, 1, 608, 'notes', '2017-09-03T09:27:57Z'),
(609, 1, 1, 609, 'notes', '2017-09-03T09:27:57Z'),
(610, 1, 1, 610, 'notes', '2017-09-03T09:27:57Z'),
(611, 1, 1, 611, 'notes', '2017-09-03T09:27:57Z'),
(612, 1, 1, 612, 'notes', '2017-09-03T09:27:57Z'),
(613, 1, 1, 613, 'notes', '2017-09-03T09:27:57Z'),
(614, 1, 1, 614, 'notes', '2017-09-03T09:27:57Z'),
(615, 1, 1, 615, 'notes', '2017-09-03T09:27:57Z'),
(616, 1, 1, 616, 'notes', '2017-09-03T09:27:57Z'),
(617, 1, 1, 617, 'notes', '2017-09-03T09:27:57Z'),
(618, 1, 1, 618, 'notes', '2017-09-03T09:27:57Z'),
(619, 1, 1, 619, 'notes', '2017-09-03T09:27:57Z'),
(620, 1, 1, 620, 'notes', '2017-09-03T09:27:57Z'),
(621, 2, 1, 621, 'notes', '2017-09-03T09:27:57Z'),
(622, 1, 1, 622, 'notes', '2017-09-03T09:27:57Z'),
(623, 1, 1, 623, 'notes', '2017-09-03T09:27:57Z'),
(624, 1, 1, 624, 'notes', '2017-09-03T09:27:57Z'),
(625, 1, 1, 625, 'notes', '2017-09-03T09:27:57Z'),
(626, 1, 1, 626, 'notes', '2017-09-03T09:27:57Z'),
(627, 1, 1, 627, 'notes', '2017-09-03T09:27:57Z'),
(628, 1, 1, 628, 'notes', '2017-09-03T09:27:57Z'),
(629, 1, 1, 629, 'notes', '2017-09-03T09:27:57Z'),
(630, 1, 1, 630, 'notes', '2017-09-03T09:27:57Z'),
(631, 1, 1, 631, 'notes', '2017-09-03T09:27:57Z'),
(632, 1, 1, 632, 'notes', '2017-09-03T09:27:57Z'),
(633, 1, 1, 633, 'notes', '2017-09-03T09:27:57Z'),
(634, 1, 1, 634, 'notes', '2017-09-03T09:27:57Z'),
(635, 1, 1, 635, 'notes', '2017-09-03T09:27:57Z'),
(636, 1, 1, 636, 'notes', '2017-09-03T09:27:57Z'),
(637, 1, 1, 637, 'notes', '2017-09-03T09:27:57Z'),
(638, 1, 1, 638, 'notes', '2017-09-03T09:27:57Z'),
(639, 1, 1, 639, 'notes', '2017-09-03T09:27:57Z'),
(640, 1, 1, 640, 'notes', '2017-09-03T09:27:57Z'),
(641, 1, 1, 641, 'notes', '2017-09-03T09:27:57Z'),
(642, 1, 1, 642, 'notes', '2017-09-03T09:27:57Z'),
(643, 1, 1, 643, 'notes', '2017-09-03T09:27:57Z'),
(644, 1, 1, 644, 'notes', '2017-09-03T09:27:57Z'),
(645, 1, 1, 645, 'notes', '2017-09-03T09:27:57Z'),
(646, 1, 1, 646, 'notes', '2017-09-03T09:27:57Z'),
(647, 1, 1, 647, 'notes', '2017-09-03T09:27:57Z'),
(648, 1, 1, 648, 'notes', '2017-09-03T09:27:57Z'),
(649, 1, 1, 649, 'notes', '2017-09-03T09:27:57Z'),
(650, 1, 1, 650, 'notes', '2017-09-03T09:27:57Z'),
(651, 1, 1, 651, 'notes', '2017-09-03T09:27:57Z'),
(652, 1, 1, 652, 'notes', '2017-09-03T09:27:57Z'),
(653, 1, 1, 653, 'notes', '2017-09-03T09:27:57Z'),
(654, 1, 1, 654, 'notes', '2017-09-03T09:27:57Z'),
(655, 1, 1, 655, 'notes', '2017-09-03T09:27:57Z'),
(656, 1, 1, 656, 'notes', '2017-09-03T09:27:57Z'),
(657, 1, 1, 657, 'notes', '2017-09-03T09:27:57Z'),
(658, 1, 1, 658, 'notes', '2017-09-03T09:27:57Z'),
(659, 1, 1, 659, 'notes', '2017-09-03T09:27:57Z'),
(660, 1, 1, 660, 'notes', '2017-09-03T09:27:57Z'),
(661, 1, 1, 661, 'notes', '2017-09-03T09:27:57Z'),
(662, 1, 1, 662, 'notes', '2017-09-03T09:27:57Z'),
(663, 1, 1, 663, 'notes', '2017-09-03T09:27:57Z'),
(664, 1, 1, 664, 'notes', '2017-09-03T09:27:57Z'),
(665, 1, 1, 665, 'notes', '2017-09-03T09:27:57Z'),
(666, 1, 1, 666, 'notes', '2017-09-03T09:27:57Z'),
(667, 1, 1, 667, 'notes', '2017-09-03T09:27:57Z'),
(668, 1, 1, 668, 'notes', '2017-09-03T09:27:57Z'),
(669, 1, 1, 669, 'notes', '2017-09-03T09:27:57Z'),
(670, 1, 1, 670, 'notes', '2017-09-03T09:27:57Z'),
(671, 1, 1, 671, 'notes', '2017-09-03T09:27:57Z'),
(672, 1, 1, 672, 'notes', '2017-09-03T09:27:57Z'),
(673, 1, 1, 673, 'notes', '2017-09-03T09:27:57Z'),
(674, 1, 1, 674, 'notes', '2017-09-03T09:27:57Z'),
(675, 1, 1, 675, 'notes', '2017-09-03T09:27:57Z'),
(676, 1, 1, 676, 'notes', '2017-09-03T09:27:57Z'),
(677, 1, 1, 677, 'notes', '2017-09-03T09:27:57Z'),
(678, 1, 1, 678, 'notes', '2017-09-03T09:27:57Z'),
(679, 1, 1, 679, 'notes', '2017-09-03T09:27:57Z'),
(680, 1, 1, 680, 'notes', '2017-09-03T09:27:57Z'),
(681, 1, 1, 681, 'notes', '2017-09-03T09:27:57Z'),
(682, 1, 1, 682, 'notes', '2017-09-03T09:27:57Z'),
(683, 1, 1, 683, 'notes', '2017-09-03T09:27:57Z'),
(684, 1, 1, 684, 'notes', '2017-09-03T09:27:57Z'),
(685, 1, 1, 685, 'notes', '2017-09-03T09:27:57Z'),
(686, 1, 1, 686, 'notes', '2017-09-03T09:27:57Z'),
(687, 1, 1, 687, 'notes', '2017-09-03T09:27:57Z'),
(688, 1, 1, 688, 'notes', '2017-09-03T09:27:57Z'),
(689, 1, 1, 689, 'notes', '2017-09-03T09:27:57Z'),
(690, 1, 1, 690, 'notes', '2017-09-03T09:27:57Z'),
(691, 1, 1, 691, 'notes', '2017-09-03T09:27:57Z'),
(692, 1, 1, 692, 'notes', '2017-09-03T09:27:57Z'),
(693, 1, 1, 693, 'notes', '2017-09-03T09:27:57Z'),
(694, 1, 1, 694, 'notes', '2017-09-03T09:27:57Z'),
(695, 1, 1, 695, 'notes', '2017-09-03T09:27:57Z'),
(696, 1, 1, 696, 'notes', '2017-09-03T09:27:57Z'),
(697, 1, 1, 697, 'notes', '2017-09-03T09:27:57Z'),
(698, 1, 1, 698, 'notes', '2017-09-03T09:27:57Z'),
(699, 2, 1, 699, 'notes', '2017-09-03T09:27:57Z'),
(700, 1, 1, 700, 'notes', '2017-09-03T09:27:57Z'),
(701, 1, 1, 701, 'notes', '2017-09-03T09:27:57Z'),
(702, 1, 1, 702, 'notes', '2017-09-03T09:27:57Z'),
(703, 1, 1, 703, 'notes', '2017-09-03T09:27:57Z'),
(704, 1, 1, 704, 'notes', '2017-09-03T09:27:57Z'),
(705, 1, 1, 705, 'notes', '2017-09-03T09:27:57Z'),
(706, 1, 1, 706, 'notes', '2017-09-03T09:27:57Z'),
(707, 1, 1, 707, 'notes', '2017-09-03T09:27:57Z'),
(708, 1, 1, 708, 'notes', '2017-09-03T09:27:57Z'),
(709, 1, 1, 709, 'notes', '2017-09-03T09:27:57Z'),
(710, 1, 1, 710, 'notes', '2017-09-03T09:27:57Z'),
(711, 1, 1, 711, 'notes', '2017-09-03T09:27:57Z'),
(712, 1, 1, 712, 'notes', '2017-09-03T09:27:57Z'),
(713, 1, 1, 713, 'notes', '2017-09-03T09:27:57Z'),
(714, 1, 1, 714, 'notes', '2017-09-03T09:27:57Z'),
(715, 1, 1, 715, 'notes', '2017-09-03T09:27:57Z'),
(716, 1, 1, 716, 'notes', '2017-09-03T09:27:57Z'),
(717, 1, 1, 717, 'notes', '2017-09-03T09:27:57Z'),
(718, 1, 1, 718, 'notes', '2017-09-03T09:27:57Z'),
(719, 1, 1, 719, 'notes', '2017-09-03T09:27:57Z'),
(720, 1, 1, 720, 'notes', '2017-09-03T09:27:57Z'),
(721, 2, 1, 721, 'notes', '2017-09-03T09:27:57Z'),
(722, 1, 1, 722, 'notes', '2017-09-03T09:27:57Z'),
(723, 1, 1, 723, 'notes', '2017-09-03T09:27:57Z'),
(724, 1, 1, 724, 'notes', '2017-09-03T09:27:57Z'),
(725, 1, 1, 725, 'notes', '2017-09-03T09:27:57Z'),
(726, 1, 1, 726, 'notes', '2017-09-03T09:27:57Z'),
(727, 1, 1, 727, 'notes', '2017-09-03T09:27:57Z'),
(728, 1, 1, 728, 'notes', '2017-09-03T09:27:57Z'),
(729, 1, 1, 729, 'notes', '2017-09-03T09:27:57Z'),
(730, 1, 1, 730, 'notes', '2017-09-03T09:27:57Z'),
(731, 1, 1, 731, 'notes', '2017-09-03T09:27:57Z'),
(732, 1, 1, 732, 'notes', '2017-09-03T09:27:57Z'),
(733, 1, 1, 733, 'notes', '2017-09-03T09:27:57Z'),
(734, 1, 1, 734, 'notes', '2017-09-03T09:27:57Z'),
(735, 1, 1, 735, 'notes', '2017-09-03T09:27:57Z'),
(736, 1, 1, 736, 'notes', '2017-09-03T09:27:57Z'),
(737, 1, 1, 737, 'notes', '2017-09-03T09:27:57Z'),
(738, 1, 1, 738, 'notes', '2017-09-03T09:27:57Z'),
(739, 1, 1, 739, 'notes', '2017-09-03T09:27:57Z'),
(740, 1, 1, 740, 'notes', '2017-09-03T09:27:57Z'),
(741, 1, 1, 741, 'notes', '2017-09-03T09:27:57Z'),
(742, 1, 1, 742, 'notes', '2017-09-03T09:27:57Z'),
(743, 1, 1, 743, 'notes', '2017-09-03T09:27:57Z'),
(744, 1, 1, 744, 'notes', '2017-09-03T09:27:57Z'),
(745, 2, 1, 745, 'notes', '2017-09-03T09:27:57Z'),
(746, 1, 1, 746, 'notes', '2017-09-03T09:27:57Z'),
(747, 1, 1, 747, 'notes', '2017-09-03T09:27:57Z'),
(748, 1, 1, 748, 'notes', '2017-09-03T09:27:57Z'),
(749, 1, 1, 749, 'notes', '2017-09-03T09:27:57Z'),
(750, 1, 1, 750, 'notes', '2017-09-03T09:27:57Z'),
(751, 1, 1, 751, 'notes', '2017-09-03T09:27:57Z'),
(752, 1, 1, 752, 'notes', '2017-09-03T09:27:57Z'),
(753, 1, 1, 753, 'notes', '2017-09-03T09:27:57Z'),
(754, 1, 1, 754, 'notes', '2017-09-03T09:27:57Z'),
(755, 1, 1, 755, 'notes', '2017-09-03T09:27:57Z'),
(756, 1, 1, 756, 'notes', '2017-09-03T09:27:57Z'),
(757, 1, 1, 757, 'notes', '2017-09-03T09:27:57Z'),
(758, 1, 1, 758, 'notes', '2017-09-03T09:27:57Z'),
(759, 1, 1, 759, 'notes', '2017-09-03T09:27:57Z'),
(760, 1, 1, 760, 'notes', '2017-09-03T09:27:57Z'),
(761, 1, 1, 761, 'notes', '2017-09-03T09:27:57Z'),
(762, 1, 1, 762, 'notes', '2017-09-03T09:27:57Z'),
(763, 1, 1, 763, 'notes', '2017-09-03T09:27:57Z'),
(764, 1, 1, 764, 'notes', '2017-09-03T09:27:57Z'),
(765, 1, 1, 765, 'notes', '2017-09-03T09:27:57Z'),
(766, 1, 1, 766, 'notes', '2017-09-03T09:27:57Z'),
(767, 1, 1, 767, 'notes', '2017-09-03T09:27:57Z'),
(768, 1, 1, 768, 'notes', '2017-09-03T09:27:57Z'),
(769, 1, 1, 769, 'notes', '2017-09-03T09:27:57Z'),
(770, 1, 1, 770, 'notes', '2017-09-03T09:27:57Z'),
(771, 1, 1, 771, 'notes', '2017-09-03T09:27:57Z'),
(772, 1, 1, 772, 'notes', '2017-09-03T09:27:57Z'),
(773, 1, 1, 773, 'notes', '2017-09-03T09:27:57Z'),
(774, 1, 1, 774, 'notes', '2017-09-03T09:27:57Z'),
(775, 1, 1, 775, 'notes', '2017-09-03T09:27:57Z'),
(776, 1, 1, 776, 'notes', '2017-09-03T09:27:57Z'),
(777, 1, 1, 777, 'notes', '2017-09-03T09:27:57Z'),
(778, 1, 1, 778, 'notes', '2017-09-03T09:27:57Z'),
(779, 1, 1, 779, 'notes', '2017-09-03T09:27:57Z'),
(780, 1, 1, 780, 'notes', '2017-09-03T09:27:57Z'),
(781, 1, 1, 781, 'notes', '2017-09-03T09:27:57Z'),
(782, 1, 1, 782, 'notes', '2017-09-03T09:27:57Z'),
(783, 1, 1, 783, 'notes', '2017-09-03T09:27:57Z'),
(784, 1, 1, 784, 'notes', '2017-09-03T09:27:57Z'),
(785, 1, 1, 785, 'notes', '2017-09-03T09:27:57Z'),
(786, 1, 1, 786, 'notes', '2017-09-03T09:27:57Z'),
(787, 1, 1, 787, 'notes', '2017-09-03T09:27:57Z'),
(788, 1, 1, 788, 'notes', '2017-09-03T09:27:57Z'),
(789, 1, 1, 789, 'notes', '2017-09-03T09:27:57Z'),
(790, 1, 1, 790, 'notes', '2017-09-03T09:27:57Z'),
(791, 1, 1, 791, 'notes', '2017-09-03T09:27:57Z'),
(792, 1, 1, 792, 'notes', '2017-09-03T09:27:57Z'),
(793, 1, 1, 793, 'notes', '2017-09-03T09:27:57Z'),
(794, 1, 1, 794, 'notes', '2017-09-03T09:27:57Z'),
(795, 1, 1, 795, 'notes', '2017-09-03T09:27:57Z'),
(796, 1, 1, 796, 'notes', '2017-09-03T09:27:57Z'),
(797, 1, 1, 797, 'notes', '2017-09-03T09:27:57Z'),
(798, 1, 1, 798, 'notes', '2017-09-03T09:27:57Z'),
(799, 1, 1, 799, 'notes', '2017-09-03T09:27:57Z'),
(800, 1, 1, 800, 'notes', '2017-09-03T09:27:57Z'),
(801, 1, 1, 801, 'notes', '2017-09-03T09:27:57Z'),
(802, 1, 1, 802, 'notes', '2017-09-03T09:27:57Z'),
(803, 1, 1, 803, 'notes', '2017-09-03T09:27:57Z'),
(804, 1, 1, 804, 'notes', '2017-09-03T09:27:57Z'),
(805, 1, 1, 805, 'notes', '2017-09-03T09:27:57Z'),
(806, 1, 1, 806, 'notes', '2017-09-03T09:27:57Z'),
(807, 1, 1, 807, 'notes', '2017-09-03T09:27:57Z'),
(808, 1, 1, 808, 'notes', '2017-09-03T09:27:57Z'),
(809, 1, 1, 809, 'notes', '2017-09-03T09:27:57Z'),
(810, 1, 1, 810, 'notes', '2017-09-03T09:27:57Z'),
(811, 1, 1, 811, 'notes', '2017-09-03T09:27:57Z'),
(812, 1, 1, 812, 'notes', '2017-09-03T09:27:57Z'),
(813, 1, 1, 813, 'notes', '2017-09-03T09:27:57Z'),
(814, 1, 1, 814, 'notes', '2017-09-03T09:27:57Z'),
(815, 1, 1, 815, 'notes', '2017-09-03T09:27:57Z'),
(816, 1, 1, 816, 'notes', '2017-09-03T09:27:57Z'),
(817, 1, 1, 817, 'notes', '2017-09-03T09:27:57Z'),
(818, 1, 1, 818, 'notes', '2017-09-03T09:27:57Z'),
(819, 1, 1, 819, 'notes', '2017-09-03T09:27:57Z'),
(820, 1, 1, 820, 'notes', '2017-09-03T09:27:57Z'),
(821, 1, 1, 821, 'notes', '2017-09-03T09:27:57Z'),
(822, 1, 1, 822, 'notes', '2017-09-03T09:27:57Z'),
(823, 1, 1, 823, 'notes', '2017-09-03T09:27:57Z'),
(824, 1, 1, 824, 'notes', '2017-09-03T09:27:57Z'),
(825, 1, 1, 825, 'notes', '2017-09-03T09:27:57Z'),
(826, 1, 1, 826, 'notes', '2017-09-03T09:27:57Z'),
(827, 1, 1, 827, 'notes', '2017-09-03T09:27:57Z'),
(828, 1, 1, 828, 'notes', '2017-09-03T09:27:57Z'),
(829, 1, 1, 829, 'notes', '2017-09-03T09:27:57Z'),
(830, 1, 1, 830, 'notes', '2017-09-03T09:27:57Z'),
(831, 1, 1, 831, 'notes', '2017-09-03T09:27:57Z'),
(832, 1, 1, 832, 'notes', '2017-09-03T09:27:57Z'),
(833, 1, 1, 833, 'notes', '2017-09-03T09:27:57Z'),
(834, 1, 1, 834, 'notes', '2017-09-03T09:27:57Z'),
(835, 1, 1, 835, 'notes', '2017-09-03T09:27:57Z'),
(836, 1, 1, 836, 'notes', '2017-09-03T09:27:57Z'),
(837, 1, 1, 837, 'notes', '2017-09-03T09:27:57Z'),
(838, 1, 1, 838, 'notes', '2017-09-03T09:27:57Z'),
(839, 1, 1, 839, 'notes', '2017-09-03T09:27:57Z'),
(840, 1, 1, 840, 'notes', '2017-09-03T09:27:57Z'),
(841, 1, 1, 841, 'notes', '2017-09-03T09:27:57Z'),
(842, 1, 1, 842, 'notes', '2017-09-03T09:27:57Z'),
(843, 1, 1, 843, 'notes', '2017-09-03T09:27:57Z'),
(844, 1, 1, 844, 'notes', '2017-09-03T09:27:57Z'),
(845, 1, 1, 845, 'notes', '2017-09-03T09:27:57Z'),
(846, 1, 1, 846, 'notes', '2017-09-03T09:27:57Z'),
(847, 1, 1, 847, 'notes', '2017-09-03T09:27:57Z'),
(848, 1, 1, 848, 'notes', '2017-09-03T09:27:57Z'),
(849, 1, 1, 849, 'notes', '2017-09-03T09:27:57Z'),
(850, 1, 1, 850, 'notes', '2017-09-03T09:27:57Z'),
(851, 1, 1, 851, 'notes', '2017-09-03T09:27:57Z'),
(852, 1, 1, 852, 'notes', '2017-09-03T09:27:57Z'),
(853, 1, 1, 853, 'notes', '2017-09-03T09:27:57Z'),
(854, 1, 1, 854, 'notes', '2017-09-03T09:27:57Z'),
(855, 1, 1, 855, 'notes', '2017-09-03T09:27:57Z'),
(856, 1, 1, 856, 'notes', '2017-09-03T09:27:57Z'),
(857, 1, 1, 857, 'notes', '2017-09-03T09:27:57Z'),
(858, 1, 1, 858, 'notes', '2017-09-03T09:27:57Z'),
(859, 1, 1, 859, 'notes', '2017-09-03T09:27:57Z'),
(860, 1, 1, 860, 'notes', '2017-09-03T09:27:57Z'),
(861, 1, 1, 861, 'notes', '2017-09-03T09:27:57Z'),
(862, 1, 1, 862, 'notes', '2017-09-03T09:27:57Z'),
(863, 1, 1, 863, 'notes', '2017-09-03T09:27:57Z'),
(864, 1, 1, 864, 'notes', '2017-09-03T09:27:57Z'),
(865, 1, 1, 865, 'notes', '2017-09-03T09:27:57Z'),
(866, 1, 1, 866, 'notes', '2017-09-03T09:27:57Z'),
(867, 1, 1, 867, 'notes', '2017-09-03T09:27:57Z'),
(868, 1, 1, 868, 'notes', '2017-09-03T09:27:57Z'),
(869, 1, 1, 869, 'notes', '2017-09-03T09:27:57Z'),
(870, 1, 1, 870, 'notes', '2017-09-03T09:27:57Z'),
(871, 1, 1, 871, 'notes', '2017-09-03T09:27:57Z'),
(872, 1, 1, 872, 'notes', '2017-09-03T09:27:57Z'),
(873, 1, 1, 873, 'notes', '2017-09-03T09:27:57Z'),
(874, 1, 1, 874, 'notes', '2017-09-03T09:27:57Z'),
(875, 1, 1, 875, 'notes', '2017-09-03T09:27:57Z'),
(876, 1, 1, 876, 'notes', '2017-09-03T09:27:57Z'),
(877, 1, 1, 877, 'notes', '2017-09-03T09:27:57Z'),
(878, 1, 1, 878, 'notes', '2017-09-03T09:27:57Z'),
(879, 1, 1, 879, 'notes', '2017-09-03T09:27:57Z'),
(880, 1, 1, 880, 'notes', '2017-09-03T09:27:57Z'),
(881, 1, 1, 881, 'notes', '2017-09-03T09:27:57Z'),
(882, 1, 1, 882, 'notes', '2017-09-03T09:27:57Z'),
(883, 1, 1, 883, 'notes', '2017-09-03T09:27:57Z'),
(884, 1, 1, 884, 'notes', '2017-09-03T09:27:57Z'),
(885, 1, 1, 885, 'notes', '2017-09-03T09:27:57Z'),
(886, 1, 1, 886, 'notes', '2017-09-03T09:27:57Z'),
(887, 1, 1, 887, 'notes', '2017-09-03T09:27:57Z'),
(888, 1, 1, 888, 'notes', '2017-09-03T09:27:57Z'),
(889, 1, 1, 889, 'notes', '2017-09-03T09:27:57Z'),
(890, 1, 1, 890, 'notes', '2017-09-03T09:27:57Z'),
(891, 1, 1, 891, 'notes', '2017-09-03T09:27:57Z'),
(892, 1, 1, 892, 'notes', '2017-09-03T09:27:57Z'),
(893, 1, 1, 893, 'notes', '2017-09-03T09:27:57Z'),
(894, 2, 1, 894, 'notes', '2017-09-03T09:27:57Z'),
(895, 1, 1, 895, 'notes', '2017-09-03T09:27:57Z'),
(896, 1, 1, 896, 'notes', '2017-09-03T09:27:57Z'),
(897, 1, 1, 897, 'notes', '2017-09-03T09:27:57Z'),
(898, 1, 1, 898, 'notes', '2017-09-03T09:27:57Z'),
(899, 1, 1, 899, 'notes', '2017-09-03T09:27:57Z'),
(900, 1, 1, 900, 'notes', '2017-09-03T09:27:57Z'),
(901, 1, 1, 901, 'notes', '2017-09-03T09:27:57Z'),
(902, 1, 1, 902, 'notes', '2017-09-03T09:27:57Z'),
(903, 1, 1, 903, 'notes', '2017-09-03T09:27:57Z'),
(904, 1, 1, 904, 'notes', '2017-09-03T09:27:57Z'),
(905, 1, 1, 905, 'notes', '2017-09-03T09:27:57Z'),
(906, 1, 1, 906, 'notes', '2017-09-03T09:27:57Z'),
(907, 1, 1, 907, 'notes', '2017-09-03T09:27:57Z'),
(908, 1, 1, 908, 'notes', '2017-09-03T09:27:57Z'),
(909, 1, 1, 909, 'notes', '2017-09-03T09:27:57Z'),
(910, 1, 1, 910, 'notes', '2017-09-03T09:27:57Z'),
(911, 1, 1, 911, 'notes', '2017-09-03T09:27:57Z'),
(912, 1, 1, 912, 'notes', '2017-09-03T09:27:57Z'),
(913, 1, 1, 913, 'notes', '2017-09-03T09:27:57Z'),
(914, 1, 1, 914, 'notes', '2017-09-03T09:27:57Z'),
(915, 1, 1, 915, 'notes', '2017-09-03T09:27:57Z'),
(916, 1, 1, 916, 'notes', '2017-09-03T09:27:57Z'),
(917, 1, 1, 917, 'notes', '2017-09-03T09:27:57Z'),
(918, 1, 1, 918, 'notes', '2017-09-03T09:27:57Z'),
(919, 1, 1, 919, 'notes', '2017-09-03T09:27:57Z'),
(920, 1, 1, 920, 'notes', '2017-09-03T09:27:57Z'),
(921, 1, 1, 921, 'notes', '2017-09-03T09:27:57Z'),
(922, 1, 1, 922, 'notes', '2017-09-03T09:27:57Z'),
(923, 1, 1, 923, 'notes', '2017-09-03T09:27:57Z'),
(924, 1, 1, 924, 'notes', '2017-09-03T09:27:57Z'),
(925, 1, 1, 925, 'notes', '2017-09-03T09:27:57Z'),
(926, 1, 1, 926, 'notes', '2017-09-03T09:27:57Z'),
(927, 1, 1, 927, 'notes', '2017-09-03T09:27:57Z'),
(928, 1, 1, 928, 'notes', '2017-09-03T09:27:57Z'),
(929, 1, 1, 929, 'notes', '2017-09-03T09:27:57Z'),
(930, 1, 1, 930, 'notes', '2017-09-03T09:27:57Z'),
(931, 1, 1, 931, 'notes', '2017-09-03T09:27:57Z'),
(932, 1, 1, 932, 'notes', '2017-09-03T09:27:57Z'),
(933, 1, 1, 933, 'notes', '2017-09-03T09:27:57Z'),
(934, 1, 1, 934, 'notes', '2017-09-03T09:27:57Z'),
(935, 1, 1, 935, 'notes', '2017-09-03T09:27:57Z'),
(936, 1, 1, 936, 'notes', '2017-09-03T09:27:57Z'),
(937, 1, 1, 937, 'notes', '2017-09-03T09:27:57Z'),
(938, 1, 1, 938, 'notes', '2017-09-03T09:27:57Z'),
(939, 1, 1, 939, 'notes', '2017-09-03T09:27:57Z'),
(940, 1, 1, 940, 'notes', '2017-09-03T09:27:57Z'),
(941, 1, 1, 941, 'notes', '2017-09-03T09:27:57Z'),
(942, 1, 1, 942, 'notes', '2017-09-03T09:27:57Z'),
(943, 1, 1, 943, 'notes', '2017-09-03T09:27:57Z'),
(944, 1, 1, 944, 'notes', '2017-09-03T09:27:57Z'),
(945, 1, 1, 945, 'notes', '2017-09-03T09:27:57Z'),
(946, 1, 1, 946, 'notes', '2017-09-03T09:27:57Z'),
(947, 1, 1, 947, 'notes', '2017-09-03T09:27:57Z'),
(948, 1, 1, 948, 'notes', '2017-09-03T09:27:57Z'),
(949, 1, 1, 949, 'notes', '2017-09-03T09:27:57Z'),
(950, 1, 1, 950, 'notes', '2017-09-03T09:27:57Z'),
(951, 1, 1, 951, 'notes', '2017-09-03T09:27:57Z'),
(952, 1, 1, 952, 'notes', '2017-09-03T09:27:57Z'),
(953, 1, 1, 953, 'notes', '2017-09-03T09:27:57Z'),
(954, 1, 1, 954, 'notes', '2017-09-03T09:27:57Z'),
(955, 1, 1, 955, 'notes', '2017-09-03T09:27:57Z'),
(956, 1, 1, 956, 'notes', '2017-09-03T09:27:57Z'),
(957, 1, 1, 957, 'notes', '2017-09-03T09:27:57Z'),
(958, 1, 1, 958, 'notes', '2017-09-03T09:27:57Z'),
(959, 1, 1, 959, 'notes', '2017-09-03T09:27:57Z'),
(960, 1, 1, 960, 'notes', '2017-09-03T09:27:57Z'),
(961, 1, 1, 961, 'notes', '2017-09-03T09:27:57Z'),
(962, 1, 1, 962, 'notes', '2017-09-03T09:27:57Z'),
(963, 1, 1, 963, 'notes', '2017-09-03T09:27:57Z'),
(964, 1, 1, 964, 'notes', '2017-09-03T09:27:57Z'),
(965, 1, 1, 965, 'notes', '2017-09-03T09:27:57Z'),
(966, 1, 1, 966, 'notes', '2017-09-03T09:27:57Z'),
(967, 1, 1, 967, 'notes', '2017-09-03T09:27:57Z'),
(968, 1, 1, 968, 'notes', '2017-09-03T09:27:57Z'),
(969, 1, 1, 969, 'notes', '2017-09-03T09:27:57Z'),
(970, 1, 1, 970, 'notes', '2017-09-03T09:27:57Z'),
(971, 1, 1, 971, 'notes', '2017-09-03T09:27:57Z'),
(972, 1, 1, 972, 'notes', '2017-09-03T09:27:57Z'),
(973, 1, 1, 973, 'notes', '2017-09-03T09:27:57Z'),
(974, 1, 1, 974, 'notes', '2017-09-03T09:27:57Z'),
(975, 1, 1, 975, 'notes', '2017-09-03T09:27:57Z'),
(976, 1, 1, 976, 'notes', '2017-09-03T09:27:57Z'),
(977, 1, 1, 977, 'notes', '2017-09-03T09:27:57Z'),
(978, 1, 1, 978, 'notes', '2017-09-03T09:27:57Z'),
(979, 1, 1, 979, 'notes', '2017-09-03T09:27:57Z'),
(980, 1, 1, 980, 'notes', '2017-09-03T09:27:57Z'),
(981, 1, 1, 981, 'notes', '2017-09-03T09:27:57Z'),
(982, 1, 1, 982, 'notes', '2017-09-03T09:27:57Z'),
(983, 1, 1, 983, 'notes', '2017-09-03T09:27:57Z'),
(984, 1, 1, 984, 'notes', '2017-09-03T09:27:57Z'),
(985, 1, 1, 985, 'notes', '2017-09-03T09:27:57Z'),
(986, 1, 1, 986, 'notes', '2017-09-03T09:27:57Z'),
(987, 1, 1, 987, 'notes', '2017-09-03T09:27:57Z'),
(988, 1, 1, 988, 'notes', '2017-09-03T09:27:57Z'),
(989, 1, 1, 989, 'notes', '2017-09-03T09:27:57Z'),
(990, 1, 1, 990, 'notes', '2017-09-03T09:27:57Z'),
(991, 1, 1, 991, 'notes', '2017-09-03T09:27:57Z'),
(992, 1, 1, 992, 'notes', '2017-09-03T09:27:57Z'),
(993, 1, 1, 993, 'notes', '2017-09-03T09:27:57Z'),
(994, 1, 1, 994, 'notes', '2017-09-03T09:27:57Z'),
(995, 1, 1, 995, 'notes', '2017-09-03T09:27:57Z'),
(996, 1, 1, 996, 'notes', '2017-09-03T09:27:57Z'),
(997, 1, 1, 997, 'notes', '2017-09-03T09:27:57Z'),
(998, 1, 1, 998, 'notes', '2017-09-03T09:27:57Z'),
(999, 1, 1, 999, 'notes', '2017-09-03T09:27:57Z'),
(1000, 1, 1, 1000, 'notes', '2017-09-03T09:27:57Z'),
(1001, 1, 1, 1001, 'notes', '2017-09-03T09:27:57Z'),
(1002, 1, 1, 1002, 'notes', '2017-09-03T09:27:57Z'),
(1003, 1, 1, 1003, 'notes', '2017-09-03T09:27:57Z'),
(1004, 1, 1, 1004, 'notes', '2017-09-03T09:27:57Z'),
(1005, 1, 1, 1005, 'notes', '2017-09-03T09:27:57Z'),
(1006, 1, 1, 1006, 'notes', '2017-09-03T09:27:57Z'),
(1007, 1, 1, 1007, 'notes', '2017-09-03T09:27:57Z'),
(1008, 1, 1, 1008, 'notes', '2017-09-03T09:27:57Z'),
(1009, 1, 1, 1009, 'notes', '2017-09-03T09:27:57Z'),
(1010, 1, 1, 1010, 'notes', '2017-09-03T09:27:57Z'),
(1011, 1, 1, 1011, 'notes', '2017-09-03T09:27:57Z'),
(1012, 1, 1, 1012, 'notes', '2017-09-03T09:27:57Z'),
(1013, 1, 1, 1013, 'notes', '2017-09-03T09:27:57Z'),
(1014, 1, 1, 1014, 'notes', '2017-09-03T09:27:57Z'),
(1015, 1, 1, 1015, 'notes', '2017-09-03T09:27:57Z'),
(1016, 1, 1, 1016, 'notes', '2017-09-03T09:27:57Z'),
(1017, 1, 1, 1017, 'notes', '2017-09-03T09:27:57Z'),
(1018, 1, 1, 1018, 'notes', '2017-09-03T09:27:57Z'),
(1019, 1, 1, 1019, 'notes', '2017-09-03T09:27:57Z'),
(1020, 1, 1, 1020, 'notes', '2017-09-03T09:27:57Z'),
(1021, 1, 1, 1021, 'notes', '2017-09-03T09:27:57Z'),
(1022, 1, 1, 1022, 'notes', '2017-09-03T09:27:57Z'),
(1023, 1, 1, 1023, 'notes', '2017-09-03T09:27:57Z'),
(1024, 1, 1, 1024, 'notes', '2017-09-03T09:27:57Z'),
(1025, 1, 1, 1025, 'notes', '2017-09-03T09:27:57Z'),
(1026, 1, 1, 1026, 'notes', '2017-09-03T09:27:57Z'),
(1027, 1, 1, 1027, 'notes', '2017-09-03T09:27:57Z'),
(1028, 1, 1, 1028, 'notes', '2017-09-03T09:27:57Z'),
(1029, 1, 1, 1029, 'notes', '2017-09-03T09:27:57Z'),
(1030, 1, 1, 1030, 'notes', '2017-09-03T09:27:57Z'),
(1031, 1, 1, 1031, 'notes', '2017-09-03T09:27:57Z'),
(1032, 1, 1, 1032, 'notes', '2017-09-03T09:27:57Z'),
(1033, 1, 1, 1033, 'notes', '2017-09-03T09:27:57Z'),
(1034, 1, 1, 1034, 'notes', '2017-09-03T09:27:57Z'),
(1035, 1, 1, 1035, 'notes', '2017-09-03T09:27:57Z'),
(1036, 1, 1, 1036, 'notes', '2017-09-03T09:27:57Z'),
(1037, 1, 1, 1037, 'notes', '2017-09-03T09:27:57Z'),
(1038, 1, 1, 1038, 'notes', '2017-09-03T09:27:57Z'),
(1039, 1, 1, 1039, 'notes', '2017-09-03T09:27:57Z'),
(1040, 1, 1, 1040, 'notes', '2017-09-03T09:27:57Z'),
(1041, 1, 1, 1041, 'notes', '2017-09-03T09:27:57Z'),
(1042, 1, 1, 1042, 'notes', '2017-09-03T09:27:57Z'),
(1043, 1, 1, 1043, 'notes', '2017-09-03T09:27:57Z'),
(1044, 1, 1, 1044, 'notes', '2017-09-03T09:27:57Z'),
(1045, 1, 1, 1045, 'notes', '2017-09-03T09:27:57Z'),
(1046, 1, 1, 1046, 'notes', '2017-09-03T09:27:57Z'),
(1047, 1, 1, 1047, 'notes', '2017-09-03T09:27:57Z'),
(1048, 1, 1, 1048, 'notes', '2017-09-03T09:27:57Z'),
(1049, 1, 1, 1049, 'notes', '2017-09-03T09:27:57Z'),
(1050, 1, 1, 1050, 'notes', '2017-09-03T09:27:57Z'),
(1051, 1, 1, 1051, 'notes', '2017-09-03T09:27:57Z'),
(1052, 1, 1, 1052, 'notes', '2017-09-03T09:27:57Z'),
(1053, 1, 1, 1053, 'notes', '2017-09-03T09:27:57Z'),
(1054, 1, 1, 1054, 'notes', '2017-09-03T09:27:57Z'),
(1055, 1, 1, 1055, 'notes', '2017-09-03T09:27:57Z'),
(1056, 1, 1, 1056, 'notes', '2017-09-03T09:27:57Z'),
(1057, 1, 1, 1057, 'notes', '2017-09-03T09:27:57Z'),
(1058, 1, 1, 1058, 'notes', '2017-09-03T09:27:57Z'),
(1059, 1, 1, 1059, 'notes', '2017-09-03T09:27:57Z'),
(1060, 1, 1, 1060, 'notes', '2017-09-03T09:27:57Z'),
(1061, 1, 1, 1061, 'notes', '2017-09-03T09:27:57Z'),
(1062, 1, 1, 1062, 'notes', '2017-09-03T09:27:57Z'),
(1063, 1, 1, 1063, 'notes', '2017-09-03T09:27:57Z'),
(1064, 1, 1, 1064, 'notes', '2017-09-03T09:27:57Z'),
(1065, 1, 1, 1065, 'notes', '2017-09-03T09:27:57Z'),
(1066, 1, 1, 1066, 'notes', '2017-09-03T09:27:57Z'),
(1067, 1, 1, 1067, 'notes', '2017-09-03T09:27:57Z'),
(1068, 1, 1, 1068, 'notes', '2017-09-03T09:27:57Z'),
(1069, 1, 1, 1069, 'notes', '2017-09-03T09:27:57Z'),
(1070, 1, 1, 1070, 'notes', '2017-09-03T09:27:57Z'),
(1071, 1, 1, 1071, 'notes', '2017-09-03T09:27:57Z'),
(1072, 1, 1, 1072, 'notes', '2017-09-03T09:27:57Z'),
(1073, 1, 1, 1073, 'notes', '2017-09-03T09:27:57Z'),
(1074, 1, 1, 1074, 'notes', '2017-09-03T09:27:57Z'),
(1075, 1, 1, 1075, 'notes', '2017-09-03T09:27:57Z'),
(1076, 1, 1, 1076, 'notes', '2017-09-03T09:27:57Z'),
(1077, 1, 1, 1077, 'notes', '2017-09-03T09:27:57Z'),
(1078, 1, 1, 1078, 'notes', '2017-09-03T09:27:57Z'),
(1079, 1, 1, 1079, 'notes', '2017-09-03T09:27:57Z'),
(1080, 1, 1, 1080, 'notes', '2017-09-03T09:27:57Z'),
(1081, 1, 1, 1081, 'notes', '2017-09-03T09:27:57Z'),
(1082, 1, 1, 1082, 'notes', '2017-09-03T09:27:57Z'),
(1083, 1, 1, 1083, 'notes', '2017-09-03T09:27:57Z'),
(1084, 1, 1, 1084, 'notes', '2017-09-03T09:27:57Z'),
(1085, 1, 1, 1085, 'notes', '2017-09-03T09:27:57Z'),
(1086, 1, 1, 1086, 'notes', '2017-09-03T09:27:57Z'),
(1087, 1, 1, 1087, 'notes', '2017-09-03T09:27:57Z'),
(1088, 1, 1, 1088, 'notes', '2017-09-03T09:27:57Z'),
(1089, 1, 1, 1089, 'notes', '2017-09-03T09:27:57Z'),
(1090, 1, 1, 1090, 'notes', '2017-09-03T09:27:57Z'),
(1091, 1, 1, 1091, 'notes', '2017-09-03T09:27:57Z'),
(1092, 1, 1, 1092, 'notes', '2017-09-03T09:27:57Z'),
(1093, 1, 1, 1093, 'notes', '2017-09-03T09:27:57Z'),
(1094, 1, 1, 1094, 'notes', '2017-09-03T09:27:57Z'),
(1095, 1, 1, 1095, 'notes', '2017-09-03T09:27:57Z'),
(1096, 1, 1, 1096, 'notes', '2017-09-03T09:27:57Z'),
(1097, 1, 1, 1097, 'notes', '2017-09-03T09:27:57Z'),
(1098, 1, 1, 1098, 'notes', '2017-09-03T09:27:57Z'),
(1099, 1, 1, 1099, 'notes', '2017-09-03T09:27:57Z'),
(1100, 1, 1, 1100, 'notes', '2017-09-03T09:27:57Z'),
(1101, 1, 1, 1101, 'notes', '2017-09-03T09:27:57Z'),
(1102, 1, 1, 1102, 'notes', '2017-09-03T09:27:57Z'),
(1103, 1, 1, 1103, 'notes', '2017-09-03T09:27:57Z'),
(1104, 1, 1, 1104, 'notes', '2017-09-03T09:27:57Z'),
(1105, 1, 1, 1105, 'notes', '2017-09-03T09:27:57Z'),
(1106, 1, 1, 1106, 'notes', '2017-09-03T09:27:57Z'),
(1107, 1, 1, 1107, 'notes', '2017-09-03T09:27:57Z'),
(1108, 1, 1, 1108, 'notes', '2017-09-03T09:27:57Z'),
(1109, 1, 1, 1109, 'notes', '2017-09-03T09:27:57Z'),
(1110, 1, 1, 1110, 'notes', '2017-09-03T09:27:57Z'),
(1111, 1, 1, 1111, 'notes', '2017-09-03T09:27:57Z'),
(1112, 1, 1, 1112, 'notes', '2017-09-03T09:27:57Z'),
(1113, 1, 1, 1113, 'notes', '2017-09-03T09:27:57Z'),
(1114, 1, 1, 1114, 'notes', '2017-09-03T09:27:57Z'),
(1115, 1, 1, 1115, 'notes', '2017-09-03T09:27:57Z'),
(1116, 1, 1, 1116, 'notes', '2017-09-03T09:27:57Z'),
(1117, 1, 1, 1117, 'notes', '2017-09-03T09:27:57Z'),
(1118, 1, 1, 1118, 'notes', '2017-09-03T09:27:57Z'),
(1119, 1, 1, 1119, 'notes', '2017-09-03T09:27:57Z'),
(1120, 1, 1, 1120, 'notes', '2017-09-03T09:27:57Z'),
(1121, 1, 1, 1121, 'notes', '2017-09-03T09:27:57Z'),
(1122, 1, 1, 1122, 'notes', '2017-09-03T09:27:57Z'),
(1123, 1, 1, 1123, 'notes', '2017-09-03T09:27:57Z'),
(1124, 1, 1, 1124, 'notes', '2017-09-03T09:27:57Z'),
(1125, 1, 1, 1125, 'notes', '2017-09-03T09:27:57Z'),
(1126, 1, 1, 1126, 'notes', '2017-09-03T09:27:57Z'),
(1127, 1, 1, 1127, 'notes', '2017-09-03T09:27:57Z'),
(1128, 1, 1, 1128, 'notes', '2017-09-03T09:27:57Z'),
(1129, 1, 1, 1129, 'notes', '2017-09-03T09:27:57Z'),
(1130, 1, 1, 1130, 'notes', '2017-09-03T09:27:57Z'),
(1131, 1, 1, 1131, 'notes', '2017-09-03T09:27:57Z'),
(1132, 1, 1, 1132, 'notes', '2017-09-03T09:27:57Z'),
(1133, 1, 1, 1133, 'notes', '2017-09-03T09:27:57Z'),
(1134, 1, 1, 1134, 'notes', '2017-09-03T09:27:57Z'),
(1135, 1, 1, 1135, 'notes', '2017-09-03T09:27:57Z'),
(1136, 1, 1, 1136, 'notes', '2017-09-03T09:27:57Z'),
(1137, 1, 1, 1137, 'notes', '2017-09-03T09:27:57Z'),
(1138, 1, 1, 1138, 'notes', '2017-09-03T09:27:57Z'),
(1139, 1, 1, 1139, 'notes', '2017-09-03T09:27:57Z'),
(1140, 1, 1, 1140, 'notes', '2017-09-03T09:27:57Z'),
(1141, 1, 1, 1141, 'notes', '2017-09-03T09:27:57Z'),
(1142, 1, 1, 1142, 'notes', '2017-09-03T09:27:57Z'),
(1143, 1, 1, 1143, 'notes', '2017-09-03T09:27:57Z'),
(1144, 1, 1, 1144, 'notes', '2017-09-03T09:27:57Z'),
(1145, 1, 1, 1145, 'notes', '2017-09-03T09:27:57Z'),
(1146, 1, 1, 1146, 'notes', '2017-09-03T09:27:57Z'),
(1147, 1, 1, 1147, 'notes', '2017-09-03T09:27:57Z'),
(1148, 1, 1, 1148, 'notes', '2017-09-03T09:27:57Z'),
(1149, 1, 1, 1149, 'notes', '2017-09-03T09:27:57Z'),
(1150, 1, 1, 1150, 'notes', '2017-09-03T09:27:57Z'),
(1151, 1, 1, 1151, 'notes', '2017-09-03T09:27:57Z'),
(1152, 1, 1, 1152, 'notes', '2017-09-03T09:27:57Z'),
(1153, 1, 1, 1153, 'notes', '2017-09-03T09:27:57Z'),
(1154, 1, 1, 1154, 'notes', '2017-09-03T09:27:57Z'),
(1155, 1, 1, 1155, 'notes', '2017-09-03T09:27:57Z'),
(1156, 1, 1, 1156, 'notes', '2017-09-03T09:27:57Z'),
(1157, 1, 1, 1157, 'notes', '2017-09-03T09:27:57Z'),
(1158, 1, 1, 1158, 'notes', '2017-09-03T09:27:57Z'),
(1159, 1, 1, 1159, 'notes', '2017-09-03T09:27:57Z'),
(1160, 1, 1, 1160, 'notes', '2017-09-03T09:27:57Z'),
(1161, 1, 1, 1161, 'notes', '2017-09-03T09:27:57Z'),
(1162, 1, 1, 1162, 'notes', '2017-09-03T09:27:57Z'),
(1163, 1, 1, 1163, 'notes', '2017-09-03T09:27:57Z'),
(1164, 1, 1, 1164, 'notes', '2017-09-03T09:27:57Z'),
(1165, 1, 1, 1165, 'notes', '2017-09-03T09:27:57Z'),
(1166, 1, 1, 1166, 'notes', '2017-09-03T09:27:57Z'),
(1167, 1, 1, 1167, 'notes', '2017-09-03T09:27:57Z'),
(1168, 1, 1, 1168, 'notes', '2017-09-03T09:27:57Z'),
(1169, 1, 1, 1169, 'notes', '2017-09-03T09:27:57Z'),
(1170, 1, 1, 1170, 'notes', '2017-09-03T09:27:57Z'),
(1171, 1, 1, 1171, 'notes', '2017-09-03T09:27:57Z'),
(1172, 1, 1, 1172, 'notes', '2017-09-03T09:27:57Z'),
(1173, 1, 1, 1173, 'notes', '2017-09-03T09:27:57Z'),
(1174, 1, 1, 1174, 'notes', '2017-09-03T09:27:57Z'),
(1175, 1, 1, 1175, 'notes', '2017-09-03T09:27:57Z'),
(1176, 1, 1, 1176, 'notes', '2017-09-03T09:27:57Z'),
(1177, 1, 1, 1177, 'notes', '2017-09-03T09:27:57Z'),
(1178, 1, 1, 1178, 'notes', '2017-09-03T09:27:57Z'),
(1179, 1, 1, 1179, 'notes', '2017-09-03T09:27:57Z'),
(1180, 1, 1, 1180, 'notes', '2017-09-03T09:27:57Z'),
(1181, 1, 1, 1181, 'notes', '2017-09-03T09:27:57Z'),
(1182, 1, 1, 1182, 'notes', '2017-09-03T09:27:57Z'),
(1183, 1, 1, 1183, 'notes', '2017-09-03T09:27:57Z'),
(1184, 1, 1, 1184, 'notes', '2017-09-03T09:27:57Z'),
(1185, 1, 1, 1185, 'notes', '2017-09-03T09:27:57Z'),
(1186, 1, 1, 1186, 'notes', '2017-09-03T09:27:57Z'),
(1187, 1, 1, 1187, 'notes', '2017-09-03T09:27:57Z'),
(1188, 1, 1, 1188, 'notes', '2017-09-03T09:27:57Z'),
(1189, 1, 1, 1189, 'notes', '2017-09-03T09:27:57Z'),
(1190, 1, 1, 1190, 'notes', '2017-09-03T09:27:57Z'),
(1191, 1, 1, 1191, 'notes', '2017-09-03T09:27:57Z'),
(1192, 1, 1, 1192, 'notes', '2017-09-03T09:27:57Z'),
(1193, 1, 1, 1193, 'notes', '2017-09-03T09:27:57Z'),
(1194, 1, 1, 1194, 'notes', '2017-09-03T09:27:57Z'),
(1195, 1, 1, 1195, 'notes', '2017-09-03T09:27:57Z'),
(1196, 1, 1, 1196, 'notes', '2017-09-03T09:27:57Z'),
(1197, 1, 1, 1197, 'notes', '2017-09-03T09:27:57Z'),
(1198, 1, 1, 1198, 'notes', '2017-09-03T09:27:57Z'),
(1199, 1, 1, 1199, 'notes', '2017-09-03T09:27:57Z'),
(1200, 1, 1, 1200, 'notes', '2017-09-03T09:27:57Z'),
(1201, 1, 1, 1201, 'notes', '2017-09-03T09:27:57Z'),
(1202, 1, 1, 1202, 'notes', '2017-09-03T09:27:57Z'),
(1203, 1, 1, 1203, 'notes', '2017-09-03T09:27:57Z'),
(1204, 1, 1, 1204, 'notes', '2017-09-03T09:27:57Z'),
(1205, 1, 1, 1205, 'notes', '2017-09-03T09:27:57Z'),
(1206, 1, 1, 1206, 'notes', '2017-09-03T09:27:57Z'),
(1207, 1, 1, 1207, 'notes', '2017-09-03T09:27:57Z'),
(1208, 1, 1, 1208, 'notes', '2017-09-03T09:27:57Z'),
(1209, 1, 1, 1209, 'notes', '2017-09-03T09:27:57Z'),
(1210, 1, 1, 1210, 'notes', '2017-09-03T09:27:57Z'),
(1211, 1, 1, 1211, 'notes', '2017-09-03T09:27:57Z'),
(1212, 1, 1, 1212, 'notes', '2017-09-03T09:27:57Z'),
(1213, 1, 1, 1213, 'notes', '2017-09-03T09:27:57Z'),
(1214, 1, 1, 1214, 'notes', '2017-09-03T09:27:57Z'),
(1215, 1, 1, 1215, 'notes', '2017-09-03T09:27:57Z'),
(1216, 1, 1, 1216, 'notes', '2017-09-03T09:27:57Z'),
(1217, 1, 1, 1217, 'notes', '2017-09-03T09:27:57Z'),
(1218, 1, 1, 1218, 'notes', '2017-09-03T09:27:57Z'),
(1219, 1, 1, 1219, 'notes', '2017-09-03T09:27:57Z'),
(1220, 1, 1, 1220, 'notes', '2017-09-03T09:27:57Z'),
(1221, 1, 1, 1221, 'notes', '2017-09-03T09:27:57Z'),
(1222, 1, 1, 1222, 'notes', '2017-09-03T09:27:57Z'),
(1223, 1, 1, 1223, 'notes', '2017-09-03T09:27:57Z'),
(1224, 1, 1, 1224, 'notes', '2017-09-03T09:27:57Z'),
(1225, 1, 1, 1225, 'notes', '2017-09-03T09:27:57Z'),
(1226, 1, 1, 1226, 'notes', '2017-09-03T09:27:57Z'),
(1227, 1, 1, 1227, 'notes', '2017-09-03T09:27:57Z'),
(1228, 1, 1, 1228, 'notes', '2017-09-03T09:27:57Z'),
(1229, 1, 1, 1229, 'notes', '2017-09-03T09:27:57Z'),
(1230, 1, 1, 1230, 'notes', '2017-09-03T09:27:57Z'),
(1231, 1, 1, 1231, 'notes', '2017-09-03T09:27:57Z'),
(1232, 1, 1, 1232, 'notes', '2017-09-03T09:27:57Z'),
(1233, 1, 1, 1233, 'notes', '2017-09-03T09:27:57Z'),
(1234, 1, 1, 1234, 'notes', '2017-09-03T09:27:57Z'),
(1235, 1, 1, 1235, 'notes', '2017-09-03T09:27:57Z'),
(1236, 1, 1, 1236, 'notes', '2017-09-03T09:27:57Z'),
(1237, 1, 1, 1237, 'notes', '2017-09-03T09:27:57Z'),
(1238, 1, 1, 1238, 'notes', '2017-09-03T09:27:57Z'),
(1239, 1, 1, 1239, 'notes', '2017-09-03T09:27:57Z'),
(1240, 1, 1, 1240, 'notes', '2017-09-03T09:27:57Z'),
(1241, 1, 1, 1241, 'notes', '2017-09-03T09:27:57Z'),
(1242, 1, 1, 1242, 'notes', '2017-09-03T09:27:57Z'),
(1243, 1, 1, 1243, 'notes', '2017-09-03T09:27:57Z'),
(1244, 1, 1, 1244, 'notes', '2017-09-03T09:27:57Z'),
(1245, 1, 1, 1245, 'notes', '2017-09-03T09:27:57Z'),
(1246, 1, 1, 1246, 'notes', '2017-09-03T09:27:57Z'),
(1247, 1, 1, 1247, 'notes', '2017-09-03T09:27:57Z'),
(1248, 1, 1, 1248, 'notes', '2017-09-03T09:27:57Z'),
(1249, 1, 1, 1249, 'notes', '2017-09-03T09:27:57Z'),
(1250, 1, 1, 1250, 'notes', '2017-09-03T09:27:57Z'),
(1251, 1, 1, 1251, 'notes', '2017-09-03T09:27:57Z'),
(1252, 1, 1, 1252, 'notes', '2017-09-03T09:27:57Z'),
(1253, 1, 1, 1253, 'notes', '2017-09-03T09:27:57Z'),
(1254, 1, 1, 1254, 'notes', '2017-09-03T09:27:57Z'),
(1255, 1, 1, 1255, 'notes', '2017-09-03T09:27:57Z'),
(1256, 1, 1, 1256, 'notes', '2017-09-03T09:27:57Z'),
(1257, 1, 1, 1257, 'notes', '2017-09-03T09:27:57Z'),
(1258, 1, 1, 1258, 'notes', '2017-09-03T09:27:57Z'),
(1259, 1, 1, 1259, 'notes', '2017-09-03T09:27:57Z'),
(1260, 1, 1, 1260, 'notes', '2017-09-03T09:27:57Z'),
(1261, 1, 1, 1261, 'notes', '2017-09-03T09:27:57Z'),
(1262, 1, 1, 1262, 'notes', '2017-09-03T09:27:57Z'),
(1263, 1, 1, 1263, 'notes', '2017-09-03T09:27:57Z'),
(1264, 1, 1, 1264, 'notes', '2017-09-03T09:27:57Z'),
(1265, 1, 1, 1265, 'notes', '2017-09-03T09:27:57Z'),
(1266, 1, 1, 1266, 'notes', '2017-09-03T09:27:57Z'),
(1267, 1, 1, 1267, 'notes', '2017-09-03T09:27:57Z'),
(1268, 1, 1, 1268, 'notes', '2017-09-03T09:27:57Z'),
(1269, 1, 1, 1269, 'notes', '2017-09-03T09:27:57Z'),
(1270, 1, 1, 1270, 'notes', '2017-09-03T09:27:57Z'),
(1271, 1, 1, 1271, 'notes', '2017-09-03T09:27:57Z'),
(1272, 1, 1, 1272, 'notes', '2017-09-03T09:27:57Z'),
(1273, 1, 1, 1273, 'notes', '2017-09-03T09:27:57Z'),
(1274, 1, 1, 1274, 'notes', '2017-09-03T09:27:57Z'),
(1275, 1, 1, 1275, 'notes', '2017-09-03T09:27:57Z'),
(1276, 1, 1, 1276, 'notes', '2017-09-03T09:27:57Z'),
(1277, 1, 1, 1277, 'notes', '2017-09-03T09:27:57Z'),
(1278, 1, 1, 1278, 'notes', '2017-09-03T09:27:57Z'),
(1279, 1, 1, 1279, 'notes', '2017-09-03T09:27:57Z'),
(1280, 1, 1, 1280, 'notes', '2017-09-03T09:27:57Z'),
(1281, 1, 1, 1281, 'notes', '2017-09-03T09:27:57Z'),
(1282, 1, 1, 1282, 'notes', '2017-09-03T09:27:57Z'),
(1283, 1, 1, 1283, 'notes', '2017-09-03T09:27:57Z'),
(1284, 1, 1, 1284, 'notes', '2017-09-03T09:27:57Z'),
(1285, 1, 1, 1285, 'notes', '2017-09-03T09:27:57Z'),
(1286, 1, 1, 1286, 'notes', '2017-09-03T09:27:57Z'),
(1287, 1, 1, 1287, 'notes', '2017-09-03T09:27:57Z'),
(1288, 1, 1, 1288, 'notes', '2017-09-03T09:27:57Z'),
(1289, 1, 1, 1289, 'notes', '2017-09-03T09:27:57Z'),
(1290, 2, 1, 1290, 'notes', '2017-09-03T09:27:57Z'),
(1291, 1, 1, 1291, 'notes', '2017-09-03T09:27:57Z'),
(1292, 1, 1, 1292, 'notes', '2017-09-03T09:27:57Z'),
(1293, 1, 1, 1293, 'notes', '2017-09-03T09:27:57Z'),
(1294, 1, 1, 1294, 'notes', '2017-09-03T09:27:57Z'),
(1295, 1, 1, 1295, 'notes', '2017-09-03T09:27:57Z'),
(1296, 1, 1, 1296, 'notes', '2017-09-03T09:27:57Z'),
(1297, 1, 1, 1297, 'notes', '2017-09-03T09:27:57Z'),
(1298, 1, 1, 1298, 'notes', '2017-09-03T09:27:57Z'),
(1299, 1, 1, 1299, 'notes', '2017-09-03T09:27:57Z'),
(1300, 1, 1, 1300, 'notes', '2017-09-03T09:27:57Z'),
(1301, 1, 1, 1301, 'notes', '2017-09-03T09:27:57Z'),
(1302, 1, 1, 1302, 'notes', '2017-09-03T09:27:57Z'),
(1303, 1, 1, 1303, 'notes', '2017-09-03T09:27:57Z'),
(1304, 1, 1, 1304, 'notes', '2017-09-03T09:27:57Z'),
(1305, 1, 1, 1305, 'notes', '2017-09-03T09:27:57Z'),
(1306, 1, 1, 1306, 'notes', '2017-09-03T09:27:57Z'),
(1307, 1, 1, 1307, 'notes', '2017-09-03T09:27:57Z'),
(1308, 1, 1, 1308, 'notes', '2017-09-03T09:27:57Z'),
(1309, 1, 1, 1309, 'notes', '2017-09-03T09:27:57Z'),
(1310, 1, 1, 1310, 'notes', '2017-09-03T09:27:57Z'),
(1311, 1, 1, 1311, 'notes', '2017-09-03T09:27:57Z'),
(1312, 1, 1, 1312, 'notes', '2017-09-03T09:27:57Z'),
(1313, 1, 1, 1313, 'notes', '2017-09-03T09:27:57Z'),
(1314, 1, 1, 1314, 'notes', '2017-09-03T09:27:57Z'),
(1315, 1, 1, 1315, 'notes', '2017-09-03T09:27:57Z'),
(1316, 1, 1, 1316, 'notes', '2017-09-03T09:27:57Z'),
(1317, 1, 1, 1317, 'notes', '2017-09-03T09:27:57Z'),
(1318, 1, 1, 1318, 'notes', '2017-09-03T09:27:57Z'),
(1319, 1, 1, 1319, 'notes', '2017-09-03T09:27:57Z'),
(1320, 1, 1, 1320, 'notes', '2017-09-03T09:27:57Z'),
(1321, 1, 1, 1321, 'notes', '2017-09-03T09:27:57Z'),
(1322, 1, 1, 1322, 'notes', '2017-09-03T09:27:57Z'),
(1323, 1, 1, 1323, 'notes', '2017-09-03T09:27:57Z'),
(1324, 1, 1, 1324, 'notes', '2017-09-03T09:27:57Z'),
(1325, 1, 1, 1325, 'notes', '2017-09-03T09:27:57Z'),
(1326, 1, 1, 1326, 'notes', '2017-09-03T09:27:57Z'),
(1327, 1, 1, 1327, 'notes', '2017-09-03T09:27:57Z'),
(1328, 1, 1, 1328, 'notes', '2017-09-03T09:27:57Z'),
(1329, 1, 1, 1329, 'notes', '2017-09-03T09:27:57Z'),
(1330, 1, 1, 1330, 'notes', '2017-09-03T09:27:57Z'),
(1331, 1, 1, 1331, 'notes', '2017-09-03T09:27:57Z'),
(1332, 1, 1, 1332, 'notes', '2017-09-03T09:27:57Z'),
(1333, 1, 1, 1333, 'notes', '2017-09-03T09:27:57Z'),
(1334, 1, 1, 1334, 'notes', '2017-09-03T09:27:57Z'),
(1335, 1, 1, 1335, 'notes', '2017-09-03T09:27:57Z'),
(1336, 1, 1, 1336, 'notes', '2017-09-03T09:27:57Z'),
(1337, 1, 1, 1337, 'notes', '2017-09-03T09:27:57Z'),
(1338, 1, 1, 1338, 'notes', '2017-09-03T09:27:57Z'),
(1339, 1, 1, 1339, 'notes', '2017-09-03T09:27:57Z'),
(1340, 1, 1, 1340, 'notes', '2017-09-03T09:27:57Z'),
(1341, 1, 1, 1341, 'notes', '2017-09-03T09:27:57Z'),
(1342, 1, 1, 1342, 'notes', '2017-09-03T09:27:57Z'),
(1343, 1, 1, 1343, 'notes', '2017-09-03T09:27:57Z'),
(1344, 1, 1, 1344, 'notes', '2017-09-03T09:27:57Z'),
(1345, 1, 1, 1345, 'notes', '2017-09-03T09:27:57Z'),
(1346, 1, 1, 1346, 'notes', '2017-09-03T09:27:57Z'),
(1347, 1, 1, 1347, 'notes', '2017-09-03T09:27:57Z'),
(1348, 1, 1, 1348, 'notes', '2017-09-03T09:27:57Z'),
(1349, 1, 1, 1349, 'notes', '2017-09-03T09:27:57Z'),
(1350, 1, 1, 1350, 'notes', '2017-09-03T09:27:57Z'),
(1351, 1, 1, 1351, 'notes', '2017-09-03T09:27:57Z'),
(1352, 1, 1, 1352, 'notes', '2017-09-03T09:27:57Z'),
(1353, 1, 1, 1353, 'notes', '2017-09-03T09:27:57Z'),
(1354, 1, 1, 1354, 'notes', '2017-09-03T09:27:57Z'),
(1355, 1, 1, 1355, 'notes', '2017-09-03T09:27:57Z'),
(1356, 1, 1, 1356, 'notes', '2017-09-03T09:27:57Z'),
(1357, 1, 1, 1357, 'notes', '2017-09-03T09:27:57Z'),
(1358, 1, 1, 1358, 'notes', '2017-09-03T09:27:57Z'),
(1359, 1, 1, 1359, 'notes', '2017-09-03T09:27:57Z'),
(1360, 1, 1, 1360, 'notes', '2017-09-03T09:27:57Z'),
(1361, 1, 1, 1361, 'notes', '2017-09-03T09:27:57Z'),
(1362, 1, 1, 1362, 'notes', '2017-09-03T09:27:57Z'),
(1363, 1, 1, 1363, 'notes', '2017-09-03T09:27:57Z'),
(1364, 1, 1, 1364, 'notes', '2017-09-03T09:27:57Z'),
(1365, 1, 1, 1365, 'notes', '2017-09-03T09:27:57Z'),
(1366, 1, 1, 1366, 'notes', '2017-09-03T09:27:57Z'),
(1367, 1, 1, 1367, 'notes', '2017-09-03T09:27:57Z'),
(1368, 1, 1, 1368, 'notes', '2017-09-03T09:27:57Z'),
(1369, 1, 1, 1369, 'notes', '2017-09-03T09:27:57Z'),
(1370, 1, 1, 1370, 'notes', '2017-09-03T09:27:57Z'),
(1371, 1, 1, 1371, 'notes', '2017-09-03T09:27:57Z'),
(1372, 1, 1, 1372, 'notes', '2017-09-03T09:27:57Z'),
(1373, 1, 1, 1373, 'notes', '2017-09-03T09:27:57Z'),
(1374, 1, 1, 1374, 'notes', '2017-09-03T09:27:57Z'),
(1375, 1, 1, 1375, 'notes', '2017-09-03T09:27:57Z'),
(1376, 1, 1, 1376, 'notes', '2017-09-03T09:27:57Z'),
(1377, 1, 1, 1377, 'notes', '2017-09-03T09:27:57Z'),
(1378, 1, 1, 1378, 'notes', '2017-09-03T09:27:57Z'),
(1379, 1, 1, 1379, 'notes', '2017-09-03T09:27:57Z'),
(1380, 1, 1, 1380, 'notes', '2017-09-03T09:27:57Z'),
(1381, 1, 1, 1381, 'notes', '2017-09-03T09:27:57Z'),
(1382, 1, 1, 1382, 'notes', '2017-09-03T09:27:57Z'),
(1383, 1, 1, 1383, 'notes', '2017-09-03T09:27:57Z'),
(1384, 1, 1, 1384, 'notes', '2017-09-03T09:27:57Z'),
(1385, 1, 1, 1385, 'notes', '2017-09-03T09:27:57Z'),
(1386, 1, 1, 1386, 'notes', '2017-09-03T09:27:57Z'),
(1387, 1, 1, 1387, 'notes', '2017-09-03T09:27:57Z'),
(1388, 1, 1, 1388, 'notes', '2017-09-03T09:27:57Z'),
(1389, 1, 1, 1389, 'notes', '2017-09-03T09:27:57Z'),
(1390, 1, 1, 1390, 'notes', '2017-09-03T09:27:57Z'),
(1391, 1, 1, 1391, 'notes', '2017-09-03T09:27:57Z'),
(1392, 1, 1, 1392, 'notes', '2017-09-03T09:27:57Z'),
(1393, 1, 1, 1393, 'notes', '2017-09-03T09:27:57Z'),
(1394, 1, 1, 1394, 'notes', '2017-09-03T09:27:57Z'),
(1395, 1, 1, 1395, 'notes', '2017-09-03T09:27:57Z'),
(1396, 1, 1, 1396, 'notes', '2017-09-03T09:27:57Z'),
(1397, 1, 1, 1397, 'notes', '2017-09-03T09:27:57Z'),
(1398, 1, 1, 1398, 'notes', '2017-09-03T09:27:57Z'),
(1399, 1, 1, 1399, 'notes', '2017-09-03T09:27:57Z'),
(1400, 1, 1, 1400, 'notes', '2017-09-03T09:27:57Z'),
(1401, 1, 1, 1401, 'notes', '2017-09-03T09:27:57Z'),
(1402, 1, 1, 1402, 'notes', '2017-09-03T09:27:57Z'),
(1403, 1, 1, 1403, 'notes', '2017-09-03T09:27:57Z'),
(1404, 1, 1, 1404, 'notes', '2017-09-03T09:27:57Z'),
(1405, 1, 1, 1405, 'notes', '2017-09-03T09:27:57Z'),
(1406, 1, 1, 1406, 'notes', '2017-09-03T09:27:57Z'),
(1407, 1, 1, 1407, 'notes', '2017-09-03T09:27:57Z'),
(1408, 1, 1, 1408, 'notes', '2017-09-03T09:27:57Z'),
(1409, 1, 1, 1409, 'notes', '2017-09-03T09:27:57Z'),
(1410, 1, 1, 1410, 'notes', '2017-09-03T09:27:57Z'),
(1411, 1, 1, 1411, 'notes', '2017-09-03T09:27:57Z'),
(1412, 1, 1, 1412, 'notes', '2017-09-03T09:27:57Z'),
(1413, 1, 1, 1413, 'notes', '2017-09-03T09:27:57Z'),
(1414, 1, 1, 1414, 'notes', '2017-09-03T09:27:57Z'),
(1415, 1, 1, 1415, 'notes', '2017-09-03T09:27:57Z'),
(1416, 1, 1, 1416, 'notes', '2017-09-03T09:27:57Z'),
(1417, 1, 1, 1417, 'notes', '2017-09-03T09:27:57Z'),
(1418, 1, 1, 1418, 'notes', '2017-09-03T09:27:57Z'),
(1419, 1, 1, 1419, 'notes', '2017-09-03T09:27:57Z'),
(1420, 1, 1, 1420, 'notes', '2017-09-03T09:27:57Z'),
(1421, 1, 1, 1421, 'notes', '2017-09-03T09:27:57Z'),
(1422, 1, 1, 1422, 'notes', '2017-09-03T09:27:57Z'),
(1423, 1, 1, 1423, 'notes', '2017-09-03T09:27:57Z'),
(1424, 1, 1, 1424, 'notes', '2017-09-03T09:27:57Z'),
(1425, 1, 1, 1425, 'notes', '2017-09-03T09:27:57Z'),
(1426, 1, 1, 1426, 'notes', '2017-09-03T09:27:57Z'),
(1427, 1, 1, 1427, 'notes', '2017-09-03T09:27:57Z'),
(1428, 1, 1, 1428, 'notes', '2017-09-03T09:27:57Z'),
(1429, 1, 1, 1429, 'notes', '2017-09-03T09:27:57Z'),
(1430, 1, 1, 1430, 'notes', '2017-09-03T09:27:57Z'),
(1431, 1, 1, 1431, 'notes', '2017-09-03T09:27:57Z'),
(1432, 1, 1, 1432, 'notes', '2017-09-03T09:27:57Z'),
(1433, 1, 1, 1433, 'notes', '2017-09-03T09:27:57Z'),
(1434, 1, 1, 1434, 'notes', '2017-09-03T09:27:57Z'),
(1435, 1, 1, 1435, 'notes', '2017-09-03T09:27:57Z'),
(1436, 1, 1, 1436, 'notes', '2017-09-03T09:27:57Z'),
(1437, 1, 1, 1437, 'notes', '2017-09-03T09:27:57Z'),
(1438, 1, 1, 1438, 'notes', '2017-09-03T09:27:57Z'),
(1439, 1, 1, 1439, 'notes', '2017-09-03T09:27:57Z'),
(1440, 1, 1, 1440, 'notes', '2017-09-03T09:27:57Z'),
(1441, 1, 1, 1441, 'notes', '2017-09-03T09:27:57Z'),
(1442, 1, 1, 1442, 'notes', '2017-09-03T09:27:57Z'),
(1443, 1, 1, 1443, 'notes', '2017-09-03T09:27:57Z'),
(1444, 1, 1, 1444, 'notes', '2017-09-03T09:27:57Z'),
(1445, 1, 1, 1445, 'notes', '2017-09-03T09:27:57Z'),
(1446, 1, 1, 1446, 'notes', '2017-09-03T09:27:57Z'),
(1447, 1, 1, 1447, 'notes', '2017-09-03T09:27:57Z'),
(1448, 1, 1, 1448, 'notes', '2017-09-03T09:27:57Z'),
(1449, 1, 1, 1449, 'notes', '2017-09-03T09:27:57Z'),
(1450, 1, 1, 1450, 'notes', '2017-09-03T09:27:57Z'),
(1451, 1, 1, 1451, 'notes', '2017-09-03T09:27:57Z'),
(1452, 1, 1, 1452, 'notes', '2017-09-03T09:27:57Z'),
(1453, 1, 1, 1453, 'notes', '2017-09-03T09:27:57Z'),
(1454, 1, 1, 1454, 'notes', '2017-09-03T09:27:57Z'),
(1455, 1, 1, 1455, 'notes', '2017-09-03T09:27:57Z'),
(1456, 1, 1, 1456, 'notes', '2017-09-03T09:27:57Z'),
(1457, 1, 1, 1457, 'notes', '2017-09-03T09:27:57Z'),
(1458, 1, 1, 1458, 'notes', '2017-09-03T09:27:57Z'),
(1459, 1, 1, 1459, 'notes', '2017-09-03T09:27:57Z'),
(1460, 1, 1, 1460, 'notes', '2017-09-03T09:27:57Z'),
(1461, 1, 1, 1461, 'notes', '2017-09-03T09:27:57Z'),
(1462, 1, 1, 1462, 'notes', '2017-09-03T09:27:57Z'),
(1463, 1, 1, 1463, 'notes', '2017-09-03T09:27:57Z'),
(1464, 1, 1, 1464, 'notes', '2017-09-03T09:27:57Z'),
(1465, 1, 1, 1465, 'notes', '2017-09-03T09:27:57Z'),
(1466, 1, 1, 1466, 'notes', '2017-09-03T09:27:57Z'),
(1467, 1, 1, 1467, 'notes', '2017-09-03T09:27:57Z'),
(1468, 1, 1, 1468, 'notes', '2017-09-03T09:27:57Z'),
(1469, 1, 1, 1469, 'notes', '2017-09-03T09:27:57Z'),
(1470, 1, 1, 1470, 'notes', '2017-09-03T09:27:57Z'),
(1471, 1, 1, 1471, 'notes', '2017-09-03T09:27:57Z'),
(1472, 1, 1, 1472, 'notes', '2017-09-03T09:27:57Z'),
(1473, 1, 1, 1473, 'notes', '2017-09-03T09:27:57Z'),
(1474, 1, 1, 1474, 'notes', '2017-09-03T09:27:57Z'),
(1475, 1, 1, 1475, 'notes', '2017-09-03T09:27:57Z'),
(1476, 1, 1, 1476, 'notes', '2017-09-03T09:27:57Z'),
(1477, 1, 1, 1477, 'notes', '2017-09-03T09:27:57Z'),
(1478, 1, 1, 1478, 'notes', '2017-09-03T09:27:57Z'),
(1479, 1, 1, 1479, 'notes', '2017-09-03T09:27:57Z'),
(1480, 1, 1, 1480, 'notes', '2017-09-03T09:27:57Z'),
(1481, 1, 1, 1481, 'notes', '2017-09-03T09:27:57Z'),
(1482, 1, 1, 1482, 'notes', '2017-09-03T09:27:57Z'),
(1483, 1, 1, 1483, 'notes', '2017-09-03T09:27:57Z'),
(1484, 1, 1, 1484, 'notes', '2017-09-03T09:27:57Z'),
(1485, 2, 1, 1485, 'notes', '2017-09-03T09:27:57Z'),
(1486, 1, 1, 1486, 'notes', '2017-09-03T09:27:57Z'),
(1487, 1, 1, 1487, 'notes', '2017-09-03T09:27:57Z'),
(1488, 1, 1, 1488, 'notes', '2017-09-03T09:27:57Z'),
(1489, 1, 1, 1489, 'notes', '2017-09-03T09:27:57Z'),
(1490, 1, 1, 1490, 'notes', '2017-09-03T09:27:57Z'),
(1491, 1, 1, 1491, 'notes', '2017-09-03T09:27:57Z'),
(1492, 1, 1, 1492, 'notes', '2017-09-03T09:27:57Z'),
(1493, 1, 1, 1493, 'notes', '2017-09-03T09:27:57Z'),
(1494, 1, 1, 1494, 'notes', '2017-09-03T09:27:57Z'),
(1495, 1, 1, 1495, 'notes', '2017-09-03T09:27:57Z'),
(1496, 1, 1, 1496, 'notes', '2017-09-03T09:27:57Z'),
(1497, 1, 1, 1497, 'notes', '2017-09-03T09:27:57Z'),
(1498, 1, 1, 1498, 'notes', '2017-09-03T09:27:57Z'),
(1499, 1, 1, 1499, 'notes', '2017-09-03T09:27:57Z'),
(1500, 1, 1, 1500, 'notes', '2017-09-03T09:27:57Z'),
(1501, 1, 1, 1501, 'notes', '2017-09-03T09:27:57Z'),
(1502, 1, 1, 1502, 'notes', '2017-09-03T09:27:57Z'),
(1503, 1, 1, 1503, 'notes', '2017-09-03T09:27:57Z'),
(1504, 1, 1, 1504, 'notes', '2017-09-03T09:27:57Z'),
(1505, 1, 1, 1505, 'notes', '2017-09-03T09:27:57Z'),
(1506, 1, 1, 1506, 'notes', '2017-09-03T09:27:57Z'),
(1507, 1, 1, 1507, 'notes', '2017-09-03T09:27:57Z'),
(1508, 1, 1, 1508, 'notes', '2017-09-03T09:27:57Z'),
(1509, 1, 1, 1509, 'notes', '2017-09-03T09:27:57Z'),
(1510, 1, 1, 1510, 'notes', '2017-09-03T09:27:57Z'),
(1511, 1, 1, 1511, 'notes', '2017-09-03T09:27:57Z'),
(1512, 1, 1, 1512, 'notes', '2017-09-03T09:27:57Z'),
(1513, 1, 1, 1513, 'notes', '2017-09-03T09:27:57Z'),
(1514, 1, 1, 1514, 'notes', '2017-09-03T09:27:57Z'),
(1515, 1, 1, 1515, 'notes', '2017-09-03T09:27:57Z'),
(1516, 1, 1, 1516, 'notes', '2017-09-03T09:27:57Z'),
(1517, 1, 1, 1517, 'notes', '2017-09-03T09:27:57Z'),
(1518, 1, 1, 1518, 'notes', '2017-09-03T09:27:57Z'),
(1519, 1, 1, 1519, 'notes', '2017-09-03T09:27:57Z'),
(1520, 1, 1, 1520, 'notes', '2017-09-03T09:27:57Z'),
(1521, 1, 1, 1521, 'notes', '2017-09-03T09:27:57Z'),
(1522, 1, 1, 1522, 'notes', '2017-09-03T09:27:57Z'),
(1523, 1, 1, 1523, 'notes', '2017-09-03T09:27:57Z'),
(1524, 1, 1, 1524, 'notes', '2017-09-03T09:27:57Z'),
(1525, 1, 1, 1525, 'notes', '2017-09-03T09:27:57Z'),
(1526, 1, 1, 1526, 'notes', '2017-09-03T09:27:57Z'),
(1527, 1, 1, 1527, 'notes', '2017-09-03T09:27:57Z'),
(1528, 1, 1, 1528, 'notes', '2017-09-03T09:27:57Z'),
(1529, 1, 1, 1529, 'notes', '2017-09-03T09:27:57Z'),
(1530, 1, 1, 1530, 'notes', '2017-09-03T09:27:57Z'),
(1531, 1, 1, 1531, 'notes', '2017-09-03T09:27:57Z'),
(1532, 1, 1, 1532, 'notes', '2017-09-03T09:27:57Z'),
(1533, 1, 1, 1533, 'notes', '2017-09-03T09:27:57Z'),
(1534, 1, 1, 1534, 'notes', '2017-09-03T09:27:57Z'),
(1535, 1, 1, 1535, 'notes', '2017-09-03T09:27:57Z'),
(1536, 1, 1, 1536, 'notes', '2017-09-03T09:27:57Z'),
(1537, 1, 1, 1537, 'notes', '2017-09-03T09:27:57Z'),
(1538, 1, 1, 1538, 'notes', '2017-09-03T09:27:57Z'),
(1539, 1, 1, 1539, 'notes', '2017-09-03T09:27:57Z'),
(1540, 1, 1, 1540, 'notes', '2017-09-03T09:27:57Z'),
(1541, 1, 1, 1541, 'notes', '2017-09-03T09:27:57Z'),
(1542, 1, 1, 1542, 'notes', '2017-09-03T09:27:57Z'),
(1543, 1, 1, 1543, 'notes', '2017-09-03T09:27:57Z'),
(1544, 1, 1, 1544, 'notes', '2017-09-03T09:27:57Z'),
(1545, 1, 1, 1545, 'notes', '2017-09-03T09:27:57Z'),
(1546, 1, 1, 1546, 'notes', '2017-09-03T09:27:57Z'),
(1547, 1, 1, 1547, 'notes', '2017-09-03T09:27:57Z'),
(1548, 1, 1, 1548, 'notes', '2017-09-03T09:27:57Z'),
(1549, 1, 1, 1549, 'notes', '2017-09-03T09:27:57Z'),
(1550, 1, 1, 1550, 'notes', '2017-09-03T09:27:57Z'),
(1551, 1, 1, 1551, 'notes', '2017-09-03T09:27:57Z'),
(1552, 1, 1, 1552, 'notes', '2017-09-03T09:27:57Z'),
(1553, 1, 1, 1553, 'notes', '2017-09-03T09:27:57Z'),
(1554, 1, 1, 1554, 'notes', '2017-09-03T09:27:57Z'),
(1555, 1, 1, 1555, 'notes', '2017-09-03T09:27:57Z'),
(1556, 1, 1, 1556, 'notes', '2017-09-03T09:27:57Z'),
(1557, 1, 1, 1557, 'notes', '2017-09-03T09:27:57Z'),
(1558, 1, 1, 1558, 'notes', '2017-09-03T09:27:57Z'),
(1559, 1, 1, 1559, 'notes', '2017-09-03T09:27:57Z'),
(1560, 1, 1, 1560, 'notes', '2017-09-03T09:27:57Z'),
(1561, 1, 1, 1561, 'notes', '2017-09-03T09:27:57Z'),
(1562, 1, 1, 1562, 'notes', '2017-09-03T09:27:57Z'),
(1563, 1, 1, 1563, 'notes', '2017-09-03T09:27:57Z'),
(1564, 1, 1, 1564, 'notes', '2017-09-03T09:27:57Z'),
(1565, 1, 1, 1565, 'notes', '2017-09-03T09:27:57Z'),
(1566, 1, 1, 1566, 'notes', '2017-09-03T09:27:57Z'),
(1567, 1, 1, 1567, 'notes', '2017-09-03T09:27:57Z'),
(1568, 1, 1, 1568, 'notes', '2017-09-03T09:27:57Z'),
(1569, 1, 1, 1569, 'notes', '2017-09-03T09:27:57Z'),
(1570, 1, 1, 1570, 'notes', '2017-09-03T09:27:57Z'),
(1571, 1, 1, 1571, 'notes', '2017-09-03T09:27:57Z'),
(1572, 1, 1, 1572, 'notes', '2017-09-03T09:27:57Z'),
(1573, 1, 1, 1573, 'notes', '2017-09-03T09:27:57Z'),
(1574, 1, 1, 1574, 'notes', '2017-09-03T09:27:57Z'),
(1575, 1, 1, 1575, 'notes', '2017-09-03T09:27:57Z'),
(1576, 1, 1, 1576, 'notes', '2017-09-03T09:27:57Z'),
(1577, 1, 1, 1577, 'notes', '2017-09-03T09:27:57Z'),
(1578, 1, 1, 1578, 'notes', '2017-09-03T09:27:57Z'),
(1579, 1, 1, 1579, 'notes', '2017-09-03T09:27:57Z'),
(1580, 1, 1, 1580, 'notes', '2017-09-03T09:27:57Z'),
(1581, 1, 1, 1581, 'notes', '2017-09-03T09:27:57Z'),
(1582, 1, 1, 1582, 'notes', '2017-09-03T09:27:57Z'),
(1583, 1, 1, 1583, 'notes', '2017-09-03T09:27:57Z'),
(1584, 1, 1, 1584, 'notes', '2017-09-03T09:27:57Z'),
(1585, 1, 1, 1585, 'notes', '2017-09-03T09:27:57Z'),
(1586, 1, 1, 1586, 'notes', '2017-09-03T09:27:57Z'),
(1587, 1, 1, 1587, 'notes', '2017-09-03T09:27:57Z'),
(1588, 1, 1, 1588, 'notes', '2017-09-03T09:27:57Z'),
(1589, 1, 1, 1589, 'notes', '2017-09-03T09:27:57Z'),
(1590, 1, 1, 1590, 'notes', '2017-09-03T09:27:57Z'),
(1591, 1, 1, 1591, 'notes', '2017-09-03T09:27:57Z'),
(1592, 1, 1, 1592, 'notes', '2017-09-03T09:27:57Z'),
(1593, 1, 1, 1593, 'notes', '2017-09-03T09:27:57Z'),
(1594, 1, 1, 1594, 'notes', '2017-09-03T09:27:57Z'),
(1595, 1, 1, 1595, 'notes', '2017-09-03T09:27:57Z'),
(1596, 1, 1, 1596, 'notes', '2017-09-03T09:27:57Z'),
(1597, 1, 1, 1597, 'notes', '2017-09-03T09:27:57Z'),
(1598, 1, 1, 1598, 'notes', '2017-09-03T09:27:57Z'),
(1599, 1, 1, 1599, 'notes', '2017-09-03T09:27:57Z'),
(1600, 1, 1, 1600, 'notes', '2017-09-03T09:27:57Z'),
(1601, 1, 1, 1601, 'notes', '2017-09-03T09:27:57Z'),
(1602, 1, 1, 1602, 'notes', '2017-09-03T09:27:57Z'),
(1603, 1, 1, 1603, 'notes', '2017-09-03T09:27:57Z'),
(1604, 1, 1, 1604, 'notes', '2017-09-03T09:27:57Z'),
(1605, 1, 1, 1605, 'notes', '2017-09-03T09:27:57Z'),
(1606, 1, 1, 1606, 'notes', '2017-09-03T09:27:57Z'),
(1607, 1, 1, 1607, 'notes', '2017-09-03T09:27:57Z'),
(1608, 1, 1, 1608, 'notes', '2017-09-03T09:27:57Z'),
(1609, 1, 1, 1609, 'notes', '2017-09-03T09:27:57Z'),
(1610, 1, 1, 1610, 'notes', '2017-09-03T09:27:57Z'),
(1611, 1, 1, 1611, 'notes', '2017-09-03T09:27:57Z'),
(1612, 1, 1, 1612, 'notes', '2017-09-03T09:27:57Z'),
(1613, 1, 1, 1613, 'notes', '2017-09-03T09:27:57Z'),
(1614, 1, 1, 1614, 'notes', '2017-09-03T09:27:57Z'),
(1615, 1, 1, 1615, 'notes', '2017-09-03T09:27:57Z'),
(1616, 1, 1, 1616, 'notes', '2017-09-03T09:27:57Z'),
(1617, 1, 1, 1617, 'notes', '2017-09-03T09:27:57Z'),
(1618, 1, 1, 1618, 'notes', '2017-09-03T09:27:57Z'),
(1619, 1, 1, 1619, 'notes', '2017-09-03T09:27:57Z'),
(1620, 1, 1, 1620, 'notes', '2017-09-03T09:27:57Z'),
(1621, 1, 1, 1621, 'notes', '2017-09-03T09:27:57Z'),
(1622, 1, 1, 1622, 'notes', '2017-09-03T09:27:57Z'),
(1623, 1, 1, 1623, 'notes', '2017-09-03T09:27:57Z'),
(1624, 1, 1, 1624, 'notes', '2017-09-03T09:27:57Z'),
(1625, 1, 1, 1625, 'notes', '2017-09-03T09:27:57Z'),
(1626, 1, 1, 1626, 'notes', '2017-09-03T09:27:57Z'),
(1627, 1, 1, 1627, 'notes', '2017-09-03T09:27:57Z'),
(1628, 1, 1, 1628, 'notes', '2017-09-03T09:27:57Z'),
(1629, 1, 1, 1629, 'notes', '2017-09-03T09:27:57Z'),
(1630, 1, 1, 1630, 'notes', '2017-09-03T09:27:57Z'),
(1631, 1, 1, 1631, 'notes', '2017-09-03T09:27:57Z'),
(1632, 1, 1, 1632, 'notes', '2017-09-03T09:27:57Z'),
(1633, 1, 1, 1633, 'notes', '2017-09-03T09:27:57Z'),
(1634, 1, 1, 1634, 'notes', '2017-09-03T09:27:57Z'),
(1635, 1, 1, 1635, 'notes', '2017-09-03T09:27:57Z'),
(1636, 1, 1, 1636, 'notes', '2017-09-03T09:27:57Z'),
(1637, 1, 1, 1637, 'notes', '2017-09-03T09:27:57Z'),
(1638, 1, 1, 1638, 'notes', '2017-09-03T09:27:57Z'),
(1639, 1, 1, 1639, 'notes', '2017-09-03T09:27:57Z'),
(1640, 1, 1, 1640, 'notes', '2017-09-03T09:27:57Z'),
(1641, 1, 1, 1641, 'notes', '2017-09-03T09:27:57Z'),
(1642, 1, 1, 1642, 'notes', '2017-09-03T09:27:57Z'),
(1643, 1, 1, 1643, 'notes', '2017-09-03T09:27:57Z'),
(1644, 1, 1, 1644, 'notes', '2017-09-03T09:27:57Z'),
(1645, 1, 1, 1645, 'notes', '2017-09-03T09:27:57Z'),
(1646, 1, 1, 1646, 'notes', '2017-09-03T09:27:57Z'),
(1647, 1, 1, 1647, 'notes', '2017-09-03T09:27:57Z'),
(1648, 1, 1, 1648, 'notes', '2017-09-03T09:27:57Z'),
(1649, 1, 1, 1649, 'notes', '2017-09-03T09:27:57Z'),
(1650, 1, 1, 1650, 'notes', '2017-09-03T09:27:57Z'),
(1651, 1, 1, 1651, 'notes', '2017-09-03T09:27:57Z'),
(1652, 1, 1, 1652, 'notes', '2017-09-03T09:27:57Z'),
(1653, 1, 1, 1653, 'notes', '2017-09-03T09:27:57Z'),
(1654, 1, 1, 1654, 'notes', '2017-09-03T09:27:57Z'),
(1655, 1, 1, 1655, 'notes', '2017-09-03T09:27:57Z'),
(1656, 1, 1, 1656, 'notes', '2017-09-03T09:27:57Z'),
(1657, 1, 1, 1657, 'notes', '2017-09-03T09:27:57Z'),
(1658, 1, 1, 1658, 'notes', '2017-09-03T09:27:57Z'),
(1659, 1, 1, 1659, 'notes', '2017-09-03T09:27:57Z'),
(1660, 1, 1, 1660, 'notes', '2017-09-03T09:27:57Z'),
(1661, 1, 1, 1661, 'notes', '2017-09-03T09:27:57Z'),
(1662, 1, 1, 1662, 'notes', '2017-09-03T09:27:57Z'),
(1663, 1, 1, 1663, 'notes', '2017-09-03T09:27:57Z'),
(1664, 1, 1, 1664, 'notes', '2017-09-03T09:27:57Z'),
(1665, 1, 1, 1665, 'notes', '2017-09-03T09:27:57Z'),
(1666, 1, 1, 1666, 'notes', '2017-09-03T09:27:57Z'),
(1667, 1, 1, 1667, 'notes', '2017-09-03T09:27:57Z'),
(1668, 1, 1, 1668, 'notes', '2017-09-03T09:27:57Z'),
(1669, 1, 1, 1669, 'notes', '2017-09-03T09:27:57Z'),
(1670, 1, 1, 1670, 'notes', '2017-09-03T09:27:57Z'),
(1671, 1, 1, 1671, 'notes', '2017-09-03T09:27:57Z'),
(1672, 2, 1, 1672, 'notes', '2017-09-03T09:27:57Z'),
(1673, 1, 1, 1673, 'notes', '2017-09-03T09:27:57Z'),
(1674, 1, 1, 1674, 'notes', '2017-09-03T09:27:57Z'),
(1675, 1, 1, 1675, 'notes', '2017-09-03T09:27:57Z'),
(1676, 1, 1, 1676, 'notes', '2017-09-03T09:27:57Z'),
(1677, 1, 1, 1677, 'notes', '2017-09-03T09:27:57Z'),
(1678, 1, 1, 1678, 'notes', '2017-09-03T09:27:57Z'),
(1679, 1, 1, 1679, 'notes', '2017-09-03T09:27:57Z'),
(1680, 1, 1, 1680, 'notes', '2017-09-03T09:27:57Z'),
(1681, 1, 1, 1681, 'notes', '2017-09-03T09:27:57Z'),
(1682, 1, 1, 1682, 'notes', '2017-09-03T09:27:57Z'),
(1683, 1, 1, 1683, 'notes', '2017-09-03T09:27:57Z'),
(1684, 1, 1, 1684, 'notes', '2017-09-03T09:27:57Z'),
(1685, 1, 1, 1685, 'notes', '2017-09-03T09:27:57Z'),
(1686, 1, 1, 1686, 'notes', '2017-09-03T09:27:57Z'),
(1687, 1, 1, 1687, 'notes', '2017-09-03T09:27:57Z'),
(1688, 1, 1, 1688, 'notes', '2017-09-03T09:27:57Z'),
(1689, 1, 1, 1689, 'notes', '2017-09-03T09:27:57Z'),
(1690, 1, 1, 1690, 'notes', '2017-09-03T09:27:57Z'),
(1691, 1, 1, 1691, 'notes', '2017-09-03T09:27:57Z'),
(1692, 1, 1, 1692, 'notes', '2017-09-03T09:27:57Z'),
(1693, 1, 1, 1693, 'notes', '2017-09-03T09:27:57Z'),
(1694, 1, 1, 1694, 'notes', '2017-09-03T09:27:57Z'),
(1695, 1, 1, 1695, 'notes', '2017-09-03T09:27:57Z'),
(1696, 1, 1, 1696, 'notes', '2017-09-03T09:27:57Z'),
(1697, 1, 1, 1697, 'notes', '2017-09-03T09:27:57Z'),
(1698, 1, 1, 1698, 'notes', '2017-09-03T09:27:57Z'),
(1699, 1, 1, 1699, 'notes', '2017-09-03T09:27:57Z'),
(1700, 1, 1, 1700, 'notes', '2017-09-03T09:27:57Z'),
(1701, 1, 1, 1701, 'notes', '2017-09-03T09:27:57Z'),
(1702, 1, 1, 1702, 'notes', '2017-09-03T09:27:57Z'),
(1703, 1, 1, 1703, 'notes', '2017-09-03T09:27:57Z'),
(1704, 1, 1, 1704, 'notes', '2017-09-03T09:27:57Z'),
(1705, 1, 1, 1705, 'notes', '2017-09-03T09:27:57Z'),
(1706, 1, 1, 1706, 'notes', '2017-09-03T09:27:57Z'),
(1707, 1, 1, 1707, 'notes', '2017-09-03T09:27:57Z'),
(1708, 1, 1, 1708, 'notes', '2017-09-03T09:27:57Z'),
(1709, 1, 1, 1709, 'notes', '2017-09-03T09:27:57Z'),
(1710, 1, 1, 1710, 'notes', '2017-09-03T09:27:57Z'),
(1711, 1, 1, 1711, 'notes', '2017-09-03T09:27:57Z'),
(1712, 1, 1, 1712, 'notes', '2017-09-03T09:27:57Z'),
(1713, 1, 1, 1713, 'notes', '2017-09-03T09:27:57Z'),
(1714, 1, 1, 1714, 'notes', '2017-09-03T09:27:57Z'),
(1715, 1, 1, 1715, 'notes', '2017-09-03T09:27:57Z'),
(1716, 1, 1, 1716, 'notes', '2017-09-03T09:27:57Z'),
(1717, 1, 1, 1717, 'notes', '2017-09-03T09:27:57Z'),
(1718, 1, 1, 1718, 'notes', '2017-09-03T09:27:57Z'),
(1719, 1, 1, 1719, 'notes', '2017-09-03T09:27:57Z'),
(1720, 1, 1, 1720, 'notes', '2017-09-03T09:27:57Z'),
(1721, 2, 1, 1721, 'notes', '2017-09-03T09:27:57Z'),
(1722, 2, 1, 1722, 'notes', '2017-09-03T09:27:57Z'),
(1723, 1, 1, 1723, 'notes', '2017-09-03T09:27:57Z'),
(1724, 1, 1, 1724, 'notes', '2017-09-03T09:27:57Z'),
(1725, 1, 1, 1725, 'notes', '2017-09-03T09:27:57Z'),
(1726, 2, 1, 1726, 'notes', '2017-09-03T09:27:57Z'),
(1727, 1, 1, 1727, 'notes', '2017-09-03T09:27:57Z'),
(1728, 1, 1, 1728, 'notes', '2017-09-03T09:27:57Z'),
(1729, 1, 1, 1729, 'notes', '2017-09-03T09:27:57Z'),
(1730, 1, 1, 1730, 'notes', '2017-09-03T09:27:57Z'),
(1731, 1, 1, 1731, 'notes', '2017-09-03T09:27:57Z'),
(1732, 1, 1, 1732, 'notes', '2017-09-03T09:27:57Z'),
(1733, 1, 1, 1733, 'notes', '2017-09-03T09:27:57Z'),
(1734, 1, 1, 1734, 'notes', '2017-09-03T09:27:57Z'),
(1735, 1, 1, 1735, 'notes', '2017-09-03T09:27:57Z'),
(1736, 1, 1, 1736, 'notes', '2017-09-03T09:27:57Z'),
(1737, 1, 1, 1737, 'notes', '2017-09-03T09:27:57Z'),
(1738, 1, 1, 1738, 'notes', '2017-09-03T09:27:57Z'),
(1739, 1, 1, 1739, 'notes', '2017-09-03T09:27:57Z'),
(1740, 1, 1, 1740, 'notes', '2017-09-03T09:27:57Z'),
(1741, 1, 1, 1741, 'notes', '2017-09-03T09:27:57Z'),
(1742, 2, 1, 1742, 'notes', '2017-09-03T09:27:57Z'),
(1743, 1, 1, 1743, 'notes', '2017-09-03T09:27:57Z'),
(1744, 1, 1, 1744, 'notes', '2017-09-03T09:27:57Z'),
(1745, 1, 1, 1745, 'notes', '2017-09-03T09:27:57Z'),
(1746, 1, 1, 1746, 'notes', '2017-09-03T09:27:57Z'),
(1747, 1, 1, 1747, 'notes', '2017-09-03T09:27:57Z'),
(1748, 1, 1, 1748, 'notes', '2017-09-03T09:27:57Z'),
(1749, 1, 1, 1749, 'notes', '2017-09-03T09:27:57Z'),
(1750, 1, 1, 1750, 'notes', '2017-09-03T09:27:57Z'),
(1751, 1, 1, 1751, 'notes', '2017-09-03T09:27:57Z'),
(1752, 1, 1, 1752, 'notes', '2017-09-03T09:27:57Z'),
(1753, 1, 1, 1753, 'notes', '2017-09-03T09:27:57Z'),
(1754, 1, 1, 1754, 'notes', '2017-09-03T09:27:57Z'),
(1755, 1, 1, 1755, 'notes', '2017-09-03T09:27:57Z'),
(1756, 1, 1, 1756, 'notes', '2017-09-03T09:27:57Z'),
(1757, 1, 1, 1757, 'notes', '2017-09-03T09:27:57Z'),
(1758, 1, 1, 1758, 'notes', '2017-09-03T09:27:57Z'),
(1759, 1, 1, 1759, 'notes', '2017-09-03T09:27:57Z'),
(1760, 1, 1, 1760, 'notes', '2017-09-03T09:27:57Z'),
(1761, 1, 1, 1761, 'notes', '2017-09-03T09:27:57Z'),
(1762, 1, 1, 1762, 'notes', '2017-09-03T09:27:57Z'),
(1763, 1, 1, 1763, 'notes', '2017-09-03T09:27:57Z'),
(1764, 1, 1, 1764, 'notes', '2017-09-03T09:27:57Z'),
(1765, 1, 1, 1765, 'notes', '2017-09-03T09:27:57Z'),
(1766, 1, 1, 1766, 'notes', '2017-09-03T09:27:57Z'),
(1767, 1, 1, 1767, 'notes', '2017-09-03T09:27:57Z'),
(1768, 1, 1, 1768, 'notes', '2017-09-03T09:27:57Z'),
(1769, 1, 1, 1769, 'notes', '2017-09-03T09:27:57Z'),
(1770, 1, 1, 1770, 'notes', '2017-09-03T09:27:57Z'),
(1771, 1, 1, 1771, 'notes', '2017-09-03T09:27:57Z'),
(1772, 1, 1, 1772, 'notes', '2017-09-03T09:27:57Z'),
(1773, 1, 1, 1773, 'notes', '2017-09-03T09:27:57Z'),
(1774, 1, 1, 1774, 'notes', '2017-09-03T09:27:57Z'),
(1775, 1, 1, 1775, 'notes', '2017-09-03T09:27:57Z'),
(1776, 1, 1, 1776, 'notes', '2017-09-03T09:27:57Z'),
(1777, 1, 1, 1777, 'notes', '2017-09-03T09:27:57Z'),
(1778, 1, 1, 1778, 'notes', '2017-09-03T09:27:57Z'),
(1779, 1, 1, 1779, 'notes', '2017-09-03T09:27:57Z'),
(1780, 1, 1, 1780, 'notes', '2017-09-03T09:27:57Z'),
(1781, 1, 1, 1781, 'notes', '2017-09-03T09:27:57Z'),
(1782, 1, 1, 1782, 'notes', '2017-09-03T09:27:57Z'),
(1783, 1, 1, 1783, 'notes', '2017-09-03T09:27:57Z'),
(1784, 1, 1, 1784, 'notes', '2017-09-03T09:27:57Z'),
(1785, 1, 1, 1785, 'notes', '2017-09-03T09:27:57Z'),
(1786, 1, 1, 1786, 'notes', '2017-09-03T09:27:57Z'),
(1787, 1, 1, 1787, 'notes', '2017-09-03T09:27:57Z'),
(1788, 1, 1, 1788, 'notes', '2017-09-03T09:27:57Z'),
(1789, 1, 1, 1789, 'notes', '2017-09-03T09:27:57Z'),
(1790, 1, 1, 1790, 'notes', '2017-09-03T09:27:57Z'),
(1791, 1, 1, 1791, 'notes', '2017-09-03T09:27:57Z'),
(1792, 1, 1, 1792, 'notes', '2017-09-03T09:27:57Z'),
(1793, 1, 1, 1793, 'notes', '2017-09-03T09:27:57Z'),
(1794, 1, 1, 1794, 'notes', '2017-09-03T09:27:57Z'),
(1795, 1, 1, 1795, 'notes', '2017-09-03T09:27:57Z'),
(1796, 1, 1, 1796, 'notes', '2017-09-03T09:27:57Z'),
(1797, 1, 1, 1797, 'notes', '2017-09-03T09:27:57Z'),
(1798, 1, 1, 1798, 'notes', '2017-09-03T09:27:57Z'),
(1799, 1, 1, 1799, 'notes', '2017-09-03T09:27:57Z'),
(1800, 1, 1, 1800, 'notes', '2017-09-03T09:27:57Z'),
(1801, 1, 1, 1801, 'notes', '2017-09-03T09:27:57Z'),
(1802, 2, 1, 1802, 'notes', '2017-09-03T09:27:57Z'),
(1803, 1, 1, 1803, 'notes', '2017-09-03T09:27:57Z'),
(1804, 1, 1, 1804, 'notes', '2017-09-03T09:27:57Z'),
(1805, 1, 1, 1805, 'notes', '2017-09-03T09:27:57Z'),
(1806, 1, 1, 1806, 'notes', '2017-09-03T09:27:57Z'),
(1807, 1, 1, 1807, 'notes', '2017-09-03T09:27:57Z'),
(1808, 1, 1, 1808, 'notes', '2017-09-03T09:27:57Z'),
(1809, 1, 1, 1809, 'notes', '2017-09-03T09:27:57Z'),
(1810, 1, 1, 1810, 'notes', '2017-09-03T09:27:57Z'),
(1811, 1, 1, 1811, 'notes', '2017-09-03T09:27:57Z'),
(1812, 1, 1, 1812, 'notes', '2017-09-03T09:27:57Z'),
(1813, 1, 1, 1813, 'notes', '2017-09-03T09:27:57Z'),
(1814, 1, 1, 1814, 'notes', '2017-09-03T09:27:57Z'),
(1815, 1, 1, 1815, 'notes', '2017-09-03T09:27:57Z'),
(1816, 1, 1, 1816, 'notes', '2017-09-03T09:27:57Z'),
(1817, 1, 1, 1817, 'notes', '2017-09-03T09:27:57Z'),
(1818, 1, 1, 1818, 'notes', '2017-09-03T09:27:57Z'),
(1819, 1, 1, 1819, 'notes', '2017-09-03T09:27:57Z'),
(1820, 1, 1, 1820, 'notes', '2017-09-03T09:27:57Z'),
(1821, 1, 1, 1821, 'notes', '2017-09-03T09:27:57Z'),
(1822, 1, 1, 1822, 'notes', '2017-09-03T09:27:57Z'),
(1823, 1, 1, 1823, 'notes', '2017-09-03T09:27:57Z'),
(1824, 1, 1, 1824, 'notes', '2017-09-03T09:27:57Z'),
(1825, 1, 1, 1825, 'notes', '2017-09-03T09:27:57Z'),
(1826, 1, 1, 1826, 'notes', '2017-09-03T09:27:57Z'),
(1827, 1, 1, 1827, 'notes', '2017-09-03T09:27:57Z'),
(1828, 1, 1, 1828, 'notes', '2017-09-03T09:27:57Z'),
(1829, 1, 1, 1829, 'notes', '2017-09-03T09:27:57Z'),
(1830, 1, 1, 1830, 'notes', '2017-09-03T09:27:57Z'),
(1831, 1, 1, 1831, 'notes', '2017-09-03T09:27:57Z'),
(1832, 1, 1, 1832, 'notes', '2017-09-03T09:27:57Z'),
(1833, 1, 1, 1833, 'notes', '2017-09-03T09:27:57Z'),
(1834, 1, 1, 1834, 'notes', '2017-09-03T09:27:57Z'),
(1835, 1, 1, 1835, 'notes', '2017-09-03T09:27:57Z'),
(1836, 1, 1, 1836, 'notes', '2017-09-03T09:27:57Z'),
(1837, 1, 1, 1837, 'notes', '2017-09-03T09:27:57Z'),
(1838, 1, 1, 1838, 'notes', '2017-09-03T09:27:57Z'),
(1839, 1, 1, 1839, 'notes', '2017-09-03T09:27:57Z'),
(1840, 1, 1, 1840, 'notes', '2017-09-03T09:27:57Z'),
(1841, 1, 1, 1841, 'notes', '2017-09-03T09:27:57Z'),
(1842, 1, 1, 1842, 'notes', '2017-09-03T09:27:57Z'),
(1843, 1, 1, 1843, 'notes', '2017-09-03T09:27:57Z'),
(1844, 1, 1, 1844, 'notes', '2017-09-03T09:27:57Z'),
(1845, 1, 1, 1845, 'notes', '2017-09-03T09:27:57Z'),
(1846, 1, 1, 1846, 'notes', '2017-09-03T09:27:57Z'),
(1847, 1, 1, 1847, 'notes', '2017-09-03T09:27:57Z'),
(1848, 1, 1, 1848, 'notes', '2017-09-03T09:27:57Z'),
(1849, 1, 1, 1849, 'notes', '2017-09-03T09:27:57Z'),
(1850, 1, 1, 1850, 'notes', '2017-09-03T09:27:57Z'),
(1851, 1, 1, 1851, 'notes', '2017-09-03T09:27:57Z'),
(1852, 1, 1, 1852, 'notes', '2017-09-03T09:27:57Z'),
(1853, 1, 1, 1853, 'notes', '2017-09-03T09:27:57Z'),
(1854, 1, 1, 1854, 'notes', '2017-09-03T09:27:57Z'),
(1855, 1, 1, 1855, 'notes', '2017-09-03T09:27:57Z'),
(1856, 1, 1, 1856, 'notes', '2017-09-03T09:27:57Z'),
(1857, 1, 1, 1857, 'notes', '2017-09-03T09:27:57Z'),
(1858, 1, 1, 1858, 'notes', '2017-09-03T09:27:57Z'),
(1859, 1, 1, 1859, 'notes', '2017-09-03T09:27:57Z'),
(1860, 1, 1, 1860, 'notes', '2017-09-03T09:27:57Z'),
(1861, 1, 1, 1861, 'notes', '2017-09-03T09:27:57Z'),
(1862, 1, 1, 1862, 'notes', '2017-09-03T09:27:57Z'),
(1863, 1, 1, 1863, 'notes', '2017-09-03T09:27:57Z'),
(1864, 1, 1, 1864, 'notes', '2017-09-03T09:27:57Z'),
(1865, 1, 1, 1865, 'notes', '2017-09-03T09:27:57Z'),
(1866, 1, 1, 1866, 'notes', '2017-09-03T09:27:57Z'),
(1867, 1, 1, 1867, 'notes', '2017-09-03T09:27:57Z'),
(1868, 2, 1, 1868, 'notes', '2017-09-03T09:27:57Z'),
(1869, 1, 1, 1869, 'notes', '2017-09-03T09:27:57Z'),
(1870, 1, 1, 1870, 'notes', '2017-09-03T09:27:57Z'),
(1871, 1, 1, 1871, 'notes', '2017-09-03T09:27:57Z'),
(1872, 1, 1, 1872, 'notes', '2017-09-03T09:27:57Z'),
(1873, 1, 1, 1873, 'notes', '2017-09-03T09:27:57Z'),
(1874, 1, 1, 1874, 'notes', '2017-09-03T09:27:57Z'),
(1875, 1, 1, 1875, 'notes', '2017-09-03T09:27:57Z'),
(1876, 1, 1, 1876, 'notes', '2017-09-03T09:27:57Z'),
(1877, 1, 1, 1877, 'notes', '2017-09-03T09:27:57Z'),
(1878, 1, 1, 1878, 'notes', '2017-09-03T09:27:57Z'),
(1879, 1, 1, 1879, 'notes', '2017-09-03T09:27:57Z'),
(1880, 1, 1, 1880, 'notes', '2017-09-03T09:27:57Z'),
(1881, 1, 1, 1881, 'notes', '2017-09-03T09:27:57Z'),
(1882, 1, 1, 1882, 'notes', '2017-09-03T09:27:57Z'),
(1883, 1, 1, 1883, 'notes', '2017-09-03T09:27:57Z'),
(1884, 1, 1, 1884, 'notes', '2017-09-03T09:27:57Z'),
(1885, 1, 1, 1885, 'notes', '2017-09-03T09:27:57Z'),
(1886, 1, 1, 1886, 'notes', '2017-09-03T09:27:57Z'),
(1887, 1, 1, 1887, 'notes', '2017-09-03T09:27:57Z'),
(1888, 1, 1, 1888, 'notes', '2017-09-03T09:27:57Z'),
(1889, 1, 1, 1889, 'notes', '2017-09-03T09:27:57Z'),
(1890, 1, 1, 1890, 'notes', '2017-09-03T09:27:57Z'),
(1891, 1, 1, 1891, 'notes', '2017-09-03T09:27:57Z'),
(1892, 1, 1, 1892, 'notes', '2017-09-03T09:27:57Z'),
(1893, 1, 1, 1893, 'notes', '2017-09-03T09:27:57Z'),
(1894, 1, 1, 1894, 'notes', '2017-09-03T09:27:57Z'),
(1895, 1, 1, 1895, 'notes', '2017-09-03T09:27:57Z'),
(1896, 1, 1, 1896, 'notes', '2017-09-03T09:27:57Z'),
(1897, 1, 1, 1897, 'notes', '2017-09-03T09:27:57Z'),
(1898, 1, 1, 1898, 'notes', '2017-09-03T09:27:57Z'),
(1899, 1, 1, 1899, 'notes', '2017-09-03T09:27:57Z'),
(1900, 1, 1, 1900, 'notes', '2017-09-03T09:27:57Z'),
(1901, 2, 1, 1901, 'notes', '2017-09-03T09:27:57Z'),
(1902, 1, 1, 1902, 'notes', '2017-09-03T09:27:57Z'),
(1903, 1, 1, 1903, 'notes', '2017-09-03T09:27:57Z'),
(1904, 1, 1, 1904, 'notes', '2017-09-03T09:27:57Z'),
(1905, 1, 1, 1905, 'notes', '2017-09-03T09:27:57Z'),
(1906, 1, 1, 1906, 'notes', '2017-09-03T09:27:57Z'),
(1907, 1, 1, 1907, 'notes', '2017-09-03T09:27:57Z'),
(1908, 1, 1, 1908, 'notes', '2017-09-03T09:27:57Z'),
(1909, 1, 1, 1909, 'notes', '2017-09-03T09:27:57Z'),
(1910, 1, 1, 1910, 'notes', '2017-09-03T09:27:57Z'),
(1911, 1, 1, 1911, 'notes', '2017-09-03T09:27:57Z'),
(1912, 1, 1, 1912, 'notes', '2017-09-03T09:27:57Z'),
(1913, 1, 1, 1913, 'notes', '2017-09-03T09:27:57Z'),
(1914, 1, 1, 1914, 'notes', '2017-09-03T09:27:57Z'),
(1915, 1, 1, 1915, 'notes', '2017-09-03T09:27:57Z'),
(1916, 1, 1, 1916, 'notes', '2017-09-03T09:27:57Z'),
(1917, 1, 1, 1917, 'notes', '2017-09-03T09:27:57Z'),
(1918, 1, 1, 1918, 'notes', '2017-09-03T09:27:57Z'),
(1919, 1, 1, 1919, 'notes', '2017-09-03T09:27:57Z'),
(1920, 1, 1, 1920, 'notes', '2017-09-03T09:27:57Z'),
(1921, 1, 1, 1921, 'notes', '2017-09-03T09:27:57Z'),
(1922, 1, 1, 1922, 'notes', '2017-09-03T09:27:57Z'),
(1923, 1, 1, 1923, 'notes', '2017-09-03T09:27:57Z'),
(1924, 1, 1, 1924, 'notes', '2017-09-03T09:27:57Z'),
(1925, 1, 1, 1925, 'notes', '2017-09-03T09:27:57Z'),
(1926, 1, 1, 1926, 'notes', '2017-09-03T09:27:57Z'),
(1927, 1, 1, 1927, 'notes', '2017-09-03T09:27:57Z'),
(1928, 1, 1, 1928, 'notes', '2017-09-03T09:27:57Z'),
(1929, 1, 1, 1929, 'notes', '2017-09-03T09:27:57Z'),
(1930, 1, 1, 1930, 'notes', '2017-09-03T09:27:57Z'),
(1931, 1, 1, 1931, 'notes', '2017-09-03T09:27:57Z'),
(1932, 1, 1, 1932, 'notes', '2017-09-03T09:27:57Z'),
(1933, 1, 1, 1933, 'notes', '2017-09-03T09:27:57Z'),
(1934, 2, 1, 1934, 'notes', '2017-09-03T09:27:57Z'),
(1935, 1, 1, 1935, 'notes', '2017-09-03T09:27:57Z'),
(1936, 1, 1, 1936, 'notes', '2017-09-03T09:27:57Z'),
(1937, 1, 1, 1937, 'notes', '2017-09-03T09:27:57Z'),
(1938, 2, 1, 1938, 'notes', '2017-09-03T09:27:57Z'),
(1939, 2, 1, 1939, 'notes', '2017-09-03T09:27:57Z'),
(1940, 1, 1, 1940, 'notes', '2017-09-03T09:27:57Z'),
(1941, 1, 1, 1941, 'notes', '2017-09-03T09:27:57Z'),
(1942, 1, 1, 1942, 'notes', '2017-09-03T09:27:57Z'),
(1943, 1, 1, 1943, 'notes', '2017-09-03T09:27:57Z'),
(1944, 1, 1, 1944, 'notes', '2017-09-03T09:27:57Z'),
(1945, 1, 1, 1945, 'notes', '2017-09-03T09:27:57Z'),
(1946, 1, 1, 1946, 'notes', '2017-09-03T09:27:57Z'),
(1947, 1, 1, 1947, 'notes', '2017-09-03T09:27:57Z'),
(1948, 1, 1, 1948, 'notes', '2017-09-03T09:27:57Z'),
(1949, 1, 1, 1949, 'notes', '2017-09-03T09:27:57Z');

alter sequence floods.status_update_id_seq restart with 3381;

update floods.crossing set latest_status_update_id = 1, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1;
update floods.crossing set latest_status_update_id = 2, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 2;
update floods.crossing set latest_status_update_id = 3, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 3;
update floods.crossing set latest_status_update_id = 4, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 4;
update floods.crossing set latest_status_update_id = 5, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 5;
update floods.crossing set latest_status_update_id = 6, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 6;
update floods.crossing set latest_status_update_id = 7, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 7;
update floods.crossing set latest_status_update_id = 8, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 8;
update floods.crossing set latest_status_update_id = 9, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 9;
update floods.crossing set latest_status_update_id = 10, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 10;
update floods.crossing set latest_status_update_id = 11, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 11;
update floods.crossing set latest_status_update_id = 12, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 12;
update floods.crossing set latest_status_update_id = 13, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 13;
update floods.crossing set latest_status_update_id = 14, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 14;
update floods.crossing set latest_status_update_id = 15, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 15;
update floods.crossing set latest_status_update_id = 16, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 16;
update floods.crossing set latest_status_update_id = 17, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 17;
update floods.crossing set latest_status_update_id = 18, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 18;
update floods.crossing set latest_status_update_id = 19, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 19;
update floods.crossing set latest_status_update_id = 20, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 20;
update floods.crossing set latest_status_update_id = 21, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 21;
update floods.crossing set latest_status_update_id = 22, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 22;
update floods.crossing set latest_status_update_id = 23, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 23;
update floods.crossing set latest_status_update_id = 24, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 24;
update floods.crossing set latest_status_update_id = 25, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 25;
update floods.crossing set latest_status_update_id = 26, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 26;
update floods.crossing set latest_status_update_id = 27, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 27;
update floods.crossing set latest_status_update_id = 28, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 28;
update floods.crossing set latest_status_update_id = 29, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 29;
update floods.crossing set latest_status_update_id = 30, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 30;
update floods.crossing set latest_status_update_id = 31, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 31;
update floods.crossing set latest_status_update_id = 32, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 32;
update floods.crossing set latest_status_update_id = 33, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 33;
update floods.crossing set latest_status_update_id = 34, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 34;
update floods.crossing set latest_status_update_id = 35, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 35;
update floods.crossing set latest_status_update_id = 36, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 36;
update floods.crossing set latest_status_update_id = 37, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 37;
update floods.crossing set latest_status_update_id = 38, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 38;
update floods.crossing set latest_status_update_id = 39, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 39;
update floods.crossing set latest_status_update_id = 40, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 40;
update floods.crossing set latest_status_update_id = 41, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 41;
update floods.crossing set latest_status_update_id = 42, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 42;
update floods.crossing set latest_status_update_id = 43, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 43;
update floods.crossing set latest_status_update_id = 44, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 44;
update floods.crossing set latest_status_update_id = 45, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 45;
update floods.crossing set latest_status_update_id = 46, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 46;
update floods.crossing set latest_status_update_id = 47, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 47;
update floods.crossing set latest_status_update_id = 48, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 48;
update floods.crossing set latest_status_update_id = 49, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 49;
update floods.crossing set latest_status_update_id = 50, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 50;
update floods.crossing set latest_status_update_id = 51, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 51;
update floods.crossing set latest_status_update_id = 52, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 52;
update floods.crossing set latest_status_update_id = 53, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 53;
update floods.crossing set latest_status_update_id = 54, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 54;
update floods.crossing set latest_status_update_id = 55, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 55;
update floods.crossing set latest_status_update_id = 56, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 56;
update floods.crossing set latest_status_update_id = 57, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 57;
update floods.crossing set latest_status_update_id = 58, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 58;
update floods.crossing set latest_status_update_id = 59, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 59;
update floods.crossing set latest_status_update_id = 60, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 60;
update floods.crossing set latest_status_update_id = 61, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 61;
update floods.crossing set latest_status_update_id = 62, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 62;
update floods.crossing set latest_status_update_id = 63, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 63;
update floods.crossing set latest_status_update_id = 64, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 64;
update floods.crossing set latest_status_update_id = 65, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 65;
update floods.crossing set latest_status_update_id = 66, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 66;
update floods.crossing set latest_status_update_id = 67, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 67;
update floods.crossing set latest_status_update_id = 68, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 68;
update floods.crossing set latest_status_update_id = 69, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 69;
update floods.crossing set latest_status_update_id = 70, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 70;
update floods.crossing set latest_status_update_id = 71, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 71;
update floods.crossing set latest_status_update_id = 72, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 72;
update floods.crossing set latest_status_update_id = 73, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 73;
update floods.crossing set latest_status_update_id = 74, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 74;
update floods.crossing set latest_status_update_id = 75, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 75;
update floods.crossing set latest_status_update_id = 76, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 76;
update floods.crossing set latest_status_update_id = 77, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 77;
update floods.crossing set latest_status_update_id = 78, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 78;
update floods.crossing set latest_status_update_id = 79, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 79;
update floods.crossing set latest_status_update_id = 80, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 80;
update floods.crossing set latest_status_update_id = 81, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 81;
update floods.crossing set latest_status_update_id = 82, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 82;
update floods.crossing set latest_status_update_id = 83, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 83;
update floods.crossing set latest_status_update_id = 84, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 84;
update floods.crossing set latest_status_update_id = 85, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 85;
update floods.crossing set latest_status_update_id = 86, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 86;
update floods.crossing set latest_status_update_id = 87, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 87;
update floods.crossing set latest_status_update_id = 88, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 88;
update floods.crossing set latest_status_update_id = 89, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 89;
update floods.crossing set latest_status_update_id = 90, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 90;
update floods.crossing set latest_status_update_id = 91, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 91;
update floods.crossing set latest_status_update_id = 92, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 92;
update floods.crossing set latest_status_update_id = 93, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 93;
update floods.crossing set latest_status_update_id = 94, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 94;
update floods.crossing set latest_status_update_id = 95, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 95;
update floods.crossing set latest_status_update_id = 96, latest_status_id = 2, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 96;
update floods.crossing set latest_status_update_id = 97, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 97;
update floods.crossing set latest_status_update_id = 98, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 98;
update floods.crossing set latest_status_update_id = 99, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 99;
update floods.crossing set latest_status_update_id = 100, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 100;
update floods.crossing set latest_status_update_id = 101, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 101;
update floods.crossing set latest_status_update_id = 102, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 102;
update floods.crossing set latest_status_update_id = 103, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 103;
update floods.crossing set latest_status_update_id = 104, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 104;
update floods.crossing set latest_status_update_id = 105, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 105;
update floods.crossing set latest_status_update_id = 106, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 106;
update floods.crossing set latest_status_update_id = 107, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 107;
update floods.crossing set latest_status_update_id = 108, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 108;
update floods.crossing set latest_status_update_id = 109, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 109;
update floods.crossing set latest_status_update_id = 110, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 110;
update floods.crossing set latest_status_update_id = 111, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 111;
update floods.crossing set latest_status_update_id = 112, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 112;
update floods.crossing set latest_status_update_id = 113, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 113;
update floods.crossing set latest_status_update_id = 114, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 114;
update floods.crossing set latest_status_update_id = 115, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 115;
update floods.crossing set latest_status_update_id = 116, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 116;
update floods.crossing set latest_status_update_id = 117, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 117;
update floods.crossing set latest_status_update_id = 118, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 118;
update floods.crossing set latest_status_update_id = 119, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 119;
update floods.crossing set latest_status_update_id = 120, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 120;
update floods.crossing set latest_status_update_id = 121, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 121;
update floods.crossing set latest_status_update_id = 122, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 122;
update floods.crossing set latest_status_update_id = 123, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 123;
update floods.crossing set latest_status_update_id = 124, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 124;
update floods.crossing set latest_status_update_id = 125, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 125;
update floods.crossing set latest_status_update_id = 126, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 126;
update floods.crossing set latest_status_update_id = 127, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 127;
update floods.crossing set latest_status_update_id = 128, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 128;
update floods.crossing set latest_status_update_id = 129, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 129;
update floods.crossing set latest_status_update_id = 130, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 130;
update floods.crossing set latest_status_update_id = 131, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 131;
update floods.crossing set latest_status_update_id = 132, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 132;
update floods.crossing set latest_status_update_id = 133, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 133;
update floods.crossing set latest_status_update_id = 134, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 134;
update floods.crossing set latest_status_update_id = 135, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 135;
update floods.crossing set latest_status_update_id = 136, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 136;
update floods.crossing set latest_status_update_id = 137, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 137;
update floods.crossing set latest_status_update_id = 138, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 138;
update floods.crossing set latest_status_update_id = 139, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 139;
update floods.crossing set latest_status_update_id = 140, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 140;
update floods.crossing set latest_status_update_id = 141, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 141;
update floods.crossing set latest_status_update_id = 142, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 142;
update floods.crossing set latest_status_update_id = 143, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 143;
update floods.crossing set latest_status_update_id = 144, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 144;
update floods.crossing set latest_status_update_id = 145, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 145;
update floods.crossing set latest_status_update_id = 146, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 146;
update floods.crossing set latest_status_update_id = 147, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 147;
update floods.crossing set latest_status_update_id = 148, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 148;
update floods.crossing set latest_status_update_id = 149, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 149;
update floods.crossing set latest_status_update_id = 150, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 150;
update floods.crossing set latest_status_update_id = 151, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 151;
update floods.crossing set latest_status_update_id = 152, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 152;
update floods.crossing set latest_status_update_id = 153, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 153;
update floods.crossing set latest_status_update_id = 154, latest_status_id = 2, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 154;
update floods.crossing set latest_status_update_id = 155, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 155;
update floods.crossing set latest_status_update_id = 156, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 156;
update floods.crossing set latest_status_update_id = 157, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 157;
update floods.crossing set latest_status_update_id = 158, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 158;
update floods.crossing set latest_status_update_id = 159, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 159;
update floods.crossing set latest_status_update_id = 160, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 160;
update floods.crossing set latest_status_update_id = 161, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 161;
update floods.crossing set latest_status_update_id = 162, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 162;
update floods.crossing set latest_status_update_id = 163, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 163;
update floods.crossing set latest_status_update_id = 164, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 164;
update floods.crossing set latest_status_update_id = 165, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 165;
update floods.crossing set latest_status_update_id = 166, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 166;
update floods.crossing set latest_status_update_id = 167, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 167;
update floods.crossing set latest_status_update_id = 168, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 168;
update floods.crossing set latest_status_update_id = 169, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 169;
update floods.crossing set latest_status_update_id = 170, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 170;
update floods.crossing set latest_status_update_id = 171, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 171;
update floods.crossing set latest_status_update_id = 172, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 172;
update floods.crossing set latest_status_update_id = 173, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 173;
update floods.crossing set latest_status_update_id = 174, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 174;
update floods.crossing set latest_status_update_id = 175, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 175;
update floods.crossing set latest_status_update_id = 176, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 176;
update floods.crossing set latest_status_update_id = 177, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 177;
update floods.crossing set latest_status_update_id = 178, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 178;
update floods.crossing set latest_status_update_id = 179, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 179;
update floods.crossing set latest_status_update_id = 180, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 180;
update floods.crossing set latest_status_update_id = 181, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 181;
update floods.crossing set latest_status_update_id = 182, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 182;
update floods.crossing set latest_status_update_id = 183, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 183;
update floods.crossing set latest_status_update_id = 184, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 184;
update floods.crossing set latest_status_update_id = 185, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 185;
update floods.crossing set latest_status_update_id = 186, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 186;
update floods.crossing set latest_status_update_id = 187, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 187;
update floods.crossing set latest_status_update_id = 188, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 188;
update floods.crossing set latest_status_update_id = 189, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 189;
update floods.crossing set latest_status_update_id = 190, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 190;
update floods.crossing set latest_status_update_id = 191, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 191;
update floods.crossing set latest_status_update_id = 192, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 192;
update floods.crossing set latest_status_update_id = 193, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 193;
update floods.crossing set latest_status_update_id = 194, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 194;
update floods.crossing set latest_status_update_id = 195, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 195;
update floods.crossing set latest_status_update_id = 196, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 196;
update floods.crossing set latest_status_update_id = 197, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 197;
update floods.crossing set latest_status_update_id = 198, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 198;
update floods.crossing set latest_status_update_id = 199, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 199;
update floods.crossing set latest_status_update_id = 200, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 200;
update floods.crossing set latest_status_update_id = 201, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 201;
update floods.crossing set latest_status_update_id = 202, latest_status_id = 2, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 202;
update floods.crossing set latest_status_update_id = 203, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 203;
update floods.crossing set latest_status_update_id = 204, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 204;
update floods.crossing set latest_status_update_id = 205, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 205;
update floods.crossing set latest_status_update_id = 206, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 206;
update floods.crossing set latest_status_update_id = 207, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 207;
update floods.crossing set latest_status_update_id = 208, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 208;
update floods.crossing set latest_status_update_id = 209, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 209;
update floods.crossing set latest_status_update_id = 210, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 210;
update floods.crossing set latest_status_update_id = 211, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 211;
update floods.crossing set latest_status_update_id = 212, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 212;
update floods.crossing set latest_status_update_id = 213, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 213;
update floods.crossing set latest_status_update_id = 214, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 214;
update floods.crossing set latest_status_update_id = 215, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 215;
update floods.crossing set latest_status_update_id = 216, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 216;
update floods.crossing set latest_status_update_id = 217, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 217;
update floods.crossing set latest_status_update_id = 218, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 218;
update floods.crossing set latest_status_update_id = 219, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 219;
update floods.crossing set latest_status_update_id = 220, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 220;
update floods.crossing set latest_status_update_id = 221, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 221;
update floods.crossing set latest_status_update_id = 222, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 222;
update floods.crossing set latest_status_update_id = 223, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 223;
update floods.crossing set latest_status_update_id = 224, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 224;
update floods.crossing set latest_status_update_id = 225, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 225;
update floods.crossing set latest_status_update_id = 226, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 226;
update floods.crossing set latest_status_update_id = 227, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 227;
update floods.crossing set latest_status_update_id = 228, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 228;
update floods.crossing set latest_status_update_id = 229, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 229;
update floods.crossing set latest_status_update_id = 230, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 230;
update floods.crossing set latest_status_update_id = 231, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 231;
update floods.crossing set latest_status_update_id = 232, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 232;
update floods.crossing set latest_status_update_id = 233, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 233;
update floods.crossing set latest_status_update_id = 234, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 234;
update floods.crossing set latest_status_update_id = 235, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 235;
update floods.crossing set latest_status_update_id = 236, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 236;
update floods.crossing set latest_status_update_id = 237, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 237;
update floods.crossing set latest_status_update_id = 238, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 238;
update floods.crossing set latest_status_update_id = 239, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 239;
update floods.crossing set latest_status_update_id = 240, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 240;
update floods.crossing set latest_status_update_id = 241, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 241;
update floods.crossing set latest_status_update_id = 242, latest_status_id = 2, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 242;
update floods.crossing set latest_status_update_id = 243, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 243;
update floods.crossing set latest_status_update_id = 244, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 244;
update floods.crossing set latest_status_update_id = 245, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 245;
update floods.crossing set latest_status_update_id = 246, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 246;
update floods.crossing set latest_status_update_id = 247, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 247;
update floods.crossing set latest_status_update_id = 248, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 248;
update floods.crossing set latest_status_update_id = 249, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 249;
update floods.crossing set latest_status_update_id = 250, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 250;
update floods.crossing set latest_status_update_id = 251, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 251;
update floods.crossing set latest_status_update_id = 252, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 252;
update floods.crossing set latest_status_update_id = 253, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 253;
update floods.crossing set latest_status_update_id = 254, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 254;
update floods.crossing set latest_status_update_id = 255, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 255;
update floods.crossing set latest_status_update_id = 256, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 256;
update floods.crossing set latest_status_update_id = 257, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 257;
update floods.crossing set latest_status_update_id = 258, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 258;
update floods.crossing set latest_status_update_id = 259, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 259;
update floods.crossing set latest_status_update_id = 260, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 260;
update floods.crossing set latest_status_update_id = 261, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 261;
update floods.crossing set latest_status_update_id = 262, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 262;
update floods.crossing set latest_status_update_id = 263, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 263;
update floods.crossing set latest_status_update_id = 264, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 264;
update floods.crossing set latest_status_update_id = 265, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 265;
update floods.crossing set latest_status_update_id = 266, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 266;
update floods.crossing set latest_status_update_id = 267, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 267;
update floods.crossing set latest_status_update_id = 268, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 268;
update floods.crossing set latest_status_update_id = 269, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 269;
update floods.crossing set latest_status_update_id = 270, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 270;
update floods.crossing set latest_status_update_id = 271, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 271;
update floods.crossing set latest_status_update_id = 272, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 272;
update floods.crossing set latest_status_update_id = 273, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 273;
update floods.crossing set latest_status_update_id = 274, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 274;
update floods.crossing set latest_status_update_id = 275, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 275;
update floods.crossing set latest_status_update_id = 276, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 276;
update floods.crossing set latest_status_update_id = 277, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 277;
update floods.crossing set latest_status_update_id = 278, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 278;
update floods.crossing set latest_status_update_id = 279, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 279;
update floods.crossing set latest_status_update_id = 280, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 280;
update floods.crossing set latest_status_update_id = 281, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 281;
update floods.crossing set latest_status_update_id = 282, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 282;
update floods.crossing set latest_status_update_id = 283, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 283;
update floods.crossing set latest_status_update_id = 284, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 284;
update floods.crossing set latest_status_update_id = 285, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 285;
update floods.crossing set latest_status_update_id = 286, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 286;
update floods.crossing set latest_status_update_id = 287, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 287;
update floods.crossing set latest_status_update_id = 288, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 288;
update floods.crossing set latest_status_update_id = 289, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 289;
update floods.crossing set latest_status_update_id = 290, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 290;
update floods.crossing set latest_status_update_id = 291, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 291;
update floods.crossing set latest_status_update_id = 292, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 292;
update floods.crossing set latest_status_update_id = 293, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 293;
update floods.crossing set latest_status_update_id = 294, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 294;
update floods.crossing set latest_status_update_id = 295, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 295;
update floods.crossing set latest_status_update_id = 296, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 296;
update floods.crossing set latest_status_update_id = 297, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 297;
update floods.crossing set latest_status_update_id = 298, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 298;
update floods.crossing set latest_status_update_id = 299, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 299;
update floods.crossing set latest_status_update_id = 300, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 300;
update floods.crossing set latest_status_update_id = 301, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 301;
update floods.crossing set latest_status_update_id = 302, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 302;
update floods.crossing set latest_status_update_id = 303, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 303;
update floods.crossing set latest_status_update_id = 304, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 304;
update floods.crossing set latest_status_update_id = 305, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 305;
update floods.crossing set latest_status_update_id = 306, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 306;
update floods.crossing set latest_status_update_id = 307, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 307;
update floods.crossing set latest_status_update_id = 308, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 308;
update floods.crossing set latest_status_update_id = 309, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 309;
update floods.crossing set latest_status_update_id = 310, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 310;
update floods.crossing set latest_status_update_id = 311, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 311;
update floods.crossing set latest_status_update_id = 312, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 312;
update floods.crossing set latest_status_update_id = 313, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 313;
update floods.crossing set latest_status_update_id = 314, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 314;
update floods.crossing set latest_status_update_id = 315, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 315;
update floods.crossing set latest_status_update_id = 316, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 316;
update floods.crossing set latest_status_update_id = 317, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 317;
update floods.crossing set latest_status_update_id = 318, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 318;
update floods.crossing set latest_status_update_id = 319, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 319;
update floods.crossing set latest_status_update_id = 320, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 320;
update floods.crossing set latest_status_update_id = 321, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 321;
update floods.crossing set latest_status_update_id = 322, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 322;
update floods.crossing set latest_status_update_id = 323, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 323;
update floods.crossing set latest_status_update_id = 324, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 324;
update floods.crossing set latest_status_update_id = 325, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 325;
update floods.crossing set latest_status_update_id = 326, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 326;
update floods.crossing set latest_status_update_id = 327, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 327;
update floods.crossing set latest_status_update_id = 328, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 328;
update floods.crossing set latest_status_update_id = 329, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 329;
update floods.crossing set latest_status_update_id = 330, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 330;
update floods.crossing set latest_status_update_id = 331, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 331;
update floods.crossing set latest_status_update_id = 332, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 332;
update floods.crossing set latest_status_update_id = 333, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 333;
update floods.crossing set latest_status_update_id = 334, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 334;
update floods.crossing set latest_status_update_id = 335, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 335;
update floods.crossing set latest_status_update_id = 336, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 336;
update floods.crossing set latest_status_update_id = 337, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 337;
update floods.crossing set latest_status_update_id = 338, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 338;
update floods.crossing set latest_status_update_id = 339, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 339;
update floods.crossing set latest_status_update_id = 340, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 340;
update floods.crossing set latest_status_update_id = 341, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 341;
update floods.crossing set latest_status_update_id = 342, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 342;
update floods.crossing set latest_status_update_id = 343, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 343;
update floods.crossing set latest_status_update_id = 344, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 344;
update floods.crossing set latest_status_update_id = 345, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 345;
update floods.crossing set latest_status_update_id = 346, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 346;
update floods.crossing set latest_status_update_id = 347, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 347;
update floods.crossing set latest_status_update_id = 348, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 348;
update floods.crossing set latest_status_update_id = 349, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 349;
update floods.crossing set latest_status_update_id = 350, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 350;
update floods.crossing set latest_status_update_id = 351, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 351;
update floods.crossing set latest_status_update_id = 352, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 352;
update floods.crossing set latest_status_update_id = 353, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 353;
update floods.crossing set latest_status_update_id = 354, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 354;
update floods.crossing set latest_status_update_id = 355, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 355;
update floods.crossing set latest_status_update_id = 356, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 356;
update floods.crossing set latest_status_update_id = 357, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 357;
update floods.crossing set latest_status_update_id = 358, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 358;
update floods.crossing set latest_status_update_id = 359, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 359;
update floods.crossing set latest_status_update_id = 360, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 360;
update floods.crossing set latest_status_update_id = 361, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 361;
update floods.crossing set latest_status_update_id = 362, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 362;
update floods.crossing set latest_status_update_id = 363, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 363;
update floods.crossing set latest_status_update_id = 364, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 364;
update floods.crossing set latest_status_update_id = 365, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 365;
update floods.crossing set latest_status_update_id = 366, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 366;
update floods.crossing set latest_status_update_id = 367, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 367;
update floods.crossing set latest_status_update_id = 368, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 368;
update floods.crossing set latest_status_update_id = 369, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 369;
update floods.crossing set latest_status_update_id = 370, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 370;
update floods.crossing set latest_status_update_id = 371, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 371;
update floods.crossing set latest_status_update_id = 372, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 372;
update floods.crossing set latest_status_update_id = 373, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 373;
update floods.crossing set latest_status_update_id = 374, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 374;
update floods.crossing set latest_status_update_id = 375, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 375;
update floods.crossing set latest_status_update_id = 376, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 376;
update floods.crossing set latest_status_update_id = 377, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 377;
update floods.crossing set latest_status_update_id = 378, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 378;
update floods.crossing set latest_status_update_id = 379, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 379;
update floods.crossing set latest_status_update_id = 380, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 380;
update floods.crossing set latest_status_update_id = 381, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 381;
update floods.crossing set latest_status_update_id = 382, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 382;
update floods.crossing set latest_status_update_id = 383, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 383;
update floods.crossing set latest_status_update_id = 384, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 384;
update floods.crossing set latest_status_update_id = 385, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 385;
update floods.crossing set latest_status_update_id = 386, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 386;
update floods.crossing set latest_status_update_id = 387, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 387;
update floods.crossing set latest_status_update_id = 388, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 388;
update floods.crossing set latest_status_update_id = 389, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 389;
update floods.crossing set latest_status_update_id = 390, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 390;
update floods.crossing set latest_status_update_id = 391, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 391;
update floods.crossing set latest_status_update_id = 392, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 392;
update floods.crossing set latest_status_update_id = 393, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 393;
update floods.crossing set latest_status_update_id = 394, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 394;
update floods.crossing set latest_status_update_id = 395, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 395;
update floods.crossing set latest_status_update_id = 396, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 396;
update floods.crossing set latest_status_update_id = 397, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 397;
update floods.crossing set latest_status_update_id = 398, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 398;
update floods.crossing set latest_status_update_id = 399, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 399;
update floods.crossing set latest_status_update_id = 400, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 400;
update floods.crossing set latest_status_update_id = 401, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 401;
update floods.crossing set latest_status_update_id = 402, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 402;
update floods.crossing set latest_status_update_id = 403, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 403;
update floods.crossing set latest_status_update_id = 404, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 404;
update floods.crossing set latest_status_update_id = 405, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 405;
update floods.crossing set latest_status_update_id = 406, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 406;
update floods.crossing set latest_status_update_id = 407, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 407;
update floods.crossing set latest_status_update_id = 408, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 408;
update floods.crossing set latest_status_update_id = 409, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 409;
update floods.crossing set latest_status_update_id = 410, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 410;
update floods.crossing set latest_status_update_id = 411, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 411;
update floods.crossing set latest_status_update_id = 412, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 412;
update floods.crossing set latest_status_update_id = 413, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 413;
update floods.crossing set latest_status_update_id = 414, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 414;
update floods.crossing set latest_status_update_id = 415, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 415;
update floods.crossing set latest_status_update_id = 416, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 416;
update floods.crossing set latest_status_update_id = 417, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 417;
update floods.crossing set latest_status_update_id = 418, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 418;
update floods.crossing set latest_status_update_id = 419, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 419;
update floods.crossing set latest_status_update_id = 420, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 420;
update floods.crossing set latest_status_update_id = 421, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 421;
update floods.crossing set latest_status_update_id = 422, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 422;
update floods.crossing set latest_status_update_id = 423, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 423;
update floods.crossing set latest_status_update_id = 424, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 424;
update floods.crossing set latest_status_update_id = 425, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 425;
update floods.crossing set latest_status_update_id = 426, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 426;
update floods.crossing set latest_status_update_id = 427, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 427;
update floods.crossing set latest_status_update_id = 428, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 428;
update floods.crossing set latest_status_update_id = 429, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 429;
update floods.crossing set latest_status_update_id = 430, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 430;
update floods.crossing set latest_status_update_id = 431, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 431;
update floods.crossing set latest_status_update_id = 432, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 432;
update floods.crossing set latest_status_update_id = 433, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 433;
update floods.crossing set latest_status_update_id = 434, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 434;
update floods.crossing set latest_status_update_id = 435, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 435;
update floods.crossing set latest_status_update_id = 436, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 436;
update floods.crossing set latest_status_update_id = 437, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 437;
update floods.crossing set latest_status_update_id = 438, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 438;
update floods.crossing set latest_status_update_id = 439, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 439;
update floods.crossing set latest_status_update_id = 440, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 440;
update floods.crossing set latest_status_update_id = 441, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 441;
update floods.crossing set latest_status_update_id = 442, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 442;
update floods.crossing set latest_status_update_id = 443, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 443;
update floods.crossing set latest_status_update_id = 444, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 444;
update floods.crossing set latest_status_update_id = 445, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 445;
update floods.crossing set latest_status_update_id = 446, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 446;
update floods.crossing set latest_status_update_id = 447, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 447;
update floods.crossing set latest_status_update_id = 448, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 448;
update floods.crossing set latest_status_update_id = 449, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 449;
update floods.crossing set latest_status_update_id = 450, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 450;
update floods.crossing set latest_status_update_id = 451, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 451;
update floods.crossing set latest_status_update_id = 452, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 452;
update floods.crossing set latest_status_update_id = 453, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 453;
update floods.crossing set latest_status_update_id = 454, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 454;
update floods.crossing set latest_status_update_id = 455, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 455;
update floods.crossing set latest_status_update_id = 456, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 456;
update floods.crossing set latest_status_update_id = 457, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 457;
update floods.crossing set latest_status_update_id = 458, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 458;
update floods.crossing set latest_status_update_id = 459, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 459;
update floods.crossing set latest_status_update_id = 460, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 460;
update floods.crossing set latest_status_update_id = 461, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 461;
update floods.crossing set latest_status_update_id = 462, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 462;
update floods.crossing set latest_status_update_id = 463, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 463;
update floods.crossing set latest_status_update_id = 464, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 464;
update floods.crossing set latest_status_update_id = 465, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 465;
update floods.crossing set latest_status_update_id = 466, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 466;
update floods.crossing set latest_status_update_id = 467, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 467;
update floods.crossing set latest_status_update_id = 468, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 468;
update floods.crossing set latest_status_update_id = 469, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 469;
update floods.crossing set latest_status_update_id = 470, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 470;
update floods.crossing set latest_status_update_id = 471, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 471;
update floods.crossing set latest_status_update_id = 472, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 472;
update floods.crossing set latest_status_update_id = 473, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 473;
update floods.crossing set latest_status_update_id = 474, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 474;
update floods.crossing set latest_status_update_id = 475, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 475;
update floods.crossing set latest_status_update_id = 476, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 476;
update floods.crossing set latest_status_update_id = 477, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 477;
update floods.crossing set latest_status_update_id = 478, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 478;
update floods.crossing set latest_status_update_id = 479, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 479;
update floods.crossing set latest_status_update_id = 480, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 480;
update floods.crossing set latest_status_update_id = 481, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 481;
update floods.crossing set latest_status_update_id = 482, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 482;
update floods.crossing set latest_status_update_id = 483, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 483;
update floods.crossing set latest_status_update_id = 484, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 484;
update floods.crossing set latest_status_update_id = 485, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 485;
update floods.crossing set latest_status_update_id = 486, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 486;
update floods.crossing set latest_status_update_id = 487, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 487;
update floods.crossing set latest_status_update_id = 488, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 488;
update floods.crossing set latest_status_update_id = 489, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 489;
update floods.crossing set latest_status_update_id = 490, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 490;
update floods.crossing set latest_status_update_id = 491, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 491;
update floods.crossing set latest_status_update_id = 492, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 492;
update floods.crossing set latest_status_update_id = 493, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 493;
update floods.crossing set latest_status_update_id = 494, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 494;
update floods.crossing set latest_status_update_id = 495, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 495;
update floods.crossing set latest_status_update_id = 496, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 496;
update floods.crossing set latest_status_update_id = 497, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 497;
update floods.crossing set latest_status_update_id = 498, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 498;
update floods.crossing set latest_status_update_id = 499, latest_status_id = 2, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 499;
update floods.crossing set latest_status_update_id = 500, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 500;
update floods.crossing set latest_status_update_id = 501, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 501;
update floods.crossing set latest_status_update_id = 502, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 502;
update floods.crossing set latest_status_update_id = 503, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 503;
update floods.crossing set latest_status_update_id = 504, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 504;
update floods.crossing set latest_status_update_id = 505, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 505;
update floods.crossing set latest_status_update_id = 506, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 506;
update floods.crossing set latest_status_update_id = 507, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 507;
update floods.crossing set latest_status_update_id = 508, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 508;
update floods.crossing set latest_status_update_id = 509, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 509;
update floods.crossing set latest_status_update_id = 510, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 510;
update floods.crossing set latest_status_update_id = 511, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 511;
update floods.crossing set latest_status_update_id = 512, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 512;
update floods.crossing set latest_status_update_id = 513, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 513;
update floods.crossing set latest_status_update_id = 514, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 514;
update floods.crossing set latest_status_update_id = 515, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 515;
update floods.crossing set latest_status_update_id = 516, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 516;
update floods.crossing set latest_status_update_id = 517, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 517;
update floods.crossing set latest_status_update_id = 518, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 518;
update floods.crossing set latest_status_update_id = 519, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 519;
update floods.crossing set latest_status_update_id = 520, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 520;
update floods.crossing set latest_status_update_id = 521, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 521;
update floods.crossing set latest_status_update_id = 522, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 522;
update floods.crossing set latest_status_update_id = 523, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 523;
update floods.crossing set latest_status_update_id = 524, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 524;
update floods.crossing set latest_status_update_id = 525, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 525;
update floods.crossing set latest_status_update_id = 526, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 526;
update floods.crossing set latest_status_update_id = 527, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 527;
update floods.crossing set latest_status_update_id = 528, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 528;
update floods.crossing set latest_status_update_id = 529, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 529;
update floods.crossing set latest_status_update_id = 530, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 530;
update floods.crossing set latest_status_update_id = 531, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 531;
update floods.crossing set latest_status_update_id = 532, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 532;
update floods.crossing set latest_status_update_id = 533, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 533;
update floods.crossing set latest_status_update_id = 534, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 534;
update floods.crossing set latest_status_update_id = 535, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 535;
update floods.crossing set latest_status_update_id = 536, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 536;
update floods.crossing set latest_status_update_id = 537, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 537;
update floods.crossing set latest_status_update_id = 538, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 538;
update floods.crossing set latest_status_update_id = 539, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 539;
update floods.crossing set latest_status_update_id = 540, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 540;
update floods.crossing set latest_status_update_id = 541, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 541;
update floods.crossing set latest_status_update_id = 542, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 542;
update floods.crossing set latest_status_update_id = 543, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 543;
update floods.crossing set latest_status_update_id = 544, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 544;
update floods.crossing set latest_status_update_id = 545, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 545;
update floods.crossing set latest_status_update_id = 546, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 546;
update floods.crossing set latest_status_update_id = 547, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 547;
update floods.crossing set latest_status_update_id = 548, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 548;
update floods.crossing set latest_status_update_id = 549, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 549;
update floods.crossing set latest_status_update_id = 550, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 550;
update floods.crossing set latest_status_update_id = 551, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 551;
update floods.crossing set latest_status_update_id = 552, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 552;
update floods.crossing set latest_status_update_id = 553, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 553;
update floods.crossing set latest_status_update_id = 554, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 554;
update floods.crossing set latest_status_update_id = 555, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 555;
update floods.crossing set latest_status_update_id = 556, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 556;
update floods.crossing set latest_status_update_id = 557, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 557;
update floods.crossing set latest_status_update_id = 558, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 558;
update floods.crossing set latest_status_update_id = 559, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 559;
update floods.crossing set latest_status_update_id = 560, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 560;
update floods.crossing set latest_status_update_id = 561, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 561;
update floods.crossing set latest_status_update_id = 562, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 562;
update floods.crossing set latest_status_update_id = 563, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 563;
update floods.crossing set latest_status_update_id = 564, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 564;
update floods.crossing set latest_status_update_id = 565, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 565;
update floods.crossing set latest_status_update_id = 566, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 566;
update floods.crossing set latest_status_update_id = 567, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 567;
update floods.crossing set latest_status_update_id = 568, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 568;
update floods.crossing set latest_status_update_id = 569, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 569;
update floods.crossing set latest_status_update_id = 570, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 570;
update floods.crossing set latest_status_update_id = 571, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 571;
update floods.crossing set latest_status_update_id = 572, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 572;
update floods.crossing set latest_status_update_id = 573, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 573;
update floods.crossing set latest_status_update_id = 574, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 574;
update floods.crossing set latest_status_update_id = 575, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 575;
update floods.crossing set latest_status_update_id = 576, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 576;
update floods.crossing set latest_status_update_id = 577, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 577;
update floods.crossing set latest_status_update_id = 578, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 578;
update floods.crossing set latest_status_update_id = 579, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 579;
update floods.crossing set latest_status_update_id = 580, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 580;
update floods.crossing set latest_status_update_id = 581, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 581;
update floods.crossing set latest_status_update_id = 582, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 582;
update floods.crossing set latest_status_update_id = 583, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 583;
update floods.crossing set latest_status_update_id = 584, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 584;
update floods.crossing set latest_status_update_id = 585, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 585;
update floods.crossing set latest_status_update_id = 586, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 586;
update floods.crossing set latest_status_update_id = 587, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 587;
update floods.crossing set latest_status_update_id = 588, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 588;
update floods.crossing set latest_status_update_id = 589, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 589;
update floods.crossing set latest_status_update_id = 590, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 590;
update floods.crossing set latest_status_update_id = 591, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 591;
update floods.crossing set latest_status_update_id = 592, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 592;
update floods.crossing set latest_status_update_id = 593, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 593;
update floods.crossing set latest_status_update_id = 594, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 594;
update floods.crossing set latest_status_update_id = 595, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 595;
update floods.crossing set latest_status_update_id = 596, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 596;
update floods.crossing set latest_status_update_id = 597, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 597;
update floods.crossing set latest_status_update_id = 598, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 598;
update floods.crossing set latest_status_update_id = 599, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 599;
update floods.crossing set latest_status_update_id = 600, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 600;
update floods.crossing set latest_status_update_id = 601, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 601;
update floods.crossing set latest_status_update_id = 602, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 602;
update floods.crossing set latest_status_update_id = 603, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 603;
update floods.crossing set latest_status_update_id = 604, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 604;
update floods.crossing set latest_status_update_id = 605, latest_status_id = 2, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 605;
update floods.crossing set latest_status_update_id = 606, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 606;
update floods.crossing set latest_status_update_id = 607, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 607;
update floods.crossing set latest_status_update_id = 608, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 608;
update floods.crossing set latest_status_update_id = 609, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 609;
update floods.crossing set latest_status_update_id = 610, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 610;
update floods.crossing set latest_status_update_id = 611, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 611;
update floods.crossing set latest_status_update_id = 612, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 612;
update floods.crossing set latest_status_update_id = 613, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 613;
update floods.crossing set latest_status_update_id = 614, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 614;
update floods.crossing set latest_status_update_id = 615, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 615;
update floods.crossing set latest_status_update_id = 616, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 616;
update floods.crossing set latest_status_update_id = 617, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 617;
update floods.crossing set latest_status_update_id = 618, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 618;
update floods.crossing set latest_status_update_id = 619, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 619;
update floods.crossing set latest_status_update_id = 620, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 620;
update floods.crossing set latest_status_update_id = 621, latest_status_id = 2, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 621;
update floods.crossing set latest_status_update_id = 622, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 622;
update floods.crossing set latest_status_update_id = 623, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 623;
update floods.crossing set latest_status_update_id = 624, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 624;
update floods.crossing set latest_status_update_id = 625, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 625;
update floods.crossing set latest_status_update_id = 626, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 626;
update floods.crossing set latest_status_update_id = 627, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 627;
update floods.crossing set latest_status_update_id = 628, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 628;
update floods.crossing set latest_status_update_id = 629, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 629;
update floods.crossing set latest_status_update_id = 630, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 630;
update floods.crossing set latest_status_update_id = 631, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 631;
update floods.crossing set latest_status_update_id = 632, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 632;
update floods.crossing set latest_status_update_id = 633, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 633;
update floods.crossing set latest_status_update_id = 634, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 634;
update floods.crossing set latest_status_update_id = 635, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 635;
update floods.crossing set latest_status_update_id = 636, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 636;
update floods.crossing set latest_status_update_id = 637, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 637;
update floods.crossing set latest_status_update_id = 638, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 638;
update floods.crossing set latest_status_update_id = 639, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 639;
update floods.crossing set latest_status_update_id = 640, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 640;
update floods.crossing set latest_status_update_id = 641, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 641;
update floods.crossing set latest_status_update_id = 642, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 642;
update floods.crossing set latest_status_update_id = 643, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 643;
update floods.crossing set latest_status_update_id = 644, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 644;
update floods.crossing set latest_status_update_id = 645, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 645;
update floods.crossing set latest_status_update_id = 646, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 646;
update floods.crossing set latest_status_update_id = 647, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 647;
update floods.crossing set latest_status_update_id = 648, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 648;
update floods.crossing set latest_status_update_id = 649, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 649;
update floods.crossing set latest_status_update_id = 650, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 650;
update floods.crossing set latest_status_update_id = 651, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 651;
update floods.crossing set latest_status_update_id = 652, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 652;
update floods.crossing set latest_status_update_id = 653, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 653;
update floods.crossing set latest_status_update_id = 654, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 654;
update floods.crossing set latest_status_update_id = 655, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 655;
update floods.crossing set latest_status_update_id = 656, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 656;
update floods.crossing set latest_status_update_id = 657, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 657;
update floods.crossing set latest_status_update_id = 658, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 658;
update floods.crossing set latest_status_update_id = 659, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 659;
update floods.crossing set latest_status_update_id = 660, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 660;
update floods.crossing set latest_status_update_id = 661, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 661;
update floods.crossing set latest_status_update_id = 662, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 662;
update floods.crossing set latest_status_update_id = 663, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 663;
update floods.crossing set latest_status_update_id = 664, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 664;
update floods.crossing set latest_status_update_id = 665, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 665;
update floods.crossing set latest_status_update_id = 666, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 666;
update floods.crossing set latest_status_update_id = 667, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 667;
update floods.crossing set latest_status_update_id = 668, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 668;
update floods.crossing set latest_status_update_id = 669, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 669;
update floods.crossing set latest_status_update_id = 670, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 670;
update floods.crossing set latest_status_update_id = 671, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 671;
update floods.crossing set latest_status_update_id = 672, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 672;
update floods.crossing set latest_status_update_id = 673, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 673;
update floods.crossing set latest_status_update_id = 674, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 674;
update floods.crossing set latest_status_update_id = 675, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 675;
update floods.crossing set latest_status_update_id = 676, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 676;
update floods.crossing set latest_status_update_id = 677, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 677;
update floods.crossing set latest_status_update_id = 678, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 678;
update floods.crossing set latest_status_update_id = 679, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 679;
update floods.crossing set latest_status_update_id = 680, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 680;
update floods.crossing set latest_status_update_id = 681, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 681;
update floods.crossing set latest_status_update_id = 682, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 682;
update floods.crossing set latest_status_update_id = 683, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 683;
update floods.crossing set latest_status_update_id = 684, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 684;
update floods.crossing set latest_status_update_id = 685, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 685;
update floods.crossing set latest_status_update_id = 686, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 686;
update floods.crossing set latest_status_update_id = 687, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 687;
update floods.crossing set latest_status_update_id = 688, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 688;
update floods.crossing set latest_status_update_id = 689, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 689;
update floods.crossing set latest_status_update_id = 690, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 690;
update floods.crossing set latest_status_update_id = 691, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 691;
update floods.crossing set latest_status_update_id = 692, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 692;
update floods.crossing set latest_status_update_id = 693, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 693;
update floods.crossing set latest_status_update_id = 694, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 694;
update floods.crossing set latest_status_update_id = 695, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 695;
update floods.crossing set latest_status_update_id = 696, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 696;
update floods.crossing set latest_status_update_id = 697, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 697;
update floods.crossing set latest_status_update_id = 698, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 698;
update floods.crossing set latest_status_update_id = 699, latest_status_id = 2, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 699;
update floods.crossing set latest_status_update_id = 700, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 700;
update floods.crossing set latest_status_update_id = 701, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 701;
update floods.crossing set latest_status_update_id = 702, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 702;
update floods.crossing set latest_status_update_id = 703, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 703;
update floods.crossing set latest_status_update_id = 704, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 704;
update floods.crossing set latest_status_update_id = 705, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 705;
update floods.crossing set latest_status_update_id = 706, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 706;
update floods.crossing set latest_status_update_id = 707, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 707;
update floods.crossing set latest_status_update_id = 708, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 708;
update floods.crossing set latest_status_update_id = 709, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 709;
update floods.crossing set latest_status_update_id = 710, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 710;
update floods.crossing set latest_status_update_id = 711, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 711;
update floods.crossing set latest_status_update_id = 712, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 712;
update floods.crossing set latest_status_update_id = 713, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 713;
update floods.crossing set latest_status_update_id = 714, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 714;
update floods.crossing set latest_status_update_id = 715, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 715;
update floods.crossing set latest_status_update_id = 716, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 716;
update floods.crossing set latest_status_update_id = 717, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 717;
update floods.crossing set latest_status_update_id = 718, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 718;
update floods.crossing set latest_status_update_id = 719, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 719;
update floods.crossing set latest_status_update_id = 720, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 720;
update floods.crossing set latest_status_update_id = 721, latest_status_id = 2, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 721;
update floods.crossing set latest_status_update_id = 722, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 722;
update floods.crossing set latest_status_update_id = 723, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 723;
update floods.crossing set latest_status_update_id = 724, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 724;
update floods.crossing set latest_status_update_id = 725, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 725;
update floods.crossing set latest_status_update_id = 726, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 726;
update floods.crossing set latest_status_update_id = 727, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 727;
update floods.crossing set latest_status_update_id = 728, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 728;
update floods.crossing set latest_status_update_id = 729, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 729;
update floods.crossing set latest_status_update_id = 730, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 730;
update floods.crossing set latest_status_update_id = 731, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 731;
update floods.crossing set latest_status_update_id = 732, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 732;
update floods.crossing set latest_status_update_id = 733, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 733;
update floods.crossing set latest_status_update_id = 734, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 734;
update floods.crossing set latest_status_update_id = 735, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 735;
update floods.crossing set latest_status_update_id = 736, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 736;
update floods.crossing set latest_status_update_id = 737, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 737;
update floods.crossing set latest_status_update_id = 738, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 738;
update floods.crossing set latest_status_update_id = 739, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 739;
update floods.crossing set latest_status_update_id = 740, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 740;
update floods.crossing set latest_status_update_id = 741, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 741;
update floods.crossing set latest_status_update_id = 742, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 742;
update floods.crossing set latest_status_update_id = 743, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 743;
update floods.crossing set latest_status_update_id = 744, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 744;
update floods.crossing set latest_status_update_id = 745, latest_status_id = 2, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 745;
update floods.crossing set latest_status_update_id = 746, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 746;
update floods.crossing set latest_status_update_id = 747, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 747;
update floods.crossing set latest_status_update_id = 748, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 748;
update floods.crossing set latest_status_update_id = 749, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 749;
update floods.crossing set latest_status_update_id = 750, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 750;
update floods.crossing set latest_status_update_id = 751, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 751;
update floods.crossing set latest_status_update_id = 752, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 752;
update floods.crossing set latest_status_update_id = 753, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 753;
update floods.crossing set latest_status_update_id = 754, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 754;
update floods.crossing set latest_status_update_id = 755, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 755;
update floods.crossing set latest_status_update_id = 756, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 756;
update floods.crossing set latest_status_update_id = 757, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 757;
update floods.crossing set latest_status_update_id = 758, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 758;
update floods.crossing set latest_status_update_id = 759, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 759;
update floods.crossing set latest_status_update_id = 760, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 760;
update floods.crossing set latest_status_update_id = 761, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 761;
update floods.crossing set latest_status_update_id = 762, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 762;
update floods.crossing set latest_status_update_id = 763, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 763;
update floods.crossing set latest_status_update_id = 764, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 764;
update floods.crossing set latest_status_update_id = 765, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 765;
update floods.crossing set latest_status_update_id = 766, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 766;
update floods.crossing set latest_status_update_id = 767, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 767;
update floods.crossing set latest_status_update_id = 768, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 768;
update floods.crossing set latest_status_update_id = 769, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 769;
update floods.crossing set latest_status_update_id = 770, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 770;
update floods.crossing set latest_status_update_id = 771, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 771;
update floods.crossing set latest_status_update_id = 772, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 772;
update floods.crossing set latest_status_update_id = 773, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 773;
update floods.crossing set latest_status_update_id = 774, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 774;
update floods.crossing set latest_status_update_id = 775, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 775;
update floods.crossing set latest_status_update_id = 776, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 776;
update floods.crossing set latest_status_update_id = 777, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 777;
update floods.crossing set latest_status_update_id = 778, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 778;
update floods.crossing set latest_status_update_id = 779, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 779;
update floods.crossing set latest_status_update_id = 780, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 780;
update floods.crossing set latest_status_update_id = 781, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 781;
update floods.crossing set latest_status_update_id = 782, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 782;
update floods.crossing set latest_status_update_id = 783, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 783;
update floods.crossing set latest_status_update_id = 784, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 784;
update floods.crossing set latest_status_update_id = 785, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 785;
update floods.crossing set latest_status_update_id = 786, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 786;
update floods.crossing set latest_status_update_id = 787, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 787;
update floods.crossing set latest_status_update_id = 788, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 788;
update floods.crossing set latest_status_update_id = 789, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 789;
update floods.crossing set latest_status_update_id = 790, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 790;
update floods.crossing set latest_status_update_id = 791, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 791;
update floods.crossing set latest_status_update_id = 792, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 792;
update floods.crossing set latest_status_update_id = 793, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 793;
update floods.crossing set latest_status_update_id = 794, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 794;
update floods.crossing set latest_status_update_id = 795, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 795;
update floods.crossing set latest_status_update_id = 796, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 796;
update floods.crossing set latest_status_update_id = 797, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 797;
update floods.crossing set latest_status_update_id = 798, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 798;
update floods.crossing set latest_status_update_id = 799, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 799;
update floods.crossing set latest_status_update_id = 800, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 800;
update floods.crossing set latest_status_update_id = 801, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 801;
update floods.crossing set latest_status_update_id = 802, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 802;
update floods.crossing set latest_status_update_id = 803, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 803;
update floods.crossing set latest_status_update_id = 804, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 804;
update floods.crossing set latest_status_update_id = 805, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 805;
update floods.crossing set latest_status_update_id = 806, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 806;
update floods.crossing set latest_status_update_id = 807, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 807;
update floods.crossing set latest_status_update_id = 808, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 808;
update floods.crossing set latest_status_update_id = 809, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 809;
update floods.crossing set latest_status_update_id = 810, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 810;
update floods.crossing set latest_status_update_id = 811, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 811;
update floods.crossing set latest_status_update_id = 812, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 812;
update floods.crossing set latest_status_update_id = 813, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 813;
update floods.crossing set latest_status_update_id = 814, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 814;
update floods.crossing set latest_status_update_id = 815, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 815;
update floods.crossing set latest_status_update_id = 816, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 816;
update floods.crossing set latest_status_update_id = 817, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 817;
update floods.crossing set latest_status_update_id = 818, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 818;
update floods.crossing set latest_status_update_id = 819, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 819;
update floods.crossing set latest_status_update_id = 820, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 820;
update floods.crossing set latest_status_update_id = 821, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 821;
update floods.crossing set latest_status_update_id = 822, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 822;
update floods.crossing set latest_status_update_id = 823, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 823;
update floods.crossing set latest_status_update_id = 824, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 824;
update floods.crossing set latest_status_update_id = 825, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 825;
update floods.crossing set latest_status_update_id = 826, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 826;
update floods.crossing set latest_status_update_id = 827, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 827;
update floods.crossing set latest_status_update_id = 828, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 828;
update floods.crossing set latest_status_update_id = 829, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 829;
update floods.crossing set latest_status_update_id = 830, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 830;
update floods.crossing set latest_status_update_id = 831, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 831;
update floods.crossing set latest_status_update_id = 832, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 832;
update floods.crossing set latest_status_update_id = 833, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 833;
update floods.crossing set latest_status_update_id = 834, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 834;
update floods.crossing set latest_status_update_id = 835, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 835;
update floods.crossing set latest_status_update_id = 836, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 836;
update floods.crossing set latest_status_update_id = 837, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 837;
update floods.crossing set latest_status_update_id = 838, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 838;
update floods.crossing set latest_status_update_id = 839, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 839;
update floods.crossing set latest_status_update_id = 840, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 840;
update floods.crossing set latest_status_update_id = 841, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 841;
update floods.crossing set latest_status_update_id = 842, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 842;
update floods.crossing set latest_status_update_id = 843, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 843;
update floods.crossing set latest_status_update_id = 844, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 844;
update floods.crossing set latest_status_update_id = 845, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 845;
update floods.crossing set latest_status_update_id = 846, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 846;
update floods.crossing set latest_status_update_id = 847, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 847;
update floods.crossing set latest_status_update_id = 848, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 848;
update floods.crossing set latest_status_update_id = 849, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 849;
update floods.crossing set latest_status_update_id = 850, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 850;
update floods.crossing set latest_status_update_id = 851, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 851;
update floods.crossing set latest_status_update_id = 852, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 852;
update floods.crossing set latest_status_update_id = 853, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 853;
update floods.crossing set latest_status_update_id = 854, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 854;
update floods.crossing set latest_status_update_id = 855, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 855;
update floods.crossing set latest_status_update_id = 856, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 856;
update floods.crossing set latest_status_update_id = 857, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 857;
update floods.crossing set latest_status_update_id = 858, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 858;
update floods.crossing set latest_status_update_id = 859, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 859;
update floods.crossing set latest_status_update_id = 860, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 860;
update floods.crossing set latest_status_update_id = 861, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 861;
update floods.crossing set latest_status_update_id = 862, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 862;
update floods.crossing set latest_status_update_id = 863, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 863;
update floods.crossing set latest_status_update_id = 864, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 864;
update floods.crossing set latest_status_update_id = 865, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 865;
update floods.crossing set latest_status_update_id = 866, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 866;
update floods.crossing set latest_status_update_id = 867, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 867;
update floods.crossing set latest_status_update_id = 868, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 868;
update floods.crossing set latest_status_update_id = 869, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 869;
update floods.crossing set latest_status_update_id = 870, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 870;
update floods.crossing set latest_status_update_id = 871, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 871;
update floods.crossing set latest_status_update_id = 872, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 872;
update floods.crossing set latest_status_update_id = 873, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 873;
update floods.crossing set latest_status_update_id = 874, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 874;
update floods.crossing set latest_status_update_id = 875, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 875;
update floods.crossing set latest_status_update_id = 876, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 876;
update floods.crossing set latest_status_update_id = 877, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 877;
update floods.crossing set latest_status_update_id = 878, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 878;
update floods.crossing set latest_status_update_id = 879, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 879;
update floods.crossing set latest_status_update_id = 880, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 880;
update floods.crossing set latest_status_update_id = 881, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 881;
update floods.crossing set latest_status_update_id = 882, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 882;
update floods.crossing set latest_status_update_id = 883, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 883;
update floods.crossing set latest_status_update_id = 884, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 884;
update floods.crossing set latest_status_update_id = 885, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 885;
update floods.crossing set latest_status_update_id = 886, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 886;
update floods.crossing set latest_status_update_id = 887, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 887;
update floods.crossing set latest_status_update_id = 888, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 888;
update floods.crossing set latest_status_update_id = 889, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 889;
update floods.crossing set latest_status_update_id = 890, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 890;
update floods.crossing set latest_status_update_id = 891, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 891;
update floods.crossing set latest_status_update_id = 892, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 892;
update floods.crossing set latest_status_update_id = 893, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 893;
update floods.crossing set latest_status_update_id = 894, latest_status_id = 2, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 894;
update floods.crossing set latest_status_update_id = 895, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 895;
update floods.crossing set latest_status_update_id = 896, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 896;
update floods.crossing set latest_status_update_id = 897, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 897;
update floods.crossing set latest_status_update_id = 898, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 898;
update floods.crossing set latest_status_update_id = 899, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 899;
update floods.crossing set latest_status_update_id = 900, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 900;
update floods.crossing set latest_status_update_id = 901, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 901;
update floods.crossing set latest_status_update_id = 902, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 902;
update floods.crossing set latest_status_update_id = 903, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 903;
update floods.crossing set latest_status_update_id = 904, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 904;
update floods.crossing set latest_status_update_id = 905, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 905;
update floods.crossing set latest_status_update_id = 906, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 906;
update floods.crossing set latest_status_update_id = 907, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 907;
update floods.crossing set latest_status_update_id = 908, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 908;
update floods.crossing set latest_status_update_id = 909, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 909;
update floods.crossing set latest_status_update_id = 910, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 910;
update floods.crossing set latest_status_update_id = 911, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 911;
update floods.crossing set latest_status_update_id = 912, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 912;
update floods.crossing set latest_status_update_id = 913, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 913;
update floods.crossing set latest_status_update_id = 914, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 914;
update floods.crossing set latest_status_update_id = 915, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 915;
update floods.crossing set latest_status_update_id = 916, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 916;
update floods.crossing set latest_status_update_id = 917, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 917;
update floods.crossing set latest_status_update_id = 918, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 918;
update floods.crossing set latest_status_update_id = 919, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 919;
update floods.crossing set latest_status_update_id = 920, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 920;
update floods.crossing set latest_status_update_id = 921, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 921;
update floods.crossing set latest_status_update_id = 922, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 922;
update floods.crossing set latest_status_update_id = 923, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 923;
update floods.crossing set latest_status_update_id = 924, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 924;
update floods.crossing set latest_status_update_id = 925, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 925;
update floods.crossing set latest_status_update_id = 926, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 926;
update floods.crossing set latest_status_update_id = 927, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 927;
update floods.crossing set latest_status_update_id = 928, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 928;
update floods.crossing set latest_status_update_id = 929, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 929;
update floods.crossing set latest_status_update_id = 930, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 930;
update floods.crossing set latest_status_update_id = 931, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 931;
update floods.crossing set latest_status_update_id = 932, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 932;
update floods.crossing set latest_status_update_id = 933, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 933;
update floods.crossing set latest_status_update_id = 934, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 934;
update floods.crossing set latest_status_update_id = 935, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 935;
update floods.crossing set latest_status_update_id = 936, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 936;
update floods.crossing set latest_status_update_id = 937, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 937;
update floods.crossing set latest_status_update_id = 938, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 938;
update floods.crossing set latest_status_update_id = 939, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 939;
update floods.crossing set latest_status_update_id = 940, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 940;
update floods.crossing set latest_status_update_id = 941, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 941;
update floods.crossing set latest_status_update_id = 942, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 942;
update floods.crossing set latest_status_update_id = 943, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 943;
update floods.crossing set latest_status_update_id = 944, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 944;
update floods.crossing set latest_status_update_id = 945, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 945;
update floods.crossing set latest_status_update_id = 946, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 946;
update floods.crossing set latest_status_update_id = 947, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 947;
update floods.crossing set latest_status_update_id = 948, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 948;
update floods.crossing set latest_status_update_id = 949, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 949;
update floods.crossing set latest_status_update_id = 950, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 950;
update floods.crossing set latest_status_update_id = 951, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 951;
update floods.crossing set latest_status_update_id = 952, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 952;
update floods.crossing set latest_status_update_id = 953, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 953;
update floods.crossing set latest_status_update_id = 954, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 954;
update floods.crossing set latest_status_update_id = 955, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 955;
update floods.crossing set latest_status_update_id = 956, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 956;
update floods.crossing set latest_status_update_id = 957, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 957;
update floods.crossing set latest_status_update_id = 958, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 958;
update floods.crossing set latest_status_update_id = 959, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 959;
update floods.crossing set latest_status_update_id = 960, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 960;
update floods.crossing set latest_status_update_id = 961, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 961;
update floods.crossing set latest_status_update_id = 962, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 962;
update floods.crossing set latest_status_update_id = 963, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 963;
update floods.crossing set latest_status_update_id = 964, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 964;
update floods.crossing set latest_status_update_id = 965, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 965;
update floods.crossing set latest_status_update_id = 966, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 966;
update floods.crossing set latest_status_update_id = 967, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 967;
update floods.crossing set latest_status_update_id = 968, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 968;
update floods.crossing set latest_status_update_id = 969, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 969;
update floods.crossing set latest_status_update_id = 970, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 970;
update floods.crossing set latest_status_update_id = 971, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 971;
update floods.crossing set latest_status_update_id = 972, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 972;
update floods.crossing set latest_status_update_id = 973, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 973;
update floods.crossing set latest_status_update_id = 974, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 974;
update floods.crossing set latest_status_update_id = 975, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 975;
update floods.crossing set latest_status_update_id = 976, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 976;
update floods.crossing set latest_status_update_id = 977, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 977;
update floods.crossing set latest_status_update_id = 978, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 978;
update floods.crossing set latest_status_update_id = 979, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 979;
update floods.crossing set latest_status_update_id = 980, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 980;
update floods.crossing set latest_status_update_id = 981, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 981;
update floods.crossing set latest_status_update_id = 982, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 982;
update floods.crossing set latest_status_update_id = 983, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 983;
update floods.crossing set latest_status_update_id = 984, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 984;
update floods.crossing set latest_status_update_id = 985, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 985;
update floods.crossing set latest_status_update_id = 986, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 986;
update floods.crossing set latest_status_update_id = 987, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 987;
update floods.crossing set latest_status_update_id = 988, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 988;
update floods.crossing set latest_status_update_id = 989, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 989;
update floods.crossing set latest_status_update_id = 990, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 990;
update floods.crossing set latest_status_update_id = 991, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 991;
update floods.crossing set latest_status_update_id = 992, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 992;
update floods.crossing set latest_status_update_id = 993, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 993;
update floods.crossing set latest_status_update_id = 994, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 994;
update floods.crossing set latest_status_update_id = 995, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 995;
update floods.crossing set latest_status_update_id = 996, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 996;
update floods.crossing set latest_status_update_id = 997, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 997;
update floods.crossing set latest_status_update_id = 998, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 998;
update floods.crossing set latest_status_update_id = 999, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 999;
update floods.crossing set latest_status_update_id = 1000, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1000;
update floods.crossing set latest_status_update_id = 1001, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1001;
update floods.crossing set latest_status_update_id = 1002, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1002;
update floods.crossing set latest_status_update_id = 1003, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1003;
update floods.crossing set latest_status_update_id = 1004, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1004;
update floods.crossing set latest_status_update_id = 1005, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1005;
update floods.crossing set latest_status_update_id = 1006, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1006;
update floods.crossing set latest_status_update_id = 1007, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1007;
update floods.crossing set latest_status_update_id = 1008, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1008;
update floods.crossing set latest_status_update_id = 1009, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1009;
update floods.crossing set latest_status_update_id = 1010, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1010;
update floods.crossing set latest_status_update_id = 1011, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1011;
update floods.crossing set latest_status_update_id = 1012, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1012;
update floods.crossing set latest_status_update_id = 1013, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1013;
update floods.crossing set latest_status_update_id = 1014, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1014;
update floods.crossing set latest_status_update_id = 1015, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1015;
update floods.crossing set latest_status_update_id = 1016, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1016;
update floods.crossing set latest_status_update_id = 1017, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1017;
update floods.crossing set latest_status_update_id = 1018, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1018;
update floods.crossing set latest_status_update_id = 1019, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1019;
update floods.crossing set latest_status_update_id = 1020, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1020;
update floods.crossing set latest_status_update_id = 1021, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1021;
update floods.crossing set latest_status_update_id = 1022, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1022;
update floods.crossing set latest_status_update_id = 1023, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1023;
update floods.crossing set latest_status_update_id = 1024, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1024;
update floods.crossing set latest_status_update_id = 1025, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1025;
update floods.crossing set latest_status_update_id = 1026, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1026;
update floods.crossing set latest_status_update_id = 1027, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1027;
update floods.crossing set latest_status_update_id = 1028, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1028;
update floods.crossing set latest_status_update_id = 1029, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1029;
update floods.crossing set latest_status_update_id = 1030, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1030;
update floods.crossing set latest_status_update_id = 1031, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1031;
update floods.crossing set latest_status_update_id = 1032, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1032;
update floods.crossing set latest_status_update_id = 1033, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1033;
update floods.crossing set latest_status_update_id = 1034, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1034;
update floods.crossing set latest_status_update_id = 1035, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1035;
update floods.crossing set latest_status_update_id = 1036, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1036;
update floods.crossing set latest_status_update_id = 1037, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1037;
update floods.crossing set latest_status_update_id = 1038, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1038;
update floods.crossing set latest_status_update_id = 1039, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1039;
update floods.crossing set latest_status_update_id = 1040, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1040;
update floods.crossing set latest_status_update_id = 1041, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1041;
update floods.crossing set latest_status_update_id = 1042, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1042;
update floods.crossing set latest_status_update_id = 1043, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1043;
update floods.crossing set latest_status_update_id = 1044, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1044;
update floods.crossing set latest_status_update_id = 1045, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1045;
update floods.crossing set latest_status_update_id = 1046, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1046;
update floods.crossing set latest_status_update_id = 1047, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1047;
update floods.crossing set latest_status_update_id = 1048, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1048;
update floods.crossing set latest_status_update_id = 1049, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1049;
update floods.crossing set latest_status_update_id = 1050, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1050;
update floods.crossing set latest_status_update_id = 1051, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1051;
update floods.crossing set latest_status_update_id = 1052, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1052;
update floods.crossing set latest_status_update_id = 1053, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1053;
update floods.crossing set latest_status_update_id = 1054, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1054;
update floods.crossing set latest_status_update_id = 1055, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1055;
update floods.crossing set latest_status_update_id = 1056, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1056;
update floods.crossing set latest_status_update_id = 1057, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1057;
update floods.crossing set latest_status_update_id = 1058, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1058;
update floods.crossing set latest_status_update_id = 1059, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1059;
update floods.crossing set latest_status_update_id = 1060, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1060;
update floods.crossing set latest_status_update_id = 1061, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1061;
update floods.crossing set latest_status_update_id = 1062, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1062;
update floods.crossing set latest_status_update_id = 1063, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1063;
update floods.crossing set latest_status_update_id = 1064, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1064;
update floods.crossing set latest_status_update_id = 1065, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1065;
update floods.crossing set latest_status_update_id = 1066, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1066;
update floods.crossing set latest_status_update_id = 1067, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1067;
update floods.crossing set latest_status_update_id = 1068, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1068;
update floods.crossing set latest_status_update_id = 1069, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1069;
update floods.crossing set latest_status_update_id = 1070, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1070;
update floods.crossing set latest_status_update_id = 1071, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1071;
update floods.crossing set latest_status_update_id = 1072, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1072;
update floods.crossing set latest_status_update_id = 1073, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1073;
update floods.crossing set latest_status_update_id = 1074, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1074;
update floods.crossing set latest_status_update_id = 1075, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1075;
update floods.crossing set latest_status_update_id = 1076, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1076;
update floods.crossing set latest_status_update_id = 1077, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1077;
update floods.crossing set latest_status_update_id = 1078, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1078;
update floods.crossing set latest_status_update_id = 1079, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1079;
update floods.crossing set latest_status_update_id = 1080, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1080;
update floods.crossing set latest_status_update_id = 1081, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1081;
update floods.crossing set latest_status_update_id = 1082, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1082;
update floods.crossing set latest_status_update_id = 1083, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1083;
update floods.crossing set latest_status_update_id = 1084, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1084;
update floods.crossing set latest_status_update_id = 1085, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1085;
update floods.crossing set latest_status_update_id = 1086, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1086;
update floods.crossing set latest_status_update_id = 1087, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1087;
update floods.crossing set latest_status_update_id = 1088, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1088;
update floods.crossing set latest_status_update_id = 1089, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1089;
update floods.crossing set latest_status_update_id = 1090, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1090;
update floods.crossing set latest_status_update_id = 1091, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1091;
update floods.crossing set latest_status_update_id = 1092, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1092;
update floods.crossing set latest_status_update_id = 1093, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1093;
update floods.crossing set latest_status_update_id = 1094, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1094;
update floods.crossing set latest_status_update_id = 1095, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1095;
update floods.crossing set latest_status_update_id = 1096, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1096;
update floods.crossing set latest_status_update_id = 1097, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1097;
update floods.crossing set latest_status_update_id = 1098, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1098;
update floods.crossing set latest_status_update_id = 1099, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1099;
update floods.crossing set latest_status_update_id = 1100, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1100;
update floods.crossing set latest_status_update_id = 1101, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1101;
update floods.crossing set latest_status_update_id = 1102, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1102;
update floods.crossing set latest_status_update_id = 1103, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1103;
update floods.crossing set latest_status_update_id = 1104, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1104;
update floods.crossing set latest_status_update_id = 1105, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1105;
update floods.crossing set latest_status_update_id = 1106, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1106;
update floods.crossing set latest_status_update_id = 1107, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1107;
update floods.crossing set latest_status_update_id = 1108, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1108;
update floods.crossing set latest_status_update_id = 1109, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1109;
update floods.crossing set latest_status_update_id = 1110, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1110;
update floods.crossing set latest_status_update_id = 1111, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1111;
update floods.crossing set latest_status_update_id = 1112, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1112;
update floods.crossing set latest_status_update_id = 1113, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1113;
update floods.crossing set latest_status_update_id = 1114, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1114;
update floods.crossing set latest_status_update_id = 1115, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1115;
update floods.crossing set latest_status_update_id = 1116, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1116;
update floods.crossing set latest_status_update_id = 1117, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1117;
update floods.crossing set latest_status_update_id = 1118, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1118;
update floods.crossing set latest_status_update_id = 1119, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1119;
update floods.crossing set latest_status_update_id = 1120, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1120;
update floods.crossing set latest_status_update_id = 1121, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1121;
update floods.crossing set latest_status_update_id = 1122, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1122;
update floods.crossing set latest_status_update_id = 1123, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1123;
update floods.crossing set latest_status_update_id = 1124, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1124;
update floods.crossing set latest_status_update_id = 1125, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1125;
update floods.crossing set latest_status_update_id = 1126, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1126;
update floods.crossing set latest_status_update_id = 1127, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1127;
update floods.crossing set latest_status_update_id = 1128, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1128;
update floods.crossing set latest_status_update_id = 1129, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1129;
update floods.crossing set latest_status_update_id = 1130, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1130;
update floods.crossing set latest_status_update_id = 1131, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1131;
update floods.crossing set latest_status_update_id = 1132, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1132;
update floods.crossing set latest_status_update_id = 1133, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1133;
update floods.crossing set latest_status_update_id = 1134, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1134;
update floods.crossing set latest_status_update_id = 1135, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1135;
update floods.crossing set latest_status_update_id = 1136, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1136;
update floods.crossing set latest_status_update_id = 1137, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1137;
update floods.crossing set latest_status_update_id = 1138, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1138;
update floods.crossing set latest_status_update_id = 1139, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1139;
update floods.crossing set latest_status_update_id = 1140, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1140;
update floods.crossing set latest_status_update_id = 1141, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1141;
update floods.crossing set latest_status_update_id = 1142, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1142;
update floods.crossing set latest_status_update_id = 1143, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1143;
update floods.crossing set latest_status_update_id = 1144, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1144;
update floods.crossing set latest_status_update_id = 1145, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1145;
update floods.crossing set latest_status_update_id = 1146, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1146;
update floods.crossing set latest_status_update_id = 1147, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1147;
update floods.crossing set latest_status_update_id = 1148, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1148;
update floods.crossing set latest_status_update_id = 1149, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1149;
update floods.crossing set latest_status_update_id = 1150, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1150;
update floods.crossing set latest_status_update_id = 1151, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1151;
update floods.crossing set latest_status_update_id = 1152, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1152;
update floods.crossing set latest_status_update_id = 1153, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1153;
update floods.crossing set latest_status_update_id = 1154, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1154;
update floods.crossing set latest_status_update_id = 1155, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1155;
update floods.crossing set latest_status_update_id = 1156, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1156;
update floods.crossing set latest_status_update_id = 1157, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1157;
update floods.crossing set latest_status_update_id = 1158, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1158;
update floods.crossing set latest_status_update_id = 1159, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1159;
update floods.crossing set latest_status_update_id = 1160, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1160;
update floods.crossing set latest_status_update_id = 1161, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1161;
update floods.crossing set latest_status_update_id = 1162, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1162;
update floods.crossing set latest_status_update_id = 1163, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1163;
update floods.crossing set latest_status_update_id = 1164, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1164;
update floods.crossing set latest_status_update_id = 1165, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1165;
update floods.crossing set latest_status_update_id = 1166, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1166;
update floods.crossing set latest_status_update_id = 1167, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1167;
update floods.crossing set latest_status_update_id = 1168, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1168;
update floods.crossing set latest_status_update_id = 1169, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1169;
update floods.crossing set latest_status_update_id = 1170, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1170;
update floods.crossing set latest_status_update_id = 1171, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1171;
update floods.crossing set latest_status_update_id = 1172, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1172;
update floods.crossing set latest_status_update_id = 1173, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1173;
update floods.crossing set latest_status_update_id = 1174, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1174;
update floods.crossing set latest_status_update_id = 1175, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1175;
update floods.crossing set latest_status_update_id = 1176, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1176;
update floods.crossing set latest_status_update_id = 1177, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1177;
update floods.crossing set latest_status_update_id = 1178, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1178;
update floods.crossing set latest_status_update_id = 1179, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1179;
update floods.crossing set latest_status_update_id = 1180, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1180;
update floods.crossing set latest_status_update_id = 1181, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1181;
update floods.crossing set latest_status_update_id = 1182, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1182;
update floods.crossing set latest_status_update_id = 1183, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1183;
update floods.crossing set latest_status_update_id = 1184, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1184;
update floods.crossing set latest_status_update_id = 1185, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1185;
update floods.crossing set latest_status_update_id = 1186, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1186;
update floods.crossing set latest_status_update_id = 1187, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1187;
update floods.crossing set latest_status_update_id = 1188, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1188;
update floods.crossing set latest_status_update_id = 1189, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1189;
update floods.crossing set latest_status_update_id = 1190, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1190;
update floods.crossing set latest_status_update_id = 1191, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1191;
update floods.crossing set latest_status_update_id = 1192, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1192;
update floods.crossing set latest_status_update_id = 1193, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1193;
update floods.crossing set latest_status_update_id = 1194, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1194;
update floods.crossing set latest_status_update_id = 1195, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1195;
update floods.crossing set latest_status_update_id = 1196, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1196;
update floods.crossing set latest_status_update_id = 1197, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1197;
update floods.crossing set latest_status_update_id = 1198, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1198;
update floods.crossing set latest_status_update_id = 1199, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1199;
update floods.crossing set latest_status_update_id = 1200, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1200;
update floods.crossing set latest_status_update_id = 1201, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1201;
update floods.crossing set latest_status_update_id = 1202, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1202;
update floods.crossing set latest_status_update_id = 1203, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1203;
update floods.crossing set latest_status_update_id = 1204, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1204;
update floods.crossing set latest_status_update_id = 1205, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1205;
update floods.crossing set latest_status_update_id = 1206, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1206;
update floods.crossing set latest_status_update_id = 1207, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1207;
update floods.crossing set latest_status_update_id = 1208, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1208;
update floods.crossing set latest_status_update_id = 1209, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1209;
update floods.crossing set latest_status_update_id = 1210, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1210;
update floods.crossing set latest_status_update_id = 1211, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1211;
update floods.crossing set latest_status_update_id = 1212, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1212;
update floods.crossing set latest_status_update_id = 1213, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1213;
update floods.crossing set latest_status_update_id = 1214, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1214;
update floods.crossing set latest_status_update_id = 1215, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1215;
update floods.crossing set latest_status_update_id = 1216, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1216;
update floods.crossing set latest_status_update_id = 1217, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1217;
update floods.crossing set latest_status_update_id = 1218, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1218;
update floods.crossing set latest_status_update_id = 1219, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1219;
update floods.crossing set latest_status_update_id = 1220, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1220;
update floods.crossing set latest_status_update_id = 1221, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1221;
update floods.crossing set latest_status_update_id = 1222, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1222;
update floods.crossing set latest_status_update_id = 1223, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1223;
update floods.crossing set latest_status_update_id = 1224, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1224;
update floods.crossing set latest_status_update_id = 1225, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1225;
update floods.crossing set latest_status_update_id = 1226, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1226;
update floods.crossing set latest_status_update_id = 1227, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1227;
update floods.crossing set latest_status_update_id = 1228, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1228;
update floods.crossing set latest_status_update_id = 1229, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1229;
update floods.crossing set latest_status_update_id = 1230, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1230;
update floods.crossing set latest_status_update_id = 1231, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1231;
update floods.crossing set latest_status_update_id = 1232, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1232;
update floods.crossing set latest_status_update_id = 1233, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1233;
update floods.crossing set latest_status_update_id = 1234, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1234;
update floods.crossing set latest_status_update_id = 1235, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1235;
update floods.crossing set latest_status_update_id = 1236, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1236;
update floods.crossing set latest_status_update_id = 1237, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1237;
update floods.crossing set latest_status_update_id = 1238, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1238;
update floods.crossing set latest_status_update_id = 1239, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1239;
update floods.crossing set latest_status_update_id = 1240, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1240;
update floods.crossing set latest_status_update_id = 1241, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1241;
update floods.crossing set latest_status_update_id = 1242, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1242;
update floods.crossing set latest_status_update_id = 1243, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1243;
update floods.crossing set latest_status_update_id = 1244, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1244;
update floods.crossing set latest_status_update_id = 1245, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1245;
update floods.crossing set latest_status_update_id = 1246, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1246;
update floods.crossing set latest_status_update_id = 1247, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1247;
update floods.crossing set latest_status_update_id = 1248, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1248;
update floods.crossing set latest_status_update_id = 1249, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1249;
update floods.crossing set latest_status_update_id = 1250, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1250;
update floods.crossing set latest_status_update_id = 1251, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1251;
update floods.crossing set latest_status_update_id = 1252, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1252;
update floods.crossing set latest_status_update_id = 1253, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1253;
update floods.crossing set latest_status_update_id = 1254, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1254;
update floods.crossing set latest_status_update_id = 1255, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1255;
update floods.crossing set latest_status_update_id = 1256, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1256;
update floods.crossing set latest_status_update_id = 1257, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1257;
update floods.crossing set latest_status_update_id = 1258, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1258;
update floods.crossing set latest_status_update_id = 1259, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1259;
update floods.crossing set latest_status_update_id = 1260, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1260;
update floods.crossing set latest_status_update_id = 1261, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1261;
update floods.crossing set latest_status_update_id = 1262, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1262;
update floods.crossing set latest_status_update_id = 1263, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1263;
update floods.crossing set latest_status_update_id = 1264, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1264;
update floods.crossing set latest_status_update_id = 1265, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1265;
update floods.crossing set latest_status_update_id = 1266, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1266;
update floods.crossing set latest_status_update_id = 1267, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1267;
update floods.crossing set latest_status_update_id = 1268, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1268;
update floods.crossing set latest_status_update_id = 1269, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1269;
update floods.crossing set latest_status_update_id = 1270, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1270;
update floods.crossing set latest_status_update_id = 1271, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1271;
update floods.crossing set latest_status_update_id = 1272, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1272;
update floods.crossing set latest_status_update_id = 1273, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1273;
update floods.crossing set latest_status_update_id = 1274, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1274;
update floods.crossing set latest_status_update_id = 1275, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1275;
update floods.crossing set latest_status_update_id = 1276, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1276;
update floods.crossing set latest_status_update_id = 1277, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1277;
update floods.crossing set latest_status_update_id = 1278, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1278;
update floods.crossing set latest_status_update_id = 1279, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1279;
update floods.crossing set latest_status_update_id = 1280, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1280;
update floods.crossing set latest_status_update_id = 1281, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1281;
update floods.crossing set latest_status_update_id = 1282, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1282;
update floods.crossing set latest_status_update_id = 1283, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1283;
update floods.crossing set latest_status_update_id = 1284, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1284;
update floods.crossing set latest_status_update_id = 1285, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1285;
update floods.crossing set latest_status_update_id = 1286, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1286;
update floods.crossing set latest_status_update_id = 1287, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1287;
update floods.crossing set latest_status_update_id = 1288, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1288;
update floods.crossing set latest_status_update_id = 1289, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1289;
update floods.crossing set latest_status_update_id = 1290, latest_status_id = 2, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1290;
update floods.crossing set latest_status_update_id = 1291, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1291;
update floods.crossing set latest_status_update_id = 1292, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1292;
update floods.crossing set latest_status_update_id = 1293, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1293;
update floods.crossing set latest_status_update_id = 1294, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1294;
update floods.crossing set latest_status_update_id = 1295, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1295;
update floods.crossing set latest_status_update_id = 1296, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1296;
update floods.crossing set latest_status_update_id = 1297, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1297;
update floods.crossing set latest_status_update_id = 1298, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1298;
update floods.crossing set latest_status_update_id = 1299, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1299;
update floods.crossing set latest_status_update_id = 1300, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1300;
update floods.crossing set latest_status_update_id = 1301, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1301;
update floods.crossing set latest_status_update_id = 1302, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1302;
update floods.crossing set latest_status_update_id = 1303, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1303;
update floods.crossing set latest_status_update_id = 1304, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1304;
update floods.crossing set latest_status_update_id = 1305, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1305;
update floods.crossing set latest_status_update_id = 1306, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1306;
update floods.crossing set latest_status_update_id = 1307, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1307;
update floods.crossing set latest_status_update_id = 1308, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1308;
update floods.crossing set latest_status_update_id = 1309, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1309;
update floods.crossing set latest_status_update_id = 1310, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1310;
update floods.crossing set latest_status_update_id = 1311, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1311;
update floods.crossing set latest_status_update_id = 1312, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1312;
update floods.crossing set latest_status_update_id = 1313, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1313;
update floods.crossing set latest_status_update_id = 1314, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1314;
update floods.crossing set latest_status_update_id = 1315, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1315;
update floods.crossing set latest_status_update_id = 1316, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1316;
update floods.crossing set latest_status_update_id = 1317, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1317;
update floods.crossing set latest_status_update_id = 1318, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1318;
update floods.crossing set latest_status_update_id = 1319, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1319;
update floods.crossing set latest_status_update_id = 1320, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1320;
update floods.crossing set latest_status_update_id = 1321, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1321;
update floods.crossing set latest_status_update_id = 1322, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1322;
update floods.crossing set latest_status_update_id = 1323, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1323;
update floods.crossing set latest_status_update_id = 1324, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1324;
update floods.crossing set latest_status_update_id = 1325, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1325;
update floods.crossing set latest_status_update_id = 1326, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1326;
update floods.crossing set latest_status_update_id = 1327, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1327;
update floods.crossing set latest_status_update_id = 1328, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1328;
update floods.crossing set latest_status_update_id = 1329, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1329;
update floods.crossing set latest_status_update_id = 1330, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1330;
update floods.crossing set latest_status_update_id = 1331, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1331;
update floods.crossing set latest_status_update_id = 1332, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1332;
update floods.crossing set latest_status_update_id = 1333, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1333;
update floods.crossing set latest_status_update_id = 1334, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1334;
update floods.crossing set latest_status_update_id = 1335, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1335;
update floods.crossing set latest_status_update_id = 1336, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1336;
update floods.crossing set latest_status_update_id = 1337, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1337;
update floods.crossing set latest_status_update_id = 1338, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1338;
update floods.crossing set latest_status_update_id = 1339, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1339;
update floods.crossing set latest_status_update_id = 1340, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1340;
update floods.crossing set latest_status_update_id = 1341, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1341;
update floods.crossing set latest_status_update_id = 1342, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1342;
update floods.crossing set latest_status_update_id = 1343, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1343;
update floods.crossing set latest_status_update_id = 1344, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1344;
update floods.crossing set latest_status_update_id = 1345, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1345;
update floods.crossing set latest_status_update_id = 1346, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1346;
update floods.crossing set latest_status_update_id = 1347, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1347;
update floods.crossing set latest_status_update_id = 1348, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1348;
update floods.crossing set latest_status_update_id = 1349, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1349;
update floods.crossing set latest_status_update_id = 1350, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1350;
update floods.crossing set latest_status_update_id = 1351, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1351;
update floods.crossing set latest_status_update_id = 1352, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1352;
update floods.crossing set latest_status_update_id = 1353, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1353;
update floods.crossing set latest_status_update_id = 1354, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1354;
update floods.crossing set latest_status_update_id = 1355, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1355;
update floods.crossing set latest_status_update_id = 1356, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1356;
update floods.crossing set latest_status_update_id = 1357, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1357;
update floods.crossing set latest_status_update_id = 1358, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1358;
update floods.crossing set latest_status_update_id = 1359, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1359;
update floods.crossing set latest_status_update_id = 1360, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1360;
update floods.crossing set latest_status_update_id = 1361, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1361;
update floods.crossing set latest_status_update_id = 1362, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1362;
update floods.crossing set latest_status_update_id = 1363, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1363;
update floods.crossing set latest_status_update_id = 1364, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1364;
update floods.crossing set latest_status_update_id = 1365, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1365;
update floods.crossing set latest_status_update_id = 1366, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1366;
update floods.crossing set latest_status_update_id = 1367, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1367;
update floods.crossing set latest_status_update_id = 1368, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1368;
update floods.crossing set latest_status_update_id = 1369, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1369;
update floods.crossing set latest_status_update_id = 1370, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1370;
update floods.crossing set latest_status_update_id = 1371, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1371;
update floods.crossing set latest_status_update_id = 1372, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1372;
update floods.crossing set latest_status_update_id = 1373, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1373;
update floods.crossing set latest_status_update_id = 1374, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1374;
update floods.crossing set latest_status_update_id = 1375, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1375;
update floods.crossing set latest_status_update_id = 1376, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1376;
update floods.crossing set latest_status_update_id = 1377, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1377;
update floods.crossing set latest_status_update_id = 1378, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1378;
update floods.crossing set latest_status_update_id = 1379, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1379;
update floods.crossing set latest_status_update_id = 1380, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1380;
update floods.crossing set latest_status_update_id = 1381, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1381;
update floods.crossing set latest_status_update_id = 1382, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1382;
update floods.crossing set latest_status_update_id = 1383, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1383;
update floods.crossing set latest_status_update_id = 1384, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1384;
update floods.crossing set latest_status_update_id = 1385, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1385;
update floods.crossing set latest_status_update_id = 1386, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1386;
update floods.crossing set latest_status_update_id = 1387, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1387;
update floods.crossing set latest_status_update_id = 1388, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1388;
update floods.crossing set latest_status_update_id = 1389, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1389;
update floods.crossing set latest_status_update_id = 1390, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1390;
update floods.crossing set latest_status_update_id = 1391, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1391;
update floods.crossing set latest_status_update_id = 1392, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1392;
update floods.crossing set latest_status_update_id = 1393, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1393;
update floods.crossing set latest_status_update_id = 1394, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1394;
update floods.crossing set latest_status_update_id = 1395, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1395;
update floods.crossing set latest_status_update_id = 1396, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1396;
update floods.crossing set latest_status_update_id = 1397, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1397;
update floods.crossing set latest_status_update_id = 1398, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1398;
update floods.crossing set latest_status_update_id = 1399, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1399;
update floods.crossing set latest_status_update_id = 1400, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1400;
update floods.crossing set latest_status_update_id = 1401, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1401;
update floods.crossing set latest_status_update_id = 1402, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1402;
update floods.crossing set latest_status_update_id = 1403, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1403;
update floods.crossing set latest_status_update_id = 1404, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1404;
update floods.crossing set latest_status_update_id = 1405, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1405;
update floods.crossing set latest_status_update_id = 1406, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1406;
update floods.crossing set latest_status_update_id = 1407, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1407;
update floods.crossing set latest_status_update_id = 1408, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1408;
update floods.crossing set latest_status_update_id = 1409, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1409;
update floods.crossing set latest_status_update_id = 1410, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1410;
update floods.crossing set latest_status_update_id = 1411, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1411;
update floods.crossing set latest_status_update_id = 1412, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1412;
update floods.crossing set latest_status_update_id = 1413, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1413;
update floods.crossing set latest_status_update_id = 1414, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1414;
update floods.crossing set latest_status_update_id = 1415, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1415;
update floods.crossing set latest_status_update_id = 1416, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1416;
update floods.crossing set latest_status_update_id = 1417, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1417;
update floods.crossing set latest_status_update_id = 1418, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1418;
update floods.crossing set latest_status_update_id = 1419, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1419;
update floods.crossing set latest_status_update_id = 1420, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1420;
update floods.crossing set latest_status_update_id = 1421, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1421;
update floods.crossing set latest_status_update_id = 1422, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1422;
update floods.crossing set latest_status_update_id = 1423, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1423;
update floods.crossing set latest_status_update_id = 1424, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1424;
update floods.crossing set latest_status_update_id = 1425, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1425;
update floods.crossing set latest_status_update_id = 1426, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1426;
update floods.crossing set latest_status_update_id = 1427, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1427;
update floods.crossing set latest_status_update_id = 1428, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1428;
update floods.crossing set latest_status_update_id = 1429, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1429;
update floods.crossing set latest_status_update_id = 1430, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1430;
update floods.crossing set latest_status_update_id = 1431, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1431;
update floods.crossing set latest_status_update_id = 1432, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1432;
update floods.crossing set latest_status_update_id = 1433, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1433;
update floods.crossing set latest_status_update_id = 1434, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1434;
update floods.crossing set latest_status_update_id = 1435, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1435;
update floods.crossing set latest_status_update_id = 1436, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1436;
update floods.crossing set latest_status_update_id = 1437, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1437;
update floods.crossing set latest_status_update_id = 1438, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1438;
update floods.crossing set latest_status_update_id = 1439, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1439;
update floods.crossing set latest_status_update_id = 1440, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1440;
update floods.crossing set latest_status_update_id = 1441, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1441;
update floods.crossing set latest_status_update_id = 1442, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1442;
update floods.crossing set latest_status_update_id = 1443, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1443;
update floods.crossing set latest_status_update_id = 1444, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1444;
update floods.crossing set latest_status_update_id = 1445, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1445;
update floods.crossing set latest_status_update_id = 1446, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1446;
update floods.crossing set latest_status_update_id = 1447, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1447;
update floods.crossing set latest_status_update_id = 1448, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1448;
update floods.crossing set latest_status_update_id = 1449, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1449;
update floods.crossing set latest_status_update_id = 1450, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1450;
update floods.crossing set latest_status_update_id = 1451, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1451;
update floods.crossing set latest_status_update_id = 1452, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1452;
update floods.crossing set latest_status_update_id = 1453, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1453;
update floods.crossing set latest_status_update_id = 1454, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1454;
update floods.crossing set latest_status_update_id = 1455, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1455;
update floods.crossing set latest_status_update_id = 1456, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1456;
update floods.crossing set latest_status_update_id = 1457, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1457;
update floods.crossing set latest_status_update_id = 1458, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1458;
update floods.crossing set latest_status_update_id = 1459, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1459;
update floods.crossing set latest_status_update_id = 1460, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1460;
update floods.crossing set latest_status_update_id = 1461, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1461;
update floods.crossing set latest_status_update_id = 1462, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1462;
update floods.crossing set latest_status_update_id = 1463, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1463;
update floods.crossing set latest_status_update_id = 1464, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1464;
update floods.crossing set latest_status_update_id = 1465, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1465;
update floods.crossing set latest_status_update_id = 1466, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1466;
update floods.crossing set latest_status_update_id = 1467, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1467;
update floods.crossing set latest_status_update_id = 1468, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1468;
update floods.crossing set latest_status_update_id = 1469, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1469;
update floods.crossing set latest_status_update_id = 1470, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1470;
update floods.crossing set latest_status_update_id = 1471, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1471;
update floods.crossing set latest_status_update_id = 1472, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1472;
update floods.crossing set latest_status_update_id = 1473, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1473;
update floods.crossing set latest_status_update_id = 1474, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1474;
update floods.crossing set latest_status_update_id = 1475, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1475;
update floods.crossing set latest_status_update_id = 1476, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1476;
update floods.crossing set latest_status_update_id = 1477, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1477;
update floods.crossing set latest_status_update_id = 1478, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1478;
update floods.crossing set latest_status_update_id = 1479, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1479;
update floods.crossing set latest_status_update_id = 1480, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1480;
update floods.crossing set latest_status_update_id = 1481, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1481;
update floods.crossing set latest_status_update_id = 1482, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1482;
update floods.crossing set latest_status_update_id = 1483, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1483;
update floods.crossing set latest_status_update_id = 1484, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1484;
update floods.crossing set latest_status_update_id = 1485, latest_status_id = 2, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1485;
update floods.crossing set latest_status_update_id = 1486, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1486;
update floods.crossing set latest_status_update_id = 1487, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1487;
update floods.crossing set latest_status_update_id = 1488, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1488;
update floods.crossing set latest_status_update_id = 1489, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1489;
update floods.crossing set latest_status_update_id = 1490, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1490;
update floods.crossing set latest_status_update_id = 1491, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1491;
update floods.crossing set latest_status_update_id = 1492, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1492;
update floods.crossing set latest_status_update_id = 1493, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1493;
update floods.crossing set latest_status_update_id = 1494, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1494;
update floods.crossing set latest_status_update_id = 1495, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1495;
update floods.crossing set latest_status_update_id = 1496, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1496;
update floods.crossing set latest_status_update_id = 1497, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1497;
update floods.crossing set latest_status_update_id = 1498, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1498;
update floods.crossing set latest_status_update_id = 1499, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1499;
update floods.crossing set latest_status_update_id = 1500, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1500;
update floods.crossing set latest_status_update_id = 1501, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1501;
update floods.crossing set latest_status_update_id = 1502, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1502;
update floods.crossing set latest_status_update_id = 1503, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1503;
update floods.crossing set latest_status_update_id = 1504, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1504;
update floods.crossing set latest_status_update_id = 1505, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1505;
update floods.crossing set latest_status_update_id = 1506, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1506;
update floods.crossing set latest_status_update_id = 1507, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1507;
update floods.crossing set latest_status_update_id = 1508, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1508;
update floods.crossing set latest_status_update_id = 1509, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1509;
update floods.crossing set latest_status_update_id = 1510, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1510;
update floods.crossing set latest_status_update_id = 1511, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1511;
update floods.crossing set latest_status_update_id = 1512, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1512;
update floods.crossing set latest_status_update_id = 1513, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1513;
update floods.crossing set latest_status_update_id = 1514, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1514;
update floods.crossing set latest_status_update_id = 1515, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1515;
update floods.crossing set latest_status_update_id = 1516, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1516;
update floods.crossing set latest_status_update_id = 1517, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1517;
update floods.crossing set latest_status_update_id = 1518, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1518;
update floods.crossing set latest_status_update_id = 1519, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1519;
update floods.crossing set latest_status_update_id = 1520, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1520;
update floods.crossing set latest_status_update_id = 1521, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1521;
update floods.crossing set latest_status_update_id = 1522, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1522;
update floods.crossing set latest_status_update_id = 1523, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1523;
update floods.crossing set latest_status_update_id = 1524, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1524;
update floods.crossing set latest_status_update_id = 1525, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1525;
update floods.crossing set latest_status_update_id = 1526, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1526;
update floods.crossing set latest_status_update_id = 1527, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1527;
update floods.crossing set latest_status_update_id = 1528, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1528;
update floods.crossing set latest_status_update_id = 1529, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1529;
update floods.crossing set latest_status_update_id = 1530, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1530;
update floods.crossing set latest_status_update_id = 1531, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1531;
update floods.crossing set latest_status_update_id = 1532, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1532;
update floods.crossing set latest_status_update_id = 1533, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1533;
update floods.crossing set latest_status_update_id = 1534, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1534;
update floods.crossing set latest_status_update_id = 1535, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1535;
update floods.crossing set latest_status_update_id = 1536, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1536;
update floods.crossing set latest_status_update_id = 1537, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1537;
update floods.crossing set latest_status_update_id = 1538, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1538;
update floods.crossing set latest_status_update_id = 1539, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1539;
update floods.crossing set latest_status_update_id = 1540, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1540;
update floods.crossing set latest_status_update_id = 1541, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1541;
update floods.crossing set latest_status_update_id = 1542, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1542;
update floods.crossing set latest_status_update_id = 1543, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1543;
update floods.crossing set latest_status_update_id = 1544, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1544;
update floods.crossing set latest_status_update_id = 1545, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1545;
update floods.crossing set latest_status_update_id = 1546, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1546;
update floods.crossing set latest_status_update_id = 1547, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1547;
update floods.crossing set latest_status_update_id = 1548, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1548;
update floods.crossing set latest_status_update_id = 1549, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1549;
update floods.crossing set latest_status_update_id = 1550, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1550;
update floods.crossing set latest_status_update_id = 1551, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1551;
update floods.crossing set latest_status_update_id = 1552, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1552;
update floods.crossing set latest_status_update_id = 1553, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1553;
update floods.crossing set latest_status_update_id = 1554, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1554;
update floods.crossing set latest_status_update_id = 1555, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1555;
update floods.crossing set latest_status_update_id = 1556, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1556;
update floods.crossing set latest_status_update_id = 1557, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1557;
update floods.crossing set latest_status_update_id = 1558, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1558;
update floods.crossing set latest_status_update_id = 1559, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1559;
update floods.crossing set latest_status_update_id = 1560, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1560;
update floods.crossing set latest_status_update_id = 1561, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1561;
update floods.crossing set latest_status_update_id = 1562, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1562;
update floods.crossing set latest_status_update_id = 1563, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1563;
update floods.crossing set latest_status_update_id = 1564, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1564;
update floods.crossing set latest_status_update_id = 1565, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1565;
update floods.crossing set latest_status_update_id = 1566, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1566;
update floods.crossing set latest_status_update_id = 1567, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1567;
update floods.crossing set latest_status_update_id = 1568, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1568;
update floods.crossing set latest_status_update_id = 1569, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1569;
update floods.crossing set latest_status_update_id = 1570, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1570;
update floods.crossing set latest_status_update_id = 1571, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1571;
update floods.crossing set latest_status_update_id = 1572, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1572;
update floods.crossing set latest_status_update_id = 1573, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1573;
update floods.crossing set latest_status_update_id = 1574, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1574;
update floods.crossing set latest_status_update_id = 1575, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1575;
update floods.crossing set latest_status_update_id = 1576, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1576;
update floods.crossing set latest_status_update_id = 1577, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1577;
update floods.crossing set latest_status_update_id = 1578, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1578;
update floods.crossing set latest_status_update_id = 1579, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1579;
update floods.crossing set latest_status_update_id = 1580, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1580;
update floods.crossing set latest_status_update_id = 1581, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1581;
update floods.crossing set latest_status_update_id = 1582, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1582;
update floods.crossing set latest_status_update_id = 1583, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1583;
update floods.crossing set latest_status_update_id = 1584, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1584;
update floods.crossing set latest_status_update_id = 1585, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1585;
update floods.crossing set latest_status_update_id = 1586, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1586;
update floods.crossing set latest_status_update_id = 1587, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1587;
update floods.crossing set latest_status_update_id = 1588, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1588;
update floods.crossing set latest_status_update_id = 1589, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1589;
update floods.crossing set latest_status_update_id = 1590, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1590;
update floods.crossing set latest_status_update_id = 1591, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1591;
update floods.crossing set latest_status_update_id = 1592, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1592;
update floods.crossing set latest_status_update_id = 1593, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1593;
update floods.crossing set latest_status_update_id = 1594, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1594;
update floods.crossing set latest_status_update_id = 1595, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1595;
update floods.crossing set latest_status_update_id = 1596, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1596;
update floods.crossing set latest_status_update_id = 1597, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1597;
update floods.crossing set latest_status_update_id = 1598, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1598;
update floods.crossing set latest_status_update_id = 1599, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1599;
update floods.crossing set latest_status_update_id = 1600, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1600;
update floods.crossing set latest_status_update_id = 1601, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1601;
update floods.crossing set latest_status_update_id = 1602, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1602;
update floods.crossing set latest_status_update_id = 1603, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1603;
update floods.crossing set latest_status_update_id = 1604, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1604;
update floods.crossing set latest_status_update_id = 1605, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1605;
update floods.crossing set latest_status_update_id = 1606, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1606;
update floods.crossing set latest_status_update_id = 1607, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1607;
update floods.crossing set latest_status_update_id = 1608, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1608;
update floods.crossing set latest_status_update_id = 1609, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1609;
update floods.crossing set latest_status_update_id = 1610, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1610;
update floods.crossing set latest_status_update_id = 1611, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1611;
update floods.crossing set latest_status_update_id = 1612, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1612;
update floods.crossing set latest_status_update_id = 1613, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1613;
update floods.crossing set latest_status_update_id = 1614, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1614;
update floods.crossing set latest_status_update_id = 1615, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1615;
update floods.crossing set latest_status_update_id = 1616, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1616;
update floods.crossing set latest_status_update_id = 1617, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1617;
update floods.crossing set latest_status_update_id = 1618, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1618;
update floods.crossing set latest_status_update_id = 1619, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1619;
update floods.crossing set latest_status_update_id = 1620, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1620;
update floods.crossing set latest_status_update_id = 1621, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1621;
update floods.crossing set latest_status_update_id = 1622, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1622;
update floods.crossing set latest_status_update_id = 1623, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1623;
update floods.crossing set latest_status_update_id = 1624, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1624;
update floods.crossing set latest_status_update_id = 1625, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1625;
update floods.crossing set latest_status_update_id = 1626, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1626;
update floods.crossing set latest_status_update_id = 1627, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1627;
update floods.crossing set latest_status_update_id = 1628, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1628;
update floods.crossing set latest_status_update_id = 1629, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1629;
update floods.crossing set latest_status_update_id = 1630, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1630;
update floods.crossing set latest_status_update_id = 1631, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1631;
update floods.crossing set latest_status_update_id = 1632, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1632;
update floods.crossing set latest_status_update_id = 1633, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1633;
update floods.crossing set latest_status_update_id = 1634, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1634;
update floods.crossing set latest_status_update_id = 1635, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1635;
update floods.crossing set latest_status_update_id = 1636, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1636;
update floods.crossing set latest_status_update_id = 1637, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1637;
update floods.crossing set latest_status_update_id = 1638, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1638;
update floods.crossing set latest_status_update_id = 1639, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1639;
update floods.crossing set latest_status_update_id = 1640, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1640;
update floods.crossing set latest_status_update_id = 1641, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1641;
update floods.crossing set latest_status_update_id = 1642, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1642;
update floods.crossing set latest_status_update_id = 1643, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1643;
update floods.crossing set latest_status_update_id = 1644, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1644;
update floods.crossing set latest_status_update_id = 1645, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1645;
update floods.crossing set latest_status_update_id = 1646, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1646;
update floods.crossing set latest_status_update_id = 1647, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1647;
update floods.crossing set latest_status_update_id = 1648, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1648;
update floods.crossing set latest_status_update_id = 1649, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1649;
update floods.crossing set latest_status_update_id = 1650, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1650;
update floods.crossing set latest_status_update_id = 1651, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1651;
update floods.crossing set latest_status_update_id = 1652, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1652;
update floods.crossing set latest_status_update_id = 1653, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1653;
update floods.crossing set latest_status_update_id = 1654, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1654;
update floods.crossing set latest_status_update_id = 1655, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1655;
update floods.crossing set latest_status_update_id = 1656, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1656;
update floods.crossing set latest_status_update_id = 1657, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1657;
update floods.crossing set latest_status_update_id = 1658, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1658;
update floods.crossing set latest_status_update_id = 1659, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1659;
update floods.crossing set latest_status_update_id = 1660, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1660;
update floods.crossing set latest_status_update_id = 1661, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1661;
update floods.crossing set latest_status_update_id = 1662, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1662;
update floods.crossing set latest_status_update_id = 1663, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1663;
update floods.crossing set latest_status_update_id = 1664, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1664;
update floods.crossing set latest_status_update_id = 1665, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1665;
update floods.crossing set latest_status_update_id = 1666, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1666;
update floods.crossing set latest_status_update_id = 1667, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1667;
update floods.crossing set latest_status_update_id = 1668, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1668;
update floods.crossing set latest_status_update_id = 1669, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1669;
update floods.crossing set latest_status_update_id = 1670, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1670;
update floods.crossing set latest_status_update_id = 1671, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1671;
update floods.crossing set latest_status_update_id = 1672, latest_status_id = 2, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1672;
update floods.crossing set latest_status_update_id = 1673, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1673;
update floods.crossing set latest_status_update_id = 1674, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1674;
update floods.crossing set latest_status_update_id = 1675, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1675;
update floods.crossing set latest_status_update_id = 1676, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1676;
update floods.crossing set latest_status_update_id = 1677, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1677;
update floods.crossing set latest_status_update_id = 1678, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1678;
update floods.crossing set latest_status_update_id = 1679, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1679;
update floods.crossing set latest_status_update_id = 1680, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1680;
update floods.crossing set latest_status_update_id = 1681, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1681;
update floods.crossing set latest_status_update_id = 1682, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1682;
update floods.crossing set latest_status_update_id = 1683, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1683;
update floods.crossing set latest_status_update_id = 1684, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1684;
update floods.crossing set latest_status_update_id = 1685, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1685;
update floods.crossing set latest_status_update_id = 1686, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1686;
update floods.crossing set latest_status_update_id = 1687, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1687;
update floods.crossing set latest_status_update_id = 1688, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1688;
update floods.crossing set latest_status_update_id = 1689, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1689;
update floods.crossing set latest_status_update_id = 1690, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1690;
update floods.crossing set latest_status_update_id = 1691, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1691;
update floods.crossing set latest_status_update_id = 1692, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1692;
update floods.crossing set latest_status_update_id = 1693, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1693;
update floods.crossing set latest_status_update_id = 1694, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1694;
update floods.crossing set latest_status_update_id = 1695, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1695;
update floods.crossing set latest_status_update_id = 1696, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1696;
update floods.crossing set latest_status_update_id = 1697, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1697;
update floods.crossing set latest_status_update_id = 1698, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1698;
update floods.crossing set latest_status_update_id = 1699, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1699;
update floods.crossing set latest_status_update_id = 1700, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1700;
update floods.crossing set latest_status_update_id = 1701, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1701;
update floods.crossing set latest_status_update_id = 1702, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1702;
update floods.crossing set latest_status_update_id = 1703, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1703;
update floods.crossing set latest_status_update_id = 1704, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1704;
update floods.crossing set latest_status_update_id = 1705, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1705;
update floods.crossing set latest_status_update_id = 1706, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1706;
update floods.crossing set latest_status_update_id = 1707, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1707;
update floods.crossing set latest_status_update_id = 1708, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1708;
update floods.crossing set latest_status_update_id = 1709, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1709;
update floods.crossing set latest_status_update_id = 1710, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1710;
update floods.crossing set latest_status_update_id = 1711, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1711;
update floods.crossing set latest_status_update_id = 1712, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1712;
update floods.crossing set latest_status_update_id = 1713, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1713;
update floods.crossing set latest_status_update_id = 1714, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1714;
update floods.crossing set latest_status_update_id = 1715, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1715;
update floods.crossing set latest_status_update_id = 1716, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1716;
update floods.crossing set latest_status_update_id = 1717, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1717;
update floods.crossing set latest_status_update_id = 1718, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1718;
update floods.crossing set latest_status_update_id = 1719, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1719;
update floods.crossing set latest_status_update_id = 1720, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1720;
update floods.crossing set latest_status_update_id = 1721, latest_status_id = 2, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1721;
update floods.crossing set latest_status_update_id = 1722, latest_status_id = 2, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1722;
update floods.crossing set latest_status_update_id = 1723, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1723;
update floods.crossing set latest_status_update_id = 1724, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1724;
update floods.crossing set latest_status_update_id = 1725, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1725;
update floods.crossing set latest_status_update_id = 1726, latest_status_id = 2, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1726;
update floods.crossing set latest_status_update_id = 1727, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1727;
update floods.crossing set latest_status_update_id = 1728, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1728;
update floods.crossing set latest_status_update_id = 1729, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1729;
update floods.crossing set latest_status_update_id = 1730, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1730;
update floods.crossing set latest_status_update_id = 1731, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1731;
update floods.crossing set latest_status_update_id = 1732, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1732;
update floods.crossing set latest_status_update_id = 1733, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1733;
update floods.crossing set latest_status_update_id = 1734, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1734;
update floods.crossing set latest_status_update_id = 1735, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1735;
update floods.crossing set latest_status_update_id = 1736, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1736;
update floods.crossing set latest_status_update_id = 1737, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1737;
update floods.crossing set latest_status_update_id = 1738, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1738;
update floods.crossing set latest_status_update_id = 1739, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1739;
update floods.crossing set latest_status_update_id = 1740, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1740;
update floods.crossing set latest_status_update_id = 1741, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1741;
update floods.crossing set latest_status_update_id = 1742, latest_status_id = 2, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1742;
update floods.crossing set latest_status_update_id = 1743, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1743;
update floods.crossing set latest_status_update_id = 1744, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1744;
update floods.crossing set latest_status_update_id = 1745, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1745;
update floods.crossing set latest_status_update_id = 1746, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1746;
update floods.crossing set latest_status_update_id = 1747, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1747;
update floods.crossing set latest_status_update_id = 1748, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1748;
update floods.crossing set latest_status_update_id = 1749, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1749;
update floods.crossing set latest_status_update_id = 1750, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1750;
update floods.crossing set latest_status_update_id = 1751, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1751;
update floods.crossing set latest_status_update_id = 1752, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1752;
update floods.crossing set latest_status_update_id = 1753, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1753;
update floods.crossing set latest_status_update_id = 1754, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1754;
update floods.crossing set latest_status_update_id = 1755, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1755;
update floods.crossing set latest_status_update_id = 1756, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1756;
update floods.crossing set latest_status_update_id = 1757, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1757;
update floods.crossing set latest_status_update_id = 1758, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1758;
update floods.crossing set latest_status_update_id = 1759, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1759;
update floods.crossing set latest_status_update_id = 1760, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1760;
update floods.crossing set latest_status_update_id = 1761, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1761;
update floods.crossing set latest_status_update_id = 1762, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1762;
update floods.crossing set latest_status_update_id = 1763, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1763;
update floods.crossing set latest_status_update_id = 1764, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1764;
update floods.crossing set latest_status_update_id = 1765, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1765;
update floods.crossing set latest_status_update_id = 1766, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1766;
update floods.crossing set latest_status_update_id = 1767, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1767;
update floods.crossing set latest_status_update_id = 1768, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1768;
update floods.crossing set latest_status_update_id = 1769, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1769;
update floods.crossing set latest_status_update_id = 1770, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1770;
update floods.crossing set latest_status_update_id = 1771, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1771;
update floods.crossing set latest_status_update_id = 1772, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1772;
update floods.crossing set latest_status_update_id = 1773, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1773;
update floods.crossing set latest_status_update_id = 1774, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1774;
update floods.crossing set latest_status_update_id = 1775, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1775;
update floods.crossing set latest_status_update_id = 1776, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1776;
update floods.crossing set latest_status_update_id = 1777, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1777;
update floods.crossing set latest_status_update_id = 1778, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1778;
update floods.crossing set latest_status_update_id = 1779, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1779;
update floods.crossing set latest_status_update_id = 1780, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1780;
update floods.crossing set latest_status_update_id = 1781, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1781;
update floods.crossing set latest_status_update_id = 1782, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1782;
update floods.crossing set latest_status_update_id = 1783, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1783;
update floods.crossing set latest_status_update_id = 1784, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1784;
update floods.crossing set latest_status_update_id = 1785, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1785;
update floods.crossing set latest_status_update_id = 1786, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1786;
update floods.crossing set latest_status_update_id = 1787, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1787;
update floods.crossing set latest_status_update_id = 1788, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1788;
update floods.crossing set latest_status_update_id = 1789, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1789;
update floods.crossing set latest_status_update_id = 1790, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1790;
update floods.crossing set latest_status_update_id = 1791, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1791;
update floods.crossing set latest_status_update_id = 1792, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1792;
update floods.crossing set latest_status_update_id = 1793, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1793;
update floods.crossing set latest_status_update_id = 1794, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1794;
update floods.crossing set latest_status_update_id = 1795, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1795;
update floods.crossing set latest_status_update_id = 1796, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1796;
update floods.crossing set latest_status_update_id = 1797, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1797;
update floods.crossing set latest_status_update_id = 1798, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1798;
update floods.crossing set latest_status_update_id = 1799, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1799;
update floods.crossing set latest_status_update_id = 1800, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1800;
update floods.crossing set latest_status_update_id = 1801, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1801;
update floods.crossing set latest_status_update_id = 1802, latest_status_id = 2, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1802;
update floods.crossing set latest_status_update_id = 1803, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1803;
update floods.crossing set latest_status_update_id = 1804, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1804;
update floods.crossing set latest_status_update_id = 1805, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1805;
update floods.crossing set latest_status_update_id = 1806, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1806;
update floods.crossing set latest_status_update_id = 1807, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1807;
update floods.crossing set latest_status_update_id = 1808, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1808;
update floods.crossing set latest_status_update_id = 1809, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1809;
update floods.crossing set latest_status_update_id = 1810, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1810;
update floods.crossing set latest_status_update_id = 1811, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1811;
update floods.crossing set latest_status_update_id = 1812, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1812;
update floods.crossing set latest_status_update_id = 1813, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1813;
update floods.crossing set latest_status_update_id = 1814, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1814;
update floods.crossing set latest_status_update_id = 1815, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1815;
update floods.crossing set latest_status_update_id = 1816, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1816;
update floods.crossing set latest_status_update_id = 1817, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1817;
update floods.crossing set latest_status_update_id = 1818, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1818;
update floods.crossing set latest_status_update_id = 1819, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1819;
update floods.crossing set latest_status_update_id = 1820, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1820;
update floods.crossing set latest_status_update_id = 1821, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1821;
update floods.crossing set latest_status_update_id = 1822, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1822;
update floods.crossing set latest_status_update_id = 1823, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1823;
update floods.crossing set latest_status_update_id = 1824, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1824;
update floods.crossing set latest_status_update_id = 1825, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1825;
update floods.crossing set latest_status_update_id = 1826, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1826;
update floods.crossing set latest_status_update_id = 1827, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1827;
update floods.crossing set latest_status_update_id = 1828, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1828;
update floods.crossing set latest_status_update_id = 1829, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1829;
update floods.crossing set latest_status_update_id = 1830, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1830;
update floods.crossing set latest_status_update_id = 1831, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1831;
update floods.crossing set latest_status_update_id = 1832, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1832;
update floods.crossing set latest_status_update_id = 1833, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1833;
update floods.crossing set latest_status_update_id = 1834, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1834;
update floods.crossing set latest_status_update_id = 1835, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1835;
update floods.crossing set latest_status_update_id = 1836, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1836;
update floods.crossing set latest_status_update_id = 1837, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1837;
update floods.crossing set latest_status_update_id = 1838, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1838;
update floods.crossing set latest_status_update_id = 1839, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1839;
update floods.crossing set latest_status_update_id = 1840, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1840;
update floods.crossing set latest_status_update_id = 1841, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1841;
update floods.crossing set latest_status_update_id = 1842, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1842;
update floods.crossing set latest_status_update_id = 1843, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1843;
update floods.crossing set latest_status_update_id = 1844, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1844;
update floods.crossing set latest_status_update_id = 1845, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1845;
update floods.crossing set latest_status_update_id = 1846, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1846;
update floods.crossing set latest_status_update_id = 1847, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1847;
update floods.crossing set latest_status_update_id = 1848, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1848;
update floods.crossing set latest_status_update_id = 1849, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1849;
update floods.crossing set latest_status_update_id = 1850, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1850;
update floods.crossing set latest_status_update_id = 1851, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1851;
update floods.crossing set latest_status_update_id = 1852, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1852;
update floods.crossing set latest_status_update_id = 1853, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1853;
update floods.crossing set latest_status_update_id = 1854, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1854;
update floods.crossing set latest_status_update_id = 1855, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1855;
update floods.crossing set latest_status_update_id = 1856, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1856;
update floods.crossing set latest_status_update_id = 1857, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1857;
update floods.crossing set latest_status_update_id = 1858, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1858;
update floods.crossing set latest_status_update_id = 1859, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1859;
update floods.crossing set latest_status_update_id = 1860, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1860;
update floods.crossing set latest_status_update_id = 1861, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1861;
update floods.crossing set latest_status_update_id = 1862, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1862;
update floods.crossing set latest_status_update_id = 1863, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1863;
update floods.crossing set latest_status_update_id = 1864, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1864;
update floods.crossing set latest_status_update_id = 1865, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1865;
update floods.crossing set latest_status_update_id = 1866, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1866;
update floods.crossing set latest_status_update_id = 1867, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1867;
update floods.crossing set latest_status_update_id = 1868, latest_status_id = 2, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1868;
update floods.crossing set latest_status_update_id = 1869, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1869;
update floods.crossing set latest_status_update_id = 1870, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1870;
update floods.crossing set latest_status_update_id = 1871, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1871;
update floods.crossing set latest_status_update_id = 1872, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1872;
update floods.crossing set latest_status_update_id = 1873, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1873;
update floods.crossing set latest_status_update_id = 1874, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1874;
update floods.crossing set latest_status_update_id = 1875, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1875;
update floods.crossing set latest_status_update_id = 1876, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1876;
update floods.crossing set latest_status_update_id = 1877, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1877;
update floods.crossing set latest_status_update_id = 1878, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1878;
update floods.crossing set latest_status_update_id = 1879, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1879;
update floods.crossing set latest_status_update_id = 1880, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1880;
update floods.crossing set latest_status_update_id = 1881, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1881;
update floods.crossing set latest_status_update_id = 1882, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1882;
update floods.crossing set latest_status_update_id = 1883, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1883;
update floods.crossing set latest_status_update_id = 1884, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1884;
update floods.crossing set latest_status_update_id = 1885, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1885;
update floods.crossing set latest_status_update_id = 1886, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1886;
update floods.crossing set latest_status_update_id = 1887, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1887;
update floods.crossing set latest_status_update_id = 1888, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1888;
update floods.crossing set latest_status_update_id = 1889, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1889;
update floods.crossing set latest_status_update_id = 1890, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1890;
update floods.crossing set latest_status_update_id = 1891, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1891;
update floods.crossing set latest_status_update_id = 1892, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1892;
update floods.crossing set latest_status_update_id = 1893, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1893;
update floods.crossing set latest_status_update_id = 1894, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1894;
update floods.crossing set latest_status_update_id = 1895, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1895;
update floods.crossing set latest_status_update_id = 1896, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1896;
update floods.crossing set latest_status_update_id = 1897, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1897;
update floods.crossing set latest_status_update_id = 1898, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1898;
update floods.crossing set latest_status_update_id = 1899, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1899;
update floods.crossing set latest_status_update_id = 1900, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1900;
update floods.crossing set latest_status_update_id = 1901, latest_status_id = 2, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1901;
update floods.crossing set latest_status_update_id = 1902, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1902;
update floods.crossing set latest_status_update_id = 1903, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1903;
update floods.crossing set latest_status_update_id = 1904, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1904;
update floods.crossing set latest_status_update_id = 1905, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1905;
update floods.crossing set latest_status_update_id = 1906, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1906;
update floods.crossing set latest_status_update_id = 1907, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1907;
update floods.crossing set latest_status_update_id = 1908, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1908;
update floods.crossing set latest_status_update_id = 1909, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1909;
update floods.crossing set latest_status_update_id = 1910, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1910;
update floods.crossing set latest_status_update_id = 1911, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1911;
update floods.crossing set latest_status_update_id = 1912, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1912;
update floods.crossing set latest_status_update_id = 1913, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1913;
update floods.crossing set latest_status_update_id = 1914, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1914;
update floods.crossing set latest_status_update_id = 1915, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1915;
update floods.crossing set latest_status_update_id = 1916, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1916;
update floods.crossing set latest_status_update_id = 1917, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1917;
update floods.crossing set latest_status_update_id = 1918, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1918;
update floods.crossing set latest_status_update_id = 1919, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1919;
update floods.crossing set latest_status_update_id = 1920, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1920;
update floods.crossing set latest_status_update_id = 1921, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1921;
update floods.crossing set latest_status_update_id = 1922, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1922;
update floods.crossing set latest_status_update_id = 1923, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1923;
update floods.crossing set latest_status_update_id = 1924, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1924;
update floods.crossing set latest_status_update_id = 1925, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1925;
update floods.crossing set latest_status_update_id = 1926, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1926;
update floods.crossing set latest_status_update_id = 1927, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1927;
update floods.crossing set latest_status_update_id = 1928, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1928;
update floods.crossing set latest_status_update_id = 1929, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1929;
update floods.crossing set latest_status_update_id = 1930, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1930;
update floods.crossing set latest_status_update_id = 1931, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1931;
update floods.crossing set latest_status_update_id = 1932, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1932;
update floods.crossing set latest_status_update_id = 1933, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1933;
update floods.crossing set latest_status_update_id = 1934, latest_status_id = 2, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1934;
update floods.crossing set latest_status_update_id = 1935, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1935;
update floods.crossing set latest_status_update_id = 1936, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1936;
update floods.crossing set latest_status_update_id = 1937, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1937;
update floods.crossing set latest_status_update_id = 1938, latest_status_id = 2, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1938;
update floods.crossing set latest_status_update_id = 1939, latest_status_id = 2, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1939;
update floods.crossing set latest_status_update_id = 1940, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1940;
update floods.crossing set latest_status_update_id = 1941, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1941;
update floods.crossing set latest_status_update_id = 1942, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1942;
update floods.crossing set latest_status_update_id = 1943, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1943;
update floods.crossing set latest_status_update_id = 1944, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1944;
update floods.crossing set latest_status_update_id = 1945, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1945;
update floods.crossing set latest_status_update_id = 1946, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1946;
update floods.crossing set latest_status_update_id = 1947, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1947;
update floods.crossing set latest_status_update_id = 1948, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1948;
update floods.crossing set latest_status_update_id = 1949, latest_status_id = 1, latest_status_created_at = '2017-09-03T09:27:57Z' where id = 1949;

commit;
