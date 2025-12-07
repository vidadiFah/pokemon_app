// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HouseModel _$HouseModelFromJson(Map<String, dynamic> json) => HouseModel(
  json['animal'] as String,
  json['founder'] as String,
  json['house'] as String,
);

Map<String, dynamic> _$HouseModelToJson(HouseModel instance) =>
    <String, dynamic>{
      'house': instance.house,
      'founder': instance.founder,
      'animal': instance.animal,
    };
