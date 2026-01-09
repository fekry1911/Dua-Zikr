import '../../domain/entity/hadeeth_data.dart';
import '../models/hadith_detail_model.dart';

extension HadeethDetailsMapper on HadithDetailResponse {
  HadeethDtailsData toEntity() {
    return HadeethDtailsData(
      id: id,
      title: title,
      hadeeth: hadeeth,
      attribution: attribution,
      grade: grade,
      explanation: explanation,
      hints: hints,
      wordsMeanings: wordsMeanings,
      reference: reference,
    );
  }
}
