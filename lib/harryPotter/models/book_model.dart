import 'package:json_annotation/json_annotation.dart';

part 'book_model.g.dart';

@JsonSerializable()
class BookModel {
  final String originalTitle;
  final String description;
  final int pages;
  final String cover;

  BookModel(this.originalTitle, this.description, this.pages, this.cover);
  factory BookModel.fromJson(Map<String, dynamic> json) => _$BookModelFromJson(json);
}