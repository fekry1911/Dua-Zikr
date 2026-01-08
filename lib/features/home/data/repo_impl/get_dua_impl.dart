import 'package:dua_zekr/features/home/data/models/dua_model.dart';
import 'package:dua_zekr/features/home/data/service/get_dua.dart';
import 'package:dua_zekr/features/home/domain/repos/get_dua.dart';

class GetDuaImpl extends GetDua {
  final GetDuaService data;

  GetDuaImpl(this.data);

  @override
  Future<List<Dua>> getDua() async {
    final duaList = await data.getDua();
    return duaList;
  }
}
