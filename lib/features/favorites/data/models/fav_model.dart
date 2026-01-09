import 'package:json_annotation/json_annotation.dart';
import '../../../hadeeth_details/domain/entity/hadeeth_data.dart';
import '../../../hadeeth_details/data/models/hadith_detail_model.dart';

part 'fav_model.g.dart';

@JsonSerializable(explicitToJson: true)
class FavModel extends HadeethDtailsData {
  final String category;

  FavModel({
    required super.id,
    required super.title,
    required super.hadeeth,
    required super.attribution,
    required super.grade,
    required super.explanation,
    required super.hints,
    required super.wordsMeanings,
    required super.reference,
    required this.category,
  });

  factory FavModel.fromJson(Map<String, dynamic> json) =>
      _$FavModelFromJson(json);

  Map<String, dynamic> toJson() => _$FavModelToJson(this);
}
