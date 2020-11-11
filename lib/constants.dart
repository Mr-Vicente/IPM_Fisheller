import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// ************************* Theme Colours ***************************/
const PRIMARY_COLOUR = Color(0xFF00847C); // GREEN
const SECONDARY_COLOUR = Color(0x00E2E2E2); // DARK GRAY
const SALMON_COLOUR = Color(0xFFfd766f);
const WHITE_COLOUR = Colors.white;

/// ************************* Google Maps ***************************/
const LatLng FIXE_FIXE_LOCATION = LatLng(37.133966, -8.530302);
const LatLng DOCA_PORT_LOCATION = LatLng(37.128389, -8.531901);
const LatLng LISBON_LOCATION = LatLng(38.736946, -9.142685);
const double CAMERA_ZOOM = 16;

/// ************************* Market Filter ***************************/
const List<String> CATEGORIES = <String> ['AQUACULTURE', 'IMPORTED', 'SEA'];
const List<String> SEAFOODS = <String> ['CODFISH', 'LOBSTER','SEA BASS'];