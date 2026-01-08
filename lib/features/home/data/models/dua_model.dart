import 'package:json_annotation/json_annotation.dart';

part 'dua_model.g.dart';

@JsonSerializable()
class Dua {
  final int id;
  final String text;
  final String reason;

  Dua({
    required this.id,
    required this.text,
    required this.reason,
  });

  /// Connect the generated [_$DuaFromJson] function to the `fromJson` factory.
  factory Dua.fromJson(Map<String, dynamic> json) => _$DuaFromJson(json);

}