
import 'package:fisheller_app/models/Tag.dart';
import 'package:fisheller_app/models/seafood_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'seafood.g.dart';

@JsonSerializable(explicitToJson: true)
class Seafood{
  Seafood_Type type;
  List<Tag> tags;
  double price;
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
  factory Seafood.fromJson(Map<String, dynamic> json) => _$SeafoodFromJson(json);
  Map<String, dynamic> toJson() => _$SeafoodToJson(this);

}