import 'package:fisheller_app/models/recipies.dart';
import 'package:fisheller_app/models/seafood_type.dart';

class FishNTips{
  Seafood_Type type;
  double avrgWeight, kcal, fat, protein;
  List<String> nutritional;
  List<String> funfacts;
  List<Recipe> recipies;

  FishNTips(
    this.type,
    this.avrgWeight,
    this.kcal,
    this.fat,
    this.protein,
    this.nutritional,
    this.funfacts,
    this.recipies
  );
}