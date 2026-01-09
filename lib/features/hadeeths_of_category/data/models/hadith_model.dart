import 'package:json_annotation/json_annotation.dart';

part 'hadith_model.g.dart';

@JsonSerializable()
class HadithResponse {
  final List<Hadith> data;
  final Meta meta;

  HadithResponse({
    required this.data,
    required this.meta,
  });

  factory HadithResponse.fromJson(Map<String, dynamic> json) =>
      _$HadithResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HadithResponseToJson(this);
}

@JsonSerializable()
@JsonSerializable()
class Hadith {
  final String id;
  final String title;
  final List<String> translations;

  Hadith({
    required this.id,
    required this.title,
    required this.translations,
  });

  factory Hadith.fromJson(Map<String, dynamic> json) => Hadith(
    id: json['id'] as String,
    title: json['title'] as String,
    translations: (json['translations'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList() ??
        [], // لو مش موجودة خليها قائمة فاضية
  );

  Map<String, dynamic> toJson() => _$HadithToJson(this);
}

@JsonSerializable()
class Meta {
  @JsonKey(name: 'current_page')
  final String currentPage;

  @JsonKey(name: 'last_page')
  final int lastPage;

  @JsonKey(name: 'total_items')
  final int totalItems;

  @JsonKey(name: 'per_page')
  final String perPage;

  Meta({
    required this.currentPage,
    required this.lastPage,
    required this.totalItems,
    required this.perPage,
  });

  factory Meta.fromJson(Map<String, dynamic> json) =>
      _$MetaFromJson(json);


  // Convenient getters for type conversion
  int get currentPageInt => int.parse(currentPage);
  int get perPageInt => int.parse(perPage);

  // Check if there are more pages
  bool get hasNextPage => currentPageInt < lastPage;
  bool get hasPreviousPage => currentPageInt > 1;
}