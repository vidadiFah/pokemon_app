import 'package:json_annotation/json_annotation.dart';

part 'spell_model.g.dart';

@JsonSerializable()
class SpellModel {
  final String spell;
  final String use;

  SpellModel(this.spell, this.use);

  factory SpellModel.fromJson(Map<String, dynamic> json) => _$SpellModelFromJson(json);
}