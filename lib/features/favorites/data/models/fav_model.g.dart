// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fav_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavModel _$FavModelFromJson(Map<String, dynamic> json) => FavModel(
  id: json['id'] as String,
  title: json['title'] as String,
  hadeeth: json['hadeeth'] as String,
  attribution: json['attribution'] as String,
  grade: json['grade'] as String,
  explanation: json['explanation'] as String,
  hints: (json['hints'] as List<dynamic>).map((e) => e as String).toList(),
  wordsMeanings: (json['wordsMeanings'] as List<dynamic>)
      .map((e) => WordMeaning.fromJson(e as Map<String, dynamic>))
      .toList(),
  reference: json['reference'] as String,
  category: json['category'] as String,
);

Map<String, dynamic> _$FavModelToJson(FavModel instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'hadeeth': instance.hadeeth,
  'attribution': instance.attribution,
  'grade': instance.grade,
  'explanation': instance.explanation,
  'hints': instance.hints,
  'wordsMeanings': instance.wordsMeanings.map((e) => e.toJson()).toList(),
  'reference': instance.reference,
  'category': instance.category,
};
