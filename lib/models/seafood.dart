
import 'package:fisheller_app/models/Tag.dart';
import 'package:fisheller_app/models/seafood_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'seafood.g.dart';

@JsonSerializable(explicitToJson: true)
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
  factory Seafood.fromJson(Map<String, dynamic> json) => _$SeafoodFromJson(json);
  Map<String, dynamic> toJson() => _$SeafoodToJson(this);
/*
  Seafood.fromJson(Map<String, dynamic> json){
    type = getSeafoodTypeEnum(json['type']);
    tags = List<Tag>.from(json["tags"].map((x) => getTagEnum(x)));
    price = json['price'];
    quantityUnits = json['quantityUnits'];
    quantityMass = json['quantityMass'];
    media = List<String>.from(json["media"].map((x) => x));
    description  = json['description'];
  }

  Map<String, dynamic> toJson() => {
    'type': type.name,
    'tags': List<dynamic>.from(tags.map((x) => x.name)),
    'price': price,
    'quantityUnits': quantityUnits,
    'quantityMass': quantityMass,
    'media': List<dynamic>.from(media.map((x) => x)),
    'description': description,
  };
*/
}