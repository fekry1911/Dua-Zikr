import 'package:dua_zekr/features/duas/data/models/adhkar_model.dart';
import 'package:dua_zekr/features/duas/domain/repos/get_duas_cate.dart';

import '../service/get_duas_service.dart';

class GetAllDuasOfCateImpl extends GetDuasOfCate {
  GetAllDuaService data;

  GetAllDuasOfCateImpl(this.data);

  @override
  Future<List<Adhkar>> getAllDausOfCate(String assetFile) async {
    try {
      return await data.getDuas(assetFile);
    } catch (e) {
      print(e);
      return [];
    }
  }
}
