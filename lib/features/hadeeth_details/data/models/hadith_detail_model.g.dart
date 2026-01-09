// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hadith_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HadithDetailResponse _$HadithDetailResponseFromJson(
  Map<String, dynamic> json,
) => HadithDetailResponse(
  id: json['id'] as String,
  title: json['title'] as String,
  hadeeth: json['hadeeth'] as String,
  attribution: json['attribution'] as String,
  grade: json['grade'] as String,
  explanation: json['explanation'] as String,
  hints: (json['hints'] as List<dynamic>).map((e) => e as String).toList(),
  categories: (json['categories'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  translations: (json['translations'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  wordsMeanings: (json['words_meanings'] as List<dynamic>)
      .map((e) => WordMeaning.fromJson(e as Map<String, dynamic>))
      .toList(),
  reference: json['reference'] as String,
);

Map<String, dynamic> _$HadithDetailResponseToJson(
  HadithDetailResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'hadeeth': instance.hadeeth,
  'attribution': instance.attribution,
  'grade': instance.grade,
  'explanation': instance.explanation,
  'hints': instance.hints,
  'categories': instance.categories,
  'translations': instance.translations,
  'words_meanings': instance.wordsMeanings,
  'reference': instance.reference,
};

WordMeaning _$WordMeaningFromJson(Map<String, dynamic> json) => WordMeaning(
  word: json['word'] as String,
  meaning: json['meaning'] as String,
);

Map<String, dynamic> _$WordMeaningToJson(WordMeaning instance) =>
    <String, dynamic>{'word': instance.word, 'meaning': instance.meaning};
