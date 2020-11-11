import 'package:charts_flutter/flutter.dart' as charts;
import 'package:fisheller_app/models/market.dart';
import 'package:fisheller_app/models/seafood_type.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'models/Tag.dart';
import 'models/seafood.dart';
import 'models/sell.dart';
import 'models/vendor.dart';

/// ************************* Theme Colours ***************************/
const PRIMARY_COLOUR = Color(0xFF00847C); // GREEN
const SECONDARY_COLOUR = Color(0x00E2E2E2); // DARK GRAY
const SALMON_COLOUR = Color(0xFFfd766f);
const WHITE_COLOUR = Colors.white;

const CHART_PRIMARY_COLOUR = charts.Color(r: 15,g: 115,b: 105);
const CHART_SECONDARY_COLOUR = charts.Color(r: 46,g: 46,b: 46);

/// ************************* Google Maps ***************************/
const LatLng FIXE_FIXE_LOCATION = LatLng(37.133966, -8.530302);
const LatLng DOCA_PORT_LOCATION = LatLng(37.128389, -8.531901);
const LatLng LISBON_LOCATION = LatLng(38.736946, -9.142685);
const double CAMERA_ZOOM = 16;

/// ************************* Market Filter ***************************/
const List<String> CATEGORIES = <String> ['AQUACULTURE', 'IMPORTED', 'SEA'];
const List<String> SEAFOODS = <String> ['CODFISH', 'LOBSTER','SEA BASS'];

/// ************************* Vendors *******************************/

Vendor julio = Vendor(
    name: "Júlio Adamator",
    image: null,
);
Vendor josefina = Vendor(
    name: "Josefina Peixeira",
    image: null,
);

/// ************************* Sells ******************************/
List<String> m = ["assets/images/sea_bass.png"];
/// ********** Market_Fixe_Fixe ***************/
Seafood sea_bass = Seafood(
  type: Seafood_Type.sea_bass,
  media: m,
  price: 15,
  quantityMass: 8,
  quantityUnits: 10,
  tags: [Tag.fish, Tag.aquaculture],
);

Sell julio_bass = Sell(
    seafood: sea_bass,
    vendor: julio
);

Seafood lobster = Seafood(
  type: Seafood_Type.lobster,
  media: null,
  price: 30,
  quantityMass: 8,
  quantityUnits: 5,
  tags: [Tag.shellfish, Tag.sea],
);

Sell julio_lobster = Sell(
    seafood: lobster,
    vendor: julio
);

Seafood cod = Seafood(
  type: Seafood_Type.cod_fish,
  media: null,
  price: 10,
  quantityMass: 10,
  quantityUnits: 5,
  tags: [Tag.fish, Tag.imported],
);

Sell julio_cod = Sell(
    seafood: cod,
    vendor: julio
);
List<Sell> market_fixe_items = [
  julio_bass,
  julio_lobster,
  julio_cod
];
/// ********** Market_Doca ***************/

Seafood sea_bass2 = Seafood(
  type: Seafood_Type.sea_bass,
  media: null,
  price: 16,
  quantityMass: 7,
  quantityUnits: 10,
  tags: [Tag.fish, Tag.sea],
);

Sell josefina_bass = Sell(
    seafood: sea_bass2,
    vendor: julio
);

Seafood lobster2 = Seafood(
  type: Seafood_Type.lobster,
  media: null,
  price: 35,
  quantityMass: 6,
  quantityUnits: 4,
  tags: [Tag.shellfish, Tag.sea],
);

Sell josefina_lobster = Sell(
    seafood: sea_bass2,
    vendor: julio
);

Seafood cod2 = Seafood(
  type: Seafood_Type.cod_fish,
  media: null,
  price: 11,
  quantityMass: 10,
  quantityUnits: 5,
  tags: [Tag.fish, Tag.imported],
);

Sell josefina_cod = Sell(
    seafood: cod2,
    vendor: julio
);

List<Sell> market_doca_items = [
  josefina_bass,
  josefina_lobster,
  josefina_cod
];

/// ************************* Markets *******************************/
Market fixeFixe_market = Market(
    mapLocation: LatLng(37.133966, -8.530302),
    image: Image.asset(""),
    items: market_fixe_items,
    name: "Fixe Fixe era ser Fish"
);

Market docaPortimao_market = Market(
    mapLocation: LatLng(37.128389, -8.531901),
    image: Image.asset(""),
    items: market_doca_items,
    name: "Doca Portimão"
);

List<Market> markets = [fixeFixe_market, docaPortimao_market];
