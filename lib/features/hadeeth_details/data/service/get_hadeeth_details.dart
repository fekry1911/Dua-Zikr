import 'package:dio/dio.dart';
import 'package:dua_zekr/core/const/api_ahadish_const.dart';
import 'package:dua_zekr/core/network/error_exception.dart';

import '../models/hadith_detail_model.dart';

class GetHadeethDetailsService {
  Dio dio;

  GetHadeethDetailsService(this.dio);

  Future<HadithDetailResponse> getHadeethDetails(String id) async {
    try {
      Response response = await dio.get(
        ApiAhadithConst.hadeethOne,
        queryParameters: {"id": id},
      );
      if (response.statusCode == 200) {
        return HadithDetailResponse.fromJson(response.data);
      }
      throw ServerException();
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout) {
        throw NetWorkException();
      }
      throw ServerException();
    }
  }
}
