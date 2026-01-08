import 'package:dartz/dartz.dart';
import 'package:dua_zekr/core/network/error_exception.dart';
import 'package:dua_zekr/core/network/failuer.dart';

import '../../domain/repos/get_categories.dart';
import '../models/hadith_category.dart';
import '../service/get_categories_service.dart';

class GetAllCategoriesImpl extends GetAllCategories {
  GetCategoriesService api;

  GetAllCategoriesImpl(this.api);

  @override
  Future<Either<Failure, List<HadithCategory>>> getAllCategories() async {
    try {
      List<HadithCategory> result = await api.getAllCategories();
      return right(result);
    } on NetWorkException catch (e) {
      return left(NetWorkFailuer(e.toString()));
    } on ServerException catch (e) {
      return left(ServerFailuer(e.toString()));
    }
  }
}
