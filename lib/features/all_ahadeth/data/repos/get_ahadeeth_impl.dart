import 'package:dartz/dartz.dart';
import 'package:dua_zekr/core/network/error_exception.dart';
import 'package:dua_zekr/core/network/failuer.dart';
import 'package:dua_zekr/features/all_ahadeth/domain/get_ahadeeth_list.dart';
import 'package:dua_zekr/features/home/data/models/hadith_category.dart';

import '../service/get_all_ahadeeth.dart';

class GetAllAhadeethList extends GetAhadeethList {
  GetAllAhadeeeth api;

  GetAllAhadeethList(this.api);

  @override
  Future<Either<Failure, List<HadithCategory>>> getAllAhadeeth() async {
    try {
      List<HadithCategory> result = await api.getAllAhadeeeth();
      return right(result);
    } on NetWorkException catch (e) {
      return left(NetWorkFailuer(e.toString()));
    } on ServerException catch (e) {
      return left(ServerFailuer(e.toString()));
    }
  }
}
