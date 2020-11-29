
import 'dart:collection';

import 'package:fisheller_app/models/User.dart';
import 'package:fisheller_app/models/consumer.dart';
import 'package:fisheller_app/models/market.dart';
import 'package:fisheller_app/models/order.dart';
import 'package:fisheller_app/models/post.dart';
import 'package:fisheller_app/models/seafood_type.dart';
import 'package:fisheller_app/models/recipies.dart';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'models/Tag.dart';
import 'models/seafood.dart';
import 'models/sell.dart';
import 'models/vendor.dart';
import 'models/fish_and_tips.dart';

/// ************************* Theme Colours ***************************/
const PRIMARY_COLOUR = Color(0xFF00847C); // GREEN
const SECONDARY_COLOUR = Color.fromRGBO(35, 35, 35, 1.0); // DARK GRAY
const SALMON_COLOUR = Color(0xFFfd766f);
const WHITE_COLOUR = Colors.white;
const LIGHT_GRAY_COLOUR = Color.fromRGBO(167, 188, 214, 1.0);
/// ************************* POPUPS TEXTS ***************************/

const String TEXT_QUESTION_COMFIRM = "Are you sure you want to book?";
const String TEXT_NOTE_COMFIRM = "The deposit (%2.2f€) will be discounted from your account";

const String TEXT_QUESTION_CANCEL = "Are you sure you want to cancel?";
const String TEXT_NOTE_CANCEL = "The deposit (%2.2f€) will not be reimbursed?";

const String FINALISE_BUY = "Finalise Buy";
const String FINALISE_SEAFOOD = "Seafood: %s";
const String FINALISE_Quantity = "Quantity: %2.2f %s";
const String FINALISE_Weight = "Weight: %2.2f Kg";
const String FINALISE_TOTAL = "Total: %2.2f €";

/// ************************* Google Maps ***************************/
const LatLng FIXE_FIXE_LOCATION = LatLng(37.133966, -8.530302);
const LatLng DOCA_PORT_LOCATION = LatLng(37.128389, -8.531901);
const LatLng LISBON_LOCATION = LatLng(38.736946, -9.142685);
const LatLng PORTIMAO_LOCATION = LatLng(37.131041, -8.530654);
const double CAMERA_ZOOM = 16;

/// ************************* Market Filter ***************************/
const List<String> CATEGORIES = <String> ['AQUACULTURE', 'FISH', 'IMPORTED', 'SEA', 'SHELLFISH'];
const List<String> SEAFOODS = <String> ['COD FISH', 'LOBSTER','SEA BASS', 'TUNA'];

/// ************************* Consumers *****************************/

Consumer ana = new Consumer(
  name: "Ana Miguel", //name
  email: "ana@gmail.com", //email
  password: "1234", //password
  bookings: new List<Order>(),
  following: new List<User>(),
  purchases: new List<Order>(),
);
Consumer hakeem = new Consumer(
  name: "Hakeem Pedro",
  email: "hakeem@gmail.com", //email
  password: "1234", //password
  bookings: new List<Order>(),
  following: new List<User>(),
  purchases: new List<Order>(),
);

/// ************************* Vendors *******************************/

Vendor julio = new Vendor(
  "Júlio Adamastor", //name
  "julio@gmail.com", //email
  "1234", //password
  "assets/images/julio.png",
);
Vendor josefina = new Vendor(
  "Josefina Peixeira",
  "josefina@gmail.com", //email
  "1234", //password
  "assets/images/josefina.png",
);

/// ************************* Sells ******************************/
List<String> seaBassMedia = ["assets/images/sea_bass.png", "assets/images/seabass2.png", "assets/images/seabass3.png"];
List<String> lobsterMedia = ["assets/images/lobster.png", "assets/images/lobster2.png"];
List<String> codMedia = ["assets/images/cod.png", "assets/images/cod2.png", "assets/images/cod3.png"];

const String FISH_DISCRIPTION = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus volutpat nisl augue, vitae viverra nibh imperdiet et. Donec quis tortor erat. Aliquam elementum elementum elit, vitae bibendum nunc imperdiet at."
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus volutpat nisl augue, vitae viverra nibh imperdiet et. Donec quis tortor erat. Aliquam elementum elementum elit, vitae bibendum nunc imperdiet at."

;

/// ********** Market_Fixe_Fixe ***************/
Seafood seabass = new Seafood(
  type: Seafood_Type.sea_bass,
  media: seaBassMedia,
  price: 15,
  quantityMass: 8,
  quantityUnits: 10,
  tags: [Tag.fish, Tag.aquaculture],
  description: FISH_DISCRIPTION
);

Sell julioBass = new Sell(
    seafood: seabass,
    vendor: julio
);

Seafood lobster = new Seafood(
  type: Seafood_Type.lobster,
  media: lobsterMedia,
  price: 30,
  quantityMass: 8,
  quantityUnits: 5,
  tags: [Tag.shellfish, Tag.sea],
  description: FISH_DISCRIPTION
);

Sell julioLobster = new Sell(
    seafood: lobster,
    vendor: julio
);

Seafood cod = new Seafood(
  type: Seafood_Type.cod_fish,
  media: codMedia,
  price: 10,
  quantityMass: 10,
  quantityUnits: 5,
  tags: [Tag.fish, Tag.imported],
  description: FISH_DISCRIPTION
);

Sell julioCod = new Sell(
    seafood: cod,
    vendor: julio
);
List<Sell> market_fixe_items = [
  julioBass,
  julioLobster,
  julioCod
];
/// ********** Market_Doca ***************/

