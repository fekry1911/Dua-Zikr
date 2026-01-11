import 'package:json_annotation/json_annotation.dart';

part 'adhkar_model.g.dart';

@JsonSerializable()
class Adhkar {
  final String category;
  final String count;
  final String description;
  final String reference;
  final String content;

  Adhkar({
    required this.category,
    required this.count,
    required this.description,
    required this.reference,
    required this.content,
  });

  factory Adhkar.fromJson(Map<String, dynamic> json) => _$AdhkarFromJson(json);

}
