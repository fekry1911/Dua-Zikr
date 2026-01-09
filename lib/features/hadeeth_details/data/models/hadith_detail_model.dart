import 'package:json_annotation/json_annotation.dart';

part 'hadith_detail_model.g.dart';

@JsonSerializable()
class HadithDetailResponse {
  final String id;
  final String title;
  final String hadeeth;
  final String attribution;
  final String grade;
  final String explanation;
  final List<String> hints;
  final List<String> categories;
  final List<String> translations;

  @JsonKey(name: 'words_meanings')
  final List<WordMeaning> wordsMeanings;

  final String reference;

  HadithDetailResponse({
    required this.id,
    required this.title,
    required this.hadeeth,
    required this.attribution,
    required this.grade,
    required this.explanation,
    required this.hints,
    required this.categories,
    required this.translations,
    required this.wordsMeanings,
    required this.reference,
  });

  factory HadithDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$HadithDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HadithDetailResponseToJson(this);

  // Helper getters
  bool get isAuthentic => grade == 'صحيح';
  bool get isHasan => grade == 'حسن';
  bool get hasHints => hints.isNotEmpty;
  bool get hasWordsMeanings => wordsMeanings.isNotEmpty;
  int get translationsCount => translations.length;

  // Get category IDs as integers
  List<int> get categoryIds => categories.map((c) => int.parse(c)).toList();

  // Get formatted references as list
  List<String> get referenceList => reference.split('\n').where((r) => r.trim().isNotEmpty).toList();
}

@JsonSerializable()
class WordMeaning {
  final String word;
  final String meaning;

  WordMeaning({
    required this.word,
    required this.meaning,
  });

  factory WordMeaning.fromJson(Map<String, dynamic> json) =>
      _$WordMeaningFromJson(json);
  Map<String, dynamic> toJson() => _$WordMeaningToJson(this);

}
