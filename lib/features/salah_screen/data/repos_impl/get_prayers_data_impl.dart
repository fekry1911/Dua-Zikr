import 'package:dartz/dartz.dart';
import 'package:dua_zekr/core/network/failuer.dart';
import 'package:dua_zekr/features/salah_screen/data/mapper/prayer_response_to_data.dart';

import '../../../../core/network/error_exception.dart';
import '../../doamin/entity/prayer_data.dart';
import '../../doamin/repo/repos.dart';
import '../service/get_prayer_times.dart';

class GetPrayersDataImpl extends GetPrayTimesRepo {
  GetPrayerTimesService data;

  GetPrayersDataImpl(this.data);

  @override
  Future<Either<Failure, PrayerData>> getPrayerTimes(
    double lat,
    double lng,
  ) async {
    try {
      var result = await data.getPrayerTimes(lat: lat, lng: lng);
      return Right(result.data.toEntity());
    } on NetWorkException catch (e) {
      return left(NetWorkFailuer(e.toString()));
    } on ServerException catch (e) {
      return left(ServerFailuer(e.toString()));
    }
  }
}
