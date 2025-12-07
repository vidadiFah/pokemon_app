import 'package:json_annotation/json_annotation.dart';

part 'character_model.g.dart';

@JsonSerializable()
class CharacterModel {
  final String fullName;
  final String image;
  final String birthdate;

  CharacterModel(this.fullName, this.image, this.birthdate);

  factory CharacterModel.fromJson(Map<String, dynamic> json) => _$CharacterModelFromJson(json);
}