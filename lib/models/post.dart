import 'package:fisheller_app/models/vendor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable(explicitToJson: true)
class Post{
  /*static int idCounter = 0;
  int id;*/
  String title;
  String description;
  List<String> imagesNames;
  Vendor vendor;

  Post(String title, String description, List<String> imagesNames, Vendor vendor){
    this.title = title;
    this.description = description;
    this.imagesNames = imagesNames;
    this.vendor = vendor;
    //this.id = idCounter++;
  }


  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);

}