// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dua_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dua _$DuaFromJson(Map<String, dynamic> json) => Dua(
  id: (json['id'] as num).toInt(),
  text: json['text'] as String,
  reason: json['reason'] as String,
);

Map<String, dynamic> _$DuaToJson(Dua instance) => <String, dynamic>{
  'id': instance.id,
  'text': instance.text,
  'reason': instance.reason,
};
