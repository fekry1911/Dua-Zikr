// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hadith_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HadithCategory _$HadithCategoryFromJson(Map<String, dynamic> json) =>
    HadithCategory(
      id: json['id'] as String,
      title: json['title'] as String,
      hadeethsCount: json['hadeeths_count'] as String,
      parentId: json['parent_id'] as String?,
    );

Map<String, dynamic> _$HadithCategoryToJson(HadithCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'hadeeths_count': instance.hadeethsCount,
      'parent_id': instance.parentId,
    };
