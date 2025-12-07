// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookModel _$BookModelFromJson(Map<String, dynamic> json) => BookModel(
  json['originalTitle'] as String,
  json['description'] as String,
  (json['pages'] as num).toInt(),
  json['cover'] as String,
);

Map<String, dynamic> _$BookModelToJson(BookModel instance) => <String, dynamic>{
  'originalTitle': instance.originalTitle,
  'description': instance.description,
  'pages': instance.pages,
  'cover': instance.cover,
};