Seafood seaBass2 = new Seafood(
    type: Seafood_Type.sea_bass,
    media: seaBassMedia,
    price: 16,
    quantityMass: 7,
    quantityUnits: 10,
    tags: [Tag.fish, Tag.sea],
    description: FISH_DISCRIPTION
);

Sell josefinaBass = new Sell(
  seafood: seaBass2,
  vendor: josefina,
);

Seafood lobster2 = new Seafood(
    type: Seafood_Type.lobster,
    media: lobsterMedia,
    price: 35,
    quantityMass: 6,
    quantityUnits: 4,
    tags: [Tag.shellfish, Tag.sea],
    description: FISH_DISCRIPTION
);

Sell josefinaLobster = new Sell(
    seafood: lobster2,
    vendor: josefina
);

Seafood cod2 = new Seafood(
    type: Seafood_Type.cod_fish,
    media: codMedia,
    price: 11,
    quantityMass: 10,
    quantityUnits: 5,
    tags: [Tag.fish, Tag.imported],
    description: FISH_DISCRIPTION
);

Sell josefinaCod = new Sell(
  seafood: cod2,
  vendor: josefina,
);

List<Sell> market_doca_items = [
  josefinaBass,
  josefinaLobster,
  josefinaCod
];

/// ************************* Markets *******************************/
Market fixeFixe_market = Market(
    mapLocation: LatLng(37.133966, -8.530302),
    imageName: "",
    items: market_fixe_items,
    name: "Fixe Fixe era ser Fish"
);

Market docaPortimao_market = Market(
    mapLocation: LatLng(37.128389, -8.531901),
    imageName: "",
    items: market_doca_items,
    name: "Doca Portimão"
);

List<Market> markets = [fixeFixe_market, docaPortimao_market];

/// ************************* FishNTips *******************************/

Map<Seafood_Type, FishNTips> seafoodTips = {
  Seafood_Type.lobster: lobsterTips,
  Seafood_Type.sea_bass: seaBassTips,
  Seafood_Type.cod_fish: codTips
};


/// ************ Lobster ************/
List<String> lobsterNutrition = <String>["Vitamin A", "Vitamin B12",
  "Vitamin E", "Calcium", "Iron", "..."];

List<String> lobsterFun = <String>[
  "The rarest colour of lobster is white and the odds of catching one is one in a hundred-million",
  "Lobster helps protect against depression"
];

Recipe lobsterRec1 = Recipe("Lobster with Thermidor Butter", 
'https://www.bbcgoodfood.com/recipes/lobster-thermidor-butter',
    'assets/images/LobsterThermidor.png');

Recipe lobsterRec2 = Recipe('Ultimate Lobster Rolls',
    'https://www.bonappetit.com/recipe/bas-ultimate-lobster-rolls',
    'assets/images/LobsterRolls.png');

List<Recipe> lobsterRecipies = <Recipe>[lobsterRec1, lobsterRec2];

FishNTips lobsterTips = FishNTips(
    Seafood_Type.lobster,
    450, 400, 3.88, 85.3,
    lobsterNutrition,
    lobsterFun,
    lobsterRecipies);

/// ************ Sea Bass ************/
List<String> seaBassNutrition = <String>["Vitamin B6", "Vitamin B12" ,"Phosphorus",
  "Magnesium", "Pantothenic Acid", "Riboflavin", "..."];

List<String> seaBassFun = <String>[
  "Most Black Sea Bass are hermaphrodites functioning first as females and then as males",
  "Giant sea bass can survive around 70 years\tin the wild."
];

Recipe seaBassRec1 = Recipe("Sea Bass & Artichoke Salad",
    'https://www.bbcgoodfood.com/recipes/sea-bass-artichoke-salad',
    'assets/images/SeabassSalad.png');

Recipe seaBassRec2 = Recipe('Baked Sea Bass with Lemon Caper Dressing',
    'https://www.bbcgoodfood.com/recipes/baked-sea-bass-lemon-caper-dressing',
    'assets/images/SeabassLemon.png');

Recipe seaBassRec3 = Recipe('Pan-fried Sea Bass with Ratatouille & Basil',
    'https://www.bbcgoodfood.com/recipes/pan-fried-sea-bass-ratatouille-basil',
    'assets/images/SeaBassFried.png');

List<Recipe> seaBassRecipies = <Recipe>[seaBassRec1, seaBassRec2, seaBassRec3];

FishNTips seaBassTips = FishNTips(
    Seafood_Type.sea_bass,
    600, 582, 12, 110,
    seaBassNutrition,
    seaBassFun,
    seaBassRecipies);

/// ************ Cod ************/
List<String> codNutrition = <String>["Vitamin B6", "Vitamin B12" ,"Phosphorus",
  "Selenium", "..."];

List<String> codFun = <String>[
  "Humans are the only natural enemies of adult cods.",
  "Cods are slow swimmers that live in large groups called schools.",
  "Age of cod can be determined by the number of rings that are visible on the skull."
];

Recipe codRec1 = Recipe("Bacalhau à Brás",
    'https://www.pingodoce.pt/receitas/bacalhau-a-bras/',
    'assets/images/CodBras.png');

List<Recipe> codRecipies = <Recipe>[codRec1];

FishNTips codTips = FishNTips(
    Seafood_Type.cod_fish,
    500, 530, 5.88, 112,
    codNutrition,
    codFun,
    codRecipies);

/// ************************* Posts *******************************/

Post post1 = new Post(
  "Paz da Natureza!",
  "O sol estridente aquece os peixes, aquece a minha alma",
  ["assets/images/post1.png"],
  julio,
);

Post post2 = new Post(
  "Pesca-Corrida",
  "Dia de corrida entre pescadores",
  ["assets/images/post2.png"],
  josefina,
);

List<Post> posts = <Post>[
  post1,
  post2
];

