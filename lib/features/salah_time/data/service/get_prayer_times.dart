import 'package:dio/dio.dart';
import 'package:dua_zekr/core/const/api_pray_const.dart';

import '../../../../core/network/error_exception.dart';
import '../models/prayer_times_response.dart';

class GetPrayerTimesService {
  final Dio dio;

  GetPrayerTimesService(this.dio);

  Future<PrayerTimesResponse> getPrayerTimes({
    required double lat,
    required double lng,
  }) async {
    try {
      print("${lat} + $lng");
      final response = await dio.get(
        ApiConstPray.prayerTimes,
        queryParameters: {'latitude': lat, 'longitude': lng, 'method': 5},
      );
      print(response.data);
      return PrayerTimesResponse.fromJson(response.data);
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
