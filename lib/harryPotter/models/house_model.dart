import 'package:json_annotation/json_annotation.dart';

part 'house_model.g.dart';

@JsonSerializable()
class HouseModel {
  final String house;
  final String founder;
  final String animal;

  HouseModel(this.animal, this.founder, this.house);
  factory HouseModel.fromJson(Map<String, dynamic> json) => _$HouseModelFromJson(json);
}