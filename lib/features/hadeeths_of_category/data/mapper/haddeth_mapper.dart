import '../../domain/entity/hadeeth_data.dart';
import '../models/hadith_model.dart';

extension HadeethMapper on Hadith  {
  HadeethData toEntity() {
    return HadeethData(id: id, title: title);
  }
}
