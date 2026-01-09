// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hadith_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HadithResponse _$HadithResponseFromJson(Map<String, dynamic> json) =>
    HadithResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => Hadith.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HadithResponseToJson(HadithResponse instance) =>
    <String, dynamic>{'data': instance.data, 'meta': instance.meta};

Hadith _$HadithFromJson(Map<String, dynamic> json) => Hadith(
  id: json['id'] as String,
  title: json['title'] as String,
  translations: (json['translations'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$HadithToJson(Hadith instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'translations': instance.translations,
};

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
  currentPage: json['current_page'] as String,
  lastPage: (json['last_page'] as num).toInt(),
  totalItems: (json['total_items'] as num).toInt(),
  perPage: json['per_page'] as String,
);

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
  'current_page': instance.currentPage,
  'last_page': instance.lastPage,
  'total_items': instance.totalItems,
  'per_page': instance.perPage,
};
