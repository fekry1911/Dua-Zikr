import '../../domain/entity/hadeeth_data.dart';
import '../models/hadith_model.dart';

extension HadeethMapper on Hadith  {
  HadeethData toEntity() {
    return HadeethData(id: id, title: title);
  }
}
extension HadeethDataMapper on HadeethData {
  Hadith toModel() {
    return Hadith(
      id: id,
      title: title,
      translations: [], // لو عندك ترجمة ممكن تضيفها
    );
  }
}