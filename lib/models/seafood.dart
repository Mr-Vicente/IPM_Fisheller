import 'package:fisheller_app/models/Tag.dart';
import 'package:fisheller_app/models/seafood_type.dart';

class Seafood{
  Seafood_Type type;
  List<Tag> tags;
  int price;
  int quantityUnits;
  double quantityMass;
  List<String> media;
  String description;

  Seafood({
    this.type,
    this.tags,
    this.price,
    this.quantityUnits,
    this.quantityMass,
    this.media,
    this.description
  });

  List<String> tagsToString(){
    List<String> aux = List<String>();
    tags.forEach((t) {
      aux.add(t.name.toLowerCase().trim());
    });
    return aux;
  }
}