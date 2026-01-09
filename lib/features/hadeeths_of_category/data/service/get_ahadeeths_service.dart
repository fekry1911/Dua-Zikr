import 'package:dio/dio.dart';
import 'package:dua_zekr/core/network/error_exception.dart';

import '../../../../core/const/api_ahadish_const.dart';
import '../models/hadith_model.dart';

class GetAhadeethsService {
  Dio dio;

  GetAhadeethsService(this.dio);

  Future<HadithResponse> getAllHadeeths({
    required String id,
    String language = "ar",
    String page = "1",
    String per_page = "20",
  }) async {
    try {
      Response response = await dio.get(
        ApiAhadithConst.hadeethsList,
        queryParameters: {
          "category_id": id,
          "language": "ar",
          "page":  int.parse(page),
          "per_page": int.parse(per_page),
        },
      );
      if (response.statusCode == 200) {
        HadithResponse hadithResponse = HadithResponse.fromJson(response.data);
        return hadithResponse;
      }
      throw ServerException();
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.badResponse) {
        throw NetWorkException();
      }
      throw ServerException();
    } catch (e) {
      throw ServerException();
    }
  }
}
