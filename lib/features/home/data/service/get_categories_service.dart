import 'package:dio/dio.dart';
import 'package:dua_zekr/core/const/api_ahadish_const.dart';
import 'package:dua_zekr/core/network/error_exception.dart';

import '../models/hadith_category.dart';

class GetCategoriesService {
  Dio api;

  GetCategoriesService(this.api);

  Future<List<HadithCategory>> getAllCategories() async {
    try {
      Response response = await api.get(ApiAhadithConst.category);
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
      print(e.type);
      if (e.type == DioExceptionType.connectionTimeout) {
        throw NetWorkException();
      }
      throw ServerException();
    } catch (e) {
      print(e);
      throw NetWorkException();
    }
  }
}
