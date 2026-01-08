import 'package:json_annotation/json_annotation.dart';

part 'hadith_category.g.dart';

@JsonSerializable()
class HadithCategory {
  final String id;
  final String title;
  @JsonKey(name: 'hadeeths_count')
  final String hadeethsCount;
  @JsonKey(name: 'parent_id')
  final String? parentId;

  HadithCategory({
    required this.id,
    required this.title,
    required this.hadeethsCount,
    this.parentId,
  });

  factory HadithCategory.fromJson(Map<String, dynamic> json) =>
      _$HadithCategoryFromJson(json);
}
