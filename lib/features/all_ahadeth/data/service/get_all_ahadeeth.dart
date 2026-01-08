import 'package:dio/dio.dart';
import 'package:dua_zekr/core/network/error_exception.dart';
import 'package:dua_zekr/features/home/data/models/hadith_category.dart';

import '../../../../core/const/api_ahadish_const.dart';

class GetAllAhadeeeth {
  Dio dio;

  GetAllAhadeeeth(this.dio);

  Future<List<HadithCategory>> getAllAhadeeeth() async {
    try {
      Response response = await dio.get(ApiAhadithConst.allCate);
      if (response.statusCode == 200) {
        final data = response.data as List;
        List<HadithCategory> categories = data
            .map((e) => HadithCategory.fromJson(e))
            .toList();
        return categories;
      } else {
        throw ServerException();
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw NetWorkException();
      }
      throw ServerException();
    }
  }
}
