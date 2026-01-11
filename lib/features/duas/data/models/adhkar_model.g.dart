// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adhkar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Adhkar _$AdhkarFromJson(Map<String, dynamic> json) => Adhkar(
  category: json['category'] as String,
  count: json['count'] as String,
  description: json['description'] as String,
  reference: json['reference'] as String,
  content: json['content'] as String,
);

Map<String, dynamic> _$AdhkarToJson(Adhkar instance) => <String, dynamic>{
  'category': instance.category,
  'count': instance.count,
  'description': instance.description,
  'reference': instance.reference,
  'content': instance.content,
};
