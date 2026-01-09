import '../../data/models/hadith_detail_model.dart';

class HadeethDtailsData{
  final String id;
  final String title;
  final String hadeeth;
  final String attribution;
  final String grade;
  final String explanation;
  final List<String> hints;
  final List<WordMeaning> wordsMeanings;
  final String reference;



  HadeethDtailsData({required this.id, required this.title, required this.hadeeth, required this.attribution, required this.grade, required this.explanation, required this.hints,required this.wordsMeanings, required this.reference});
}